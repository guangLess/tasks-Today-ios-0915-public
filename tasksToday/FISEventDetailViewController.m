//
//  FISEventDetailViewController.m
//  tasksToday
//
//  Created by Guang on 10/13/15.
//  Copyright © 2015 Joe Burgess. All rights reserved.
//

#import "FISEventDetailViewController.h"

@interface FISEventDetailViewController ()

@end

@implementation FISEventDetailViewController

//-(instancetype)init{
//    self = [super self];
//    if (self) {
//        _eventTexts = [[NSMutableString alloc] init];
//    }
//    return self;
//}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.textView.text = self.eventTexts;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
