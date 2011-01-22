#import <UIKit/UIKit.h>
#import "Programme.h"

@protocol BitlyDelegate

- (void)programmeWithShortenedUrl:(Programme *)programme;
- (void)bitlyRequestError:(NSString *)error;

@end
