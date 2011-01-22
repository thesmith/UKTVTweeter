#import <Foundation/Foundation.h>
#import "Programme.h"
#import "AtlasScheduleDelegate.h"
#import "Channel.h"

@interface AtlasScheduleClient : NSObject {
	id <AtlasScheduleDelegate> delegate;
	NSMutableData *responseData;
	Channel *channel;
}

@property (nonatomic, retain) id <AtlasScheduleDelegate> delegate;
@property (nonatomic, retain) Channel *channel;

- (AtlasScheduleClient *)initWithChannel:(Channel *)c andDelegate:(id <AtlasScheduleDelegate>) d;

@end
