#import <UIKit/UIKit.h>
#import "Programme.h"
#import "AtlasScheduleDelegate.h"
#import "AtlasScheduleClient.h"
#import "BitlyDelegate.h"
#import "BitlyClient.h"
#import "Channel.h"

@interface Tweeter : UIViewController<AtlasScheduleDelegate, BitlyDelegate> {
	UITextView *textArea;
	Channel *channel;
	UIActivityIndicatorView *indicator;
	AtlasScheduleClient *scheduleClient;
	BitlyClient *bitlyClient;
}

@property (nonatomic, retain) IBOutlet UIActivityIndicatorView *indicator;
@property (nonatomic, retain) IBOutlet UITextView *textArea;
@property (nonatomic, retain) Channel *channel;
@end
