#import "BitlyClient.h"
#import "BitlyDelegate.h"
#import "Programme.h"
#import "JSON/JSON.h"

@implementation BitlyClient
@synthesize delegate, programme;

- (BitlyClient *)initWithProgramme:(Programme *)p andDelegate:(id <BitlyDelegate>) d {
	self = [super init];
	
	if (self) {
		self.delegate = d;
		self.programme = p;
		
		responseData = [[NSMutableData data] retain];
		NSString *biltlyUrl = [NSString stringWithFormat:@"http://api.bit.ly/v3/shorten?login=thesmith&apiKey=R_46dce102ab2944cdaa0b390b27add53b&longUrl=%@", programme.uri];
		NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:biltlyUrl]];
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
		[delegate bitlyRequestError:[NSString stringWithFormat:@"Connection failed: %@", [error description]]];
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
			[delegate bitlyRequestError:[NSString stringWithFormat:@"JSON parsing failed: %@", [error localizedDescription]]];
		}
	} else {
		if(delegate) {
			NSDictionary *data = [results objectForKey:@"data"];
			if (data) {
				NSString *shortenedUrl = [NSString stringWithString:[data objectForKey:@"url"]];
				programme.shortenedUrl = shortenedUrl;
				[delegate programmeWithShortenedUrl: programme];
			} else {
				[delegate bitlyRequestError:[NSString stringWithString:@"Bit.ly was unable to shorten the url"]];
			}
		}
	}
}

- (void) dealloc {
	[programme release];
	[super dealloc];
}

@end
