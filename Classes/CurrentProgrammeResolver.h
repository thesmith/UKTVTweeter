#import <Foundation/Foundation.h>

@class Programme;

@interface AtlasClient : NSObject<TTURLRequestDelegate> {
}

- (Programme *) onNow: (NSString*)channel;

@end
