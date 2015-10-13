//
//  FISEventDetailViewController.h
//  tasksToday
//
//  Created by Guang on 10/13/15.
//  Copyright © 2015 Joe Burgess. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FISEventDetailViewController : UIViewController

@property (weak, nonatomic)IBOutlet UITextView * textView;
@property (strong, nonatomic) NSString * eventTexts;

@end
