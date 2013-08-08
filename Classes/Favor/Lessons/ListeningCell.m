//
//  ListeningCell.m
//  Partners
//
//  Created by JiaLi on 13-6-6.
//  Copyright (c) 2013年 JiaLi. All rights reserved.
//

#import "ListeningCell.h"
#import <QuartzCore/QuartzCore.h>
#import "Globle.h"
#define HEIGHT_OF_LISTENINGCELL 107

@implementation UITeacherIconView
- (id) initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    self.layer.cornerRadius = 28;
    return self;
}

- (void) drawRect:(CGRect)rect
{
    self.layer.cornerRadius = 28;
    [super drawRect:rect];
}
@end

@implementation ListeningCell
@synthesize teatcherIconView, teatcherImageView;
@synthesize sentenceSrc;
@synthesize sentenceTrans;
@synthesize scroeLabel;
@synthesize scoreImageView;


- (void)layoutCell;
{
    //self.teatcherIconView.layer.cornerRadius = 28;
    self.teatcherIconView.layer.borderColor = [[UIColor lightGrayColor] CGColor];
    self.teatcherIconView.layer.borderWidth = 1.0;
    self.sentenceSrc.numberOfLines = 0;
    self.sentenceSrc.lineBreakMode   = UILineBreakModeWordWrap;
    self.sentenceTrans.numberOfLines = 0;
    self.sentenceTrans.lineBreakMode   = UILineBreakModeWordWrap;
}

- (void)cleanUp;
{
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)setMsgText:(NSString *)msgText withTrans:(NSString*)transText;
{
    self.sentenceSrc.text = msgText;
    [_srcMsg release];
    _srcMsg = [msgText retain];
    self.sentenceTrans.text = transText;
    [self.sentenceSrc setFont:[UIFont systemFontOfSize:22] fromIndex:0 length:msgText.length];
   
    self.sentenceSrc.numberOfLines = 0;
    self.sentenceSrc.lineBreakMode   = UILineBreakModeWordWrap;
   
    CGSize szSrc = [Globle calcTextHeight:msgText withWidth:self.sentenceSrc.frame.size.width withFontSize:22];
    
    CGSize szTrans = [Globle calcTextHeight:transText withWidth:self.sentenceTrans.frame.size.width withFontSize:14];
    [self.sentenceSrc sizeToFit];
    
    [self.sentenceTrans sizeToFit];
    self.sentenceTrans.frame = CGRectMake(self.sentenceSrc.frame.origin.x, self.sentenceSrc.frame.origin.y, self.sentenceSrc.frame.size.width, szSrc.height);
    self.sentenceTrans.frame = CGRectMake(self.sentenceTrans.frame.origin.x, self.sentenceSrc.frame.origin.y + self.sentenceSrc.frame.size.height + 10, self.sentenceTrans.frame.size.width, szTrans.height);
    self.frame = CGRectMake(self.frame.origin.x, self.frame.origin.y, self.frame.size.width, fmax(self.sentenceTrans.frame.origin.y + self.sentenceTrans.frame.size.height + 20, HEIGHT_OF_LISTENINGCELL));
}

- (void)changeTextColor:(NSMutableArray*)willCompareString
{
    self.sentenceSrc.text = _srcMsg;
    [self.sentenceSrc setFont:[UIFont systemFontOfSize:22] fromIndex:0 length:_srcMsg.length];
    [self.sentenceSrc setColor:[UIColor redColor] fromIndex:0 length:self.sentenceSrc.text.length];
    
    for (NSInteger i = 0; i < [willCompareString count]; i++) {
        NSString* word = [willCompareString objectAtIndex:i];
        if (word.length > 0) {
            NSRange r = [self.sentenceSrc.text rangeOfString:word options:NSCaseInsensitiveSearch];
            if (r.location != NSNotFound) {
                [self.sentenceSrc setColor:[UIColor greenColor] fromIndex:r.location length:r.length];
            }
        }
    }
    [self.sentenceSrc setNeedsDisplay];
}

- (void)resetCellState {
    self.sentenceSrc.text = _srcMsg;
    [self.sentenceSrc setFont:[UIFont systemFontOfSize:22] fromIndex:0 length:_srcMsg.length];
    [self.sentenceSrc setColor:[UIColor blackColor] fromIndex:0 length:self.sentenceSrc.text.length];
    self.scoreImageView.layer.cornerRadius = 15;
    self.scoreImageView.backgroundColor = [UIColor clearColor];
    self.scoreImageView.image = nil;
    self.scroeLabel.text = nil;
    [self.sentenceSrc setNeedsDisplay];
}

- (void)showScore:(NSInteger)score{
    self.scoreImageView.layer.cornerRadius = 15;
    if (score < 60) {
        self.scoreImageView.image = [UIImage imageNamed:@"Icon_Bad@2x.png"];
        self.scoreImageView.backgroundColor = [UIColor redColor];
        self.scroeLabel.text = nil;
    } else {
        self.scoreImageView.image = nil;
        self.scoreImageView.backgroundColor = [UIColor greenColor];
        self.scroeLabel.text = [NSString stringWithFormat:@"%d", score];
    }

}

- (void)dealloc
{
    [self.teatcherImageView release];
    [self.teatcherIconView release];
    [self.scroeLabel release];
    [self.scoreImageView release];
    [super dealloc];
}
@end
