//
//  CurrentInfo.h
//  Partners
//
//  Created by JiaLi on 13-7-5.
//  Copyright (c) 2013年 JiaLi. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "VoicePkgInfoObject.h"

@interface CurrentInfo : NSObject
@property (nonatomic, retain) NSString* currentPkgDataPath;
@property (nonatomic, retain) NSString* currentPkgDataTitle;
@property (nonatomic, assign) NSInteger currentLibID;

+ (CurrentInfo*)sharedCurrentInfo;
- (void)getDeviceID;
- (void)checkLisence:(NSString*)url;
@end
