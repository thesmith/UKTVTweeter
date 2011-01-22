#import <Foundation/Foundation.h>


@interface Channel : NSObject {
	NSString *key;
	NSString *url;
	NSString *logo;
	NSString *title;
}

@property (nonatomic, retain) NSString *key;
@property (nonatomic, retain) NSString *url;
@property (nonatomic, retain) NSString *logo;
@property (nonatomic, retain) NSString *title;

- (Channel *)initFromKey:(NSString *)k;

+ (NSArray *)channels;

@end
