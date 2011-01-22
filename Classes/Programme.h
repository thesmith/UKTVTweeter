#import <Foundation/Foundation.h>
#import "JSON/JSON.h"
#import "Channel.h"

@interface Programme : NSObject {
	NSString *title;
	NSString *uri;
	NSString *logo;
	NSString *shortenedUrl;
	Channel *channel;
}

@property (nonatomic, retain) NSString *title;
@property (nonatomic, retain) NSString *uri;
@property (nonatomic, retain) NSString *logo;
@property (nonatomic, retain) NSString *shortenedUrl;
@property (nonatomic, retain) Channel *channel;

- (Programme *)initFromItem:(NSDictionary *)item withChannel:(Channel *) c;

@end
