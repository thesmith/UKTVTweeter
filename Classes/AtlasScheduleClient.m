#import "AtlasScheduleClient.h"
#import "Programme.h"
#import "JSON/JSON.h"
#import "AtlasScheduleDelegate.h"
#import "Channel.h"

@implementation AtlasScheduleClient
@synthesize delegate, channel;

- (AtlasScheduleClient *)initWithChannel:(Channel *)c andDelegate:(id <AtlasScheduleDelegate>) d {
	self = [super init];
	
	if (self) {
		self.delegate = d;
		self.channel = c;
		
		responseData = [[NSMutableData data] retain];
		NSString *url = [NSString stringWithFormat:@"http://atlasapi.org/2.0/items.json?transmissionTime=now&broadcastOn=%@", channel.url];
		NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:url]];
		[[NSURLConnection alloc] initWithRequest:request delegate:self];
	}
	
	return self;
}

- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response {
	[responseData setLength:0];
}

- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data {
	[responseData appendData:data];
}

- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error {
	if(delegate) {
		[delegate scheduleRequestError:[NSString stringWithFormat:@"Connection failed: %@", [error description]]];
	}
}

- (void)connectionDidFinishLoading:(NSURLConnection *)connection {
	[connection release];
	
	NSString *responseString = [[NSString alloc] initWithData:responseData encoding:NSUTF8StringEncoding];
	[responseData release];
	
	NSError *error;
	SBJsonParser *parser = [[SBJsonParser new] autorelease];
	NSDictionary *results = [parser objectWithString:responseString error:nil];
	[responseString release];
	
	if (results == nil) {
		if(delegate) {
			[delegate scheduleRequestError:[NSString stringWithFormat:@"JSON parsing failed: %@", [error localizedDescription]]];
		}
	} else {
		if(delegate) {
			NSArray *items = [results objectForKey:@"items"];
			if ([items count] > 0) {
				NSDictionary *item = [items objectAtIndex:0];
				Programme *currentProgramme = [[Programme alloc] initFromItem:item withChannel: channel];
				[delegate programmeCurrentlyOn:currentProgramme];
				[currentProgramme release];
			} else {
				[delegate scheduleRequestError:[NSString stringWithString:@"There's currently nothing on this channel"]];
			}
		}
	}
}

- (void) dealloc {
	[channel release];
	[super dealloc];
}

@end
