//
//  LessonsViewController.h
//  Say
//
//  Created by JiaLi on 11-7-16.
//  Copyright 2011年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CourseParser.h"
#import "Course.h"
#import "Lesson.h"
//#import "DayByDayObject.h"

@class XMLAuthorsViewController;

@protocol LessonsViewControllerDelegate <NSObject>

- (NSString*)getPkgTitle;

@end

@interface LessonsViewController : UIViewController {
     NSString* _scenesName;
    CourseParser* _courseParser;
    NSInteger nSelectedPage;
    NSInteger nPageCount;
    UISegmentedControl* _pageSegment;
    NSIndexPath* _lastRow;
//    DayByDayObject* _daybayday;
}

@property (nonatomic, retain) NSString* scenesName;
@property (nonatomic, retain) NSString* pkgName;
@property (nonatomic, retain) UISegmentedControl* pageSegment;
@property (nonatomic, retain) NSString* dataPath;
@property (nonatomic, assign) id<LessonsViewControllerDelegate> delegate;
@property (nonatomic, retain) IBOutlet UITableView* lessonTableView;
- (void) loadCourses;
- (void) loadToolbarItems;
- (void) onPrevious:(id)sender;
- (void) onNext:(id)sender;
- (void) onSelectedPage:(id)sender;
- (void) onSetting:(id)sender;

@end
