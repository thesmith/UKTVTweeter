#import "Channel.h"


@implementation Channel
@synthesize key, url, logo, title;

- (Channel *)initFromKey:(NSString *)k {
	self = [super init];
	
	if (self) {
		if ([k isEqualToString:@"bbcone"]) {
			self.key = [[NSString alloc] initWithString:@"bbcone"];
			self.url = [[NSString alloc] initWithString:@"http://www.bbc.co.uk/services/bbcone/london"];
			self.logo = [[NSString alloc] initWithString:@"bbc_one.png"];
			self.title = [[NSString alloc] initWithString:@"BBC One"];
		} else if ([k isEqualToString:@"bbctwo"]) {
			self.key = [[NSString alloc] initWithString:@"bbctwo"];
			self.url = [[NSString alloc] initWithString:@"http://www.bbc.co.uk/services/bbctwo/england"];
			self.logo = [[NSString alloc] initWithString:@"bbc_two.png"];
			self.title = [[NSString alloc] initWithString:@"BBC Two"];
		} else if ([k isEqualToString:@"bbcthree"]) {
			self.key = [[NSString alloc] initWithString:@"bbcthree"];
			self.url = [[NSString alloc] initWithString:@"http://www.bbc.co.uk/services/bbcthree/london"];
			self.logo = [[NSString alloc] initWithString:@"bbc_three.png"];
			self.title = [[NSString alloc] initWithString:@"BBC Three"];
		} else if ([k isEqualToString:@"bbcfour"]) {
			self.key = [[NSString alloc] initWithString:@"bbcfour"];
			self.url = [[NSString alloc] initWithString:@"http://www.bbc.co.uk/services/bbcfour/london"];
			self.logo = [[NSString alloc] initWithString:@"bbc_four.png"];
			self.title = [[NSString alloc] initWithString:@"BBC Four"];
		}
	}
	
	return self;
}

+ (NSArray *)channels {
	return [[NSArray alloc] initWithObjects: 
		[[Channel alloc] initFromKey:@"bbcone"],
		[[Channel alloc] initFromKey:@"bbctwo"],
		[[Channel alloc] initFromKey:@"bbcthree"],
		[[Channel alloc] initFromKey:@"bbcfour"], nil];
}

- (void)dealloc {
	[key release];
	[url release];
	[logo release];
	[title release];
	
	[super dealloc];
}

@end
