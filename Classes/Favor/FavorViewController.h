//
//  FavorViewController.h
//  Partners
//
//  Created by JiaLi on 13-5-13.
//  Copyright (c) 2013年 JiaLi. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "VoicePkgInfoObject.h"
#import "ZYFolders.h"

@interface FavorViewController : UIViewController
{
    VoiceDataPkgObject* _deleteObject;
    NSMutableArray* _pkgArray;
    BOOL _bEdit;

}
@property (nonatomic, retain) IBOutlet UITableView* tableView;
@property(nonatomic, retain) ZYFolders *folders;
- (void)loadPkgArray;
@end