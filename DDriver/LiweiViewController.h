//
//  LiweiViewController.h
//  DDriver
//
//  Created by user on 13-10-24.
//  Copyright (c) 2013年 Lingli Peng. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LiweiViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIImageView *kacheMove;
@property (weak, nonatomic) IBOutlet UIImageView *carMove;
@property (weak, nonatomic) IBOutlet UIImageView *luhuMove;

@property (weak, nonatomic) IBOutlet UIImageView *kacheMove2;
@property (weak, nonatomic) IBOutlet UIImageView *carMove2;
@property (weak, nonatomic) IBOutlet UIImageView *luhuMove2;

@property (weak, nonatomic) IBOutlet UIImageView *daoluMove;


@property (weak, nonatomic) IBOutlet UIImageView *mainMove;
- (IBAction)mainMoveDoing:(UIControl *)sender;
@property (weak, nonatomic) IBOutlet UIView *mainMoveView;


- (IBAction)SaveModel:(UIControl *)sender;


@property (weak, nonatomic) IBOutlet UIImageView *streetRight;
@property (weak, nonatomic) IBOutlet UIImageView *streetLeft;

@property (weak, nonatomic) IBOutlet UIImageView *saveModelPicture;


@end
