#import "Programme.h"
#import "JSON/JSON.h"
#import "Channel.h"

@implementation Programme
@synthesize title, uri, logo, shortenedUrl, channel;

- (Programme *)initFromItem:(NSDictionary *)item withChannel:(Channel *) c {
	self = [super init];
	
	if (self) {
		channel = c;
		NSDictionary *brand = [item objectForKey:@"brand_summary"];
		uri = [[NSString alloc] initWithString:[item objectForKey:@"uri"]];
		
		NSString *thumbnail = [item objectForKey:@"thumbnail"];
		if (thumbnail) {
			logo = [[NSString alloc] initWithString:thumbnail];
		} else {
			logo = [[NSString alloc] initWithString:[item objectForKey:@"image"]];
		}
		
		if (brand != nil) {
			title = [[NSString alloc] initWithFormat:@"%@ - %@", [brand objectForKey:@"title"], [item objectForKey:@"title"]];
		} else {
			title = [[NSString alloc] initWithFormat:@"%@", [item objectForKey:@"title"]];
		}
	}
	
	return self;
}

- (void) dealloc {
	[title release];
	[uri release];
	[logo release];
	[shortenedUrl release];
	[channel release];
	[super dealloc];
}

@end
