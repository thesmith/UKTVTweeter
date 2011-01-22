#import <Foundation/Foundation.h>
#import "BitlyDelegate.h"
#import "Programme.h"

@interface BitlyClient : NSObject {
	id <BitlyDelegate> delegate;
	NSMutableData *responseData;
	Programme *programme;
}

@property (nonatomic, retain) id <BitlyDelegate> delegate;
@property (nonatomic, retain) Programme *programme;

- (BitlyClient *)initWithProgramme:(Programme *)programme andDelegate:(id <BitlyDelegate>) d;

@end
