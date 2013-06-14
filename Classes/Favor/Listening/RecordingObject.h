//
//  RecordingObject.h
//  Partners
//
//  Created by JiaLi on 13-6-13.
//  Copyright (c) 2013年 JiaLi. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Sentence.h"
#import "AQRecorder.h"
#import "AQPlayer.h"
#define FAILEDRECORDINGVIEW_TAG 45505

@interface RecordingObject : NSObject
{
    AQRecorder*				recorder;
}

- (void)start;
- (void)stop;
+ (int)scoreForSentence:(Sentence*)sentence file:(NSString*)filename toResult:(NSMutableDictionary*)scoreDictionary;

@end
