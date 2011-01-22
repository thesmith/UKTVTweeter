//
//  AtlasScheduleDelegate.h
//  UKTVTweeter
//
//  Created by Ben Smith on 04/01/2011.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Programme.h"

@protocol AtlasScheduleDelegate

- (void)programmeCurrentlyOn:(Programme *)programme;
- (void)scheduleRequestError:(NSString *)error;

@end
