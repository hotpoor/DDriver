//
//  LiweiViewController.m
//  DDriver
//
//  Created by user on 13-10-24.
//  Copyright (c) 2013年 Lingli Peng. All rights reserved.
//

#import "LiweiViewController.h"

@interface LiweiViewController ()
@property (strong, nonatomic) NSTimer *timerRoad;
@end

@implementation LiweiViewController

float level=1.0;
- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    [self.kacheMove setCenter:CGPointMake(270.0/2.0-50.0/1136.0*1226.0/2.0,1226.0/2.0)];
    [self.kacheMove setFrame:CGRectMake(self.kacheMove.frame.origin.x,self.kacheMove.frame.origin.y,90.0,90.0)];
    [self.carMove setCenter:CGPointMake(370.0/2.0+50.0/1136.0*1226.0/2.0,1226.0/2.0)];
    [self.carMove setFrame:CGRectMake(self.carMove.frame.origin.x,self.carMove.frame.origin.y,90.0,90.0)];
    [self.luhuMove setCenter:CGPointMake(370.0/2.0+50.0/1136.0*1226.0/2.0,1226.0/2.0)];
    [self.luhuMove setFrame:CGRectMake(self.luhuMove.frame.origin.x,self.luhuMove.frame.origin.y,90.0,90.0)];
    
    [self.kacheMove2 setCenter:CGPointMake(370.0/2.0+50.0/1136.0*1226.0/2.0,1226.0/2.0)];
    [self.kacheMove2 setFrame:CGRectMake(self.kacheMove2.frame.origin.x,self.kacheMove2.frame.origin.y,90.0,90.0)];
    [self.carMove2 setCenter:CGPointMake(370.0/2.0+50.0/1136.0*1226.0/2.0,1226.0/2.0)];
    [self.carMove2 setFrame:CGRectMake(self.carMove2.frame.origin.x,self.carMove2.frame.origin.y,90.0,90.0)];
    [self.luhuMove2 setCenter:CGPointMake(370.0/2.0+50.0/1136.0*1226.0/2.0,1226.0/2.0)];
    [self.luhuMove2 setFrame:CGRectMake(self.luhuMove2.frame.origin.x,self.luhuMove2.frame.origin.y,90.0,90.0)];
    
    
    double CRn=80.0/568.0;
    [self mainMoveStart];
    [self.streetRight setTransform:CGAffineTransformMakeRotation(atan(-CRn))];
    [self.streetLeft setTransform:CGAffineTransformMakeRotation(atan(CRn))];
}

-(void)viewWillAppear:(BOOL)animated{
    self.timerRoad = [NSTimer scheduledTimerWithTimeInterval:0.01 target:self selector:@selector(road) userInfo:nil repeats:YES];
    
    
    
   
    [self easy];
}

//左侧通道负责
int winniechangeA=0;
int winniechangeB=0;
//右侧通道负责
int winniechangeC=0;
int winniechangeD=0;
int side;
-(void)road{
    //LeftLine for Moving
    if (winniechangeA==0){
        int changeA=arc4random()%3;
        switch (changeA) {
            case 0:{
                [self kacheMoveA];
                break;}
            case 1:{
                [self carMoveA];
                break;}
            case 2:{
                [self luhuMoveA];
                break;}
            default:
                break;
        }
        winniechangeA=1;
        winniechangeB=changeA;
    }
    if (winniechangeA==1) {
        if (self.kacheMove.center.y<-45) {
            winniechangeA=0;
        }
        if (self.carMove.center.y<-45) {
            NSLog(@"%f,%f",self.carMove.center.x,self.carMove.center.y);
            winniechangeA=0;
        }
        if (self.luhuMove.center.y<-45) {
            winniechangeA=0;
        }
        switch (winniechangeB) {
            case 0:{
                [self kacheMoveA];
                break;}
            case 1:{
                [self carMoveA];
                break;}
            case 2:{
                [self luhuMoveA];
                break;}
            default:
                break;
        }
    }
    
    

    //RightLine for Moving
    if (winniechangeC==0){
        int changeB=arc4random()%3;
        switch (changeB) {
            case 0:{
                [self kacheMoveB];
                break;}
            case 1:{
                [self carMoveB];
                break;}
            case 2:{
                [self luhuMoveB];
                break;}
            default:
                break;
        }
        winniechangeC=1;
        winniechangeD=changeB;
    }
    if (winniechangeC==1) {
        if (self.kacheMove2.center.y<-45) {
            winniechangeC=0;
        }
        if (self.carMove2.center.y<-45) {
            winniechangeC=0;
        }
        if (self.luhuMove2.center.y<-45) {
            winniechangeC=0;
        }
        switch (winniechangeD) {
            case 0:{
                [self kacheMoveB];
                break;}
            case 1:{
                [self carMoveB];
                break;}
            case 2:{
                [self luhuMoveB];
                break;}
            default:
                break;
        }
    }
    
    //前后位置关系
    if (self.kacheMove.center.y<=self.mainMoveView.center.y) {
        [self.view insertSubview:self.mainMoveView aboveSubview:self.kacheMove];
    }else{
        [self.view insertSubview:self.kacheMove aboveSubview:self.mainMoveView];
    }
    if (self.kacheMove2.center.y<=self.mainMoveView.center.y) {
        [self.view insertSubview:self.mainMoveView aboveSubview:self.kacheMove2];
    }else{
        [self.view insertSubview:self.kacheMove2 aboveSubview:self.mainMoveView];
    }
    //=========
    if (self.carMove.center.y<=self.mainMoveView.center.y) {
        [self.view insertSubview:self.mainMoveView aboveSubview:self.carMove];
    }else{
        [self.view insertSubview:self.carMove aboveSubview:self.mainMoveView];
    }
    if (self.carMove2.center.y<=self.mainMoveView.center.y) {
        [self.view insertSubview:self.mainMoveView aboveSubview:self.carMove2];
    }else{
        [self.view insertSubview:self.carMove2 aboveSubview:self.mainMoveView];
    }
    //=========
    if (self.luhuMove.center.y<=self.mainMoveView.center.y) {
        [self.view insertSubview:self.mainMoveView aboveSubview:self.luhuMove];
    }else{
        [self.view insertSubview:self.luhuMove aboveSubview:self.mainMoveView];
    }
    if (self.luhuMove2.center.y<=self.mainMoveView.center.y) {
        [self.view insertSubview:self.mainMoveView aboveSubview:self.luhuMove2];
    }else{
        [self.view insertSubview:self.luhuMove2 aboveSubview:self.mainMoveView];
    }
    
    
    
    
    if (self.mainMoveView.center.x==260.0/2.0-60.0) {
        side=0;
    }
    
    if (self.mainMoveView.center.x==260.0/2.0) {
        side=1;
    }
    
    if (self.mainMoveView.center.x==380.0/2.0) {
        side=2;
    }
    
    if (self.mainMoveView.center.x==380.0/2.0+60.0) {
        side=3;
    }
    
    
    
    
    [self cash];
}

-(void)easy{
    [self kacheMoveDoing];
    [self carMoveDoing];
    [self luhuMoveDoing];
    [self daoluMoveDoing];
    [self mainMoveDoing];
    [self streetRightDoing];
    [self streetLeftDoing];
}

//逐帧动画
-(void)streetLeftDoing{
    NSMutableArray *imageArry1 = [[NSMutableArray alloc] initWithObjects: nil];
    
    for (int a = 1; a <= 4; a ++) {
        UIImage *image1 = [UIImage imageNamed:[NSString stringWithFormat:@"test_left%d.png",a]];
        [imageArry1 addObject:image1];
    }
    self.streetLeft.animationImages = imageArry1;
    self.streetLeft.animationDuration = 0.5;
    self.streetLeft.animationRepeatCount = 0;
    [self.streetLeft startAnimating];
}
-(void)streetRightDoing{
    NSMutableArray *imageArry1 = [[NSMutableArray alloc] initWithObjects: nil];
    
    for (int a = 1; a <= 4; a ++) {
        UIImage *image1 = [UIImage imageNamed:[NSString stringWithFormat:@"test_right%d.png",a]];
        [imageArry1 addObject:image1];
    }
    self.streetRight.animationImages = imageArry1;
    self.streetRight.animationDuration = 0.5;
    self.streetRight.animationRepeatCount = 0;
    [self.streetRight startAnimating];
}

-(void)mainMoveDoing{
    NSMutableArray *imageArry1 = [[NSMutableArray alloc] initWithObjects: nil];
    
    for (int a = 1; a <= 3; a ++) {
        UIImage *image1 = [UIImage imageNamed:[NSString stringWithFormat:@"主角修改%d.png",a]];
        [imageArry1 addObject:image1];
    }
    self.mainMove.animationImages = imageArry1;
    self.mainMove.animationDuration = 0.2;
    self.mainMove.animationRepeatCount = 0;
    [self.mainMove startAnimating];
}


-(void)daoluMoveDoing{
    NSMutableArray *imageArry1 = [[NSMutableArray alloc] initWithObjects: nil];
    
    for (int a = 1; a <= 3; a ++) {
        UIImage *image1 = [UIImage imageNamed:[NSString stringWithFormat:@"daolu%d.png",a]];
        [imageArry1 addObject:image1];
    }
    self.daoluMove.animationImages = imageArry1;
    self.daoluMove.animationDuration = 0.3;
    self.daoluMove.animationRepeatCount = 0;
    [self.daoluMove startAnimating];
}

- (void) kacheMoveDoing{
    NSMutableArray *imageArry1 = [[NSMutableArray alloc] initWithObjects: nil];
    
    for (int a = 1; a <= 3; a ++) {
        UIImage *image1 = [UIImage imageNamed:[NSString stringWithFormat:@"卡车修改%d.png",a]];
        [imageArry1 addObject:image1];
    }
    self.kacheMove.animationImages = imageArry1;
    self.kacheMove.animationDuration = 0.2;
    self.kacheMove.animationRepeatCount = 0;
    [self.kacheMove startAnimating];
    self.kacheMove2.animationImages = imageArry1;
    self.kacheMove2.animationDuration = 0.2;
    self.kacheMove2.animationRepeatCount = 0;
    [self.kacheMove2 startAnimating];
    

    
}

- (void) carMoveDoing{
    NSMutableArray *imageArry2 = [[NSMutableArray alloc] initWithObjects: nil];
    
    for (int a = 1; a <= 3; a ++) {
        UIImage *image2 = [UIImage imageNamed:[NSString stringWithFormat:@"小车修改%d.png",a]];
        [imageArry2 addObject:image2];
    }
    self.carMove.animationImages = imageArry2;
    self.carMove.animationDuration = 0.2;
    self.carMove.animationRepeatCount = 0;
    [self.carMove startAnimating];
    self.carMove2.animationImages = imageArry2;
    self.carMove2.animationDuration = 0.2;
    self.carMove2.animationRepeatCount = 0;
    [self.carMove2 startAnimating];
}
- (void) luhuMoveDoing{
    NSMutableArray *imageArry3 = [[NSMutableArray alloc] initWithObjects: nil];
    
    for (int a = 1; a <= 3; a ++) {
        UIImage *image2 = [UIImage imageNamed:[NSString stringWithFormat:@"陆虎车修改%d.png",a]];
        [imageArry3 addObject:image2];
    }
    self.luhuMove.animationImages = imageArry3;
    self.luhuMove.animationDuration = 0.2;
    self.luhuMove.animationRepeatCount = 0;
    [self.luhuMove startAnimating];
    self.luhuMove2.animationImages = imageArry3;
    self.luhuMove2.animationDuration = 0.2;
    self.luhuMove2.animationRepeatCount = 0;
    [self.luhuMove2 startAnimating];
}




//==========左侧通道============

//卡车行进路线图
-(void)kacheMoveA{
    float Center1=1.5*level;
    float SizeChange=90.0/(1226.0*1.0/Center1);
    if(self.kacheMove.center.y<=-45.0){
        [self.kacheMove setCenter:CGPointMake(270.0/2.0-50.0/1136.0*1226.0/2.0,1226.0/2.0)];
        [self.kacheMove setFrame:CGRectMake(self.kacheMove.frame.origin.x,self.kacheMove.frame.origin.y,90.0,90.0)];
    }else{
        [self.kacheMove setFrame:CGRectMake(self.kacheMove.frame.origin.x,self.kacheMove.frame.origin.y , self.kacheMove.bounds.size.width-SizeChange, self.kacheMove.bounds.size.height-SizeChange)];
        [self.kacheMove setCenter:CGPointMake(270.0/2.0-50.0/1136.0*(self.kacheMove.center.y-Center1)/2.0,self.kacheMove.center.y-Center1)];
        
       
//    [self.kacheMove setFrame:CGRectMake(160-45, self.kacheMove.center.y-54-kacheCenter1, 90, 90)];
            
    
    }
//    NSLog(@"%f,%f,%f",self.kacheMove.center.x,self.kacheMove.center.y,self.kacheMove.bounds.size.width);
}

-(void)carMoveA{
    float Center1=1.2*level;
    float SizeChange=90.0/(1226.0*1.0/Center1);
    if(self.carMove.center.y<=-45.0){
        [self.carMove setCenter:CGPointMake(270.0/2.0-50.0/1136.0*1226.0/2.0,1226.0/2.0)];
        [self.carMove setFrame:CGRectMake(self.carMove.frame.origin.x,self.carMove.frame.origin.y,90.0,90.0)];
    }else{
        [self.carMove setFrame:CGRectMake(self.carMove.frame.origin.x,self.carMove.frame.origin.y , self.carMove.bounds.size.width-SizeChange, self.carMove.bounds.size.height-SizeChange)];
        [self.carMove setCenter:CGPointMake(270.0/2.0-50.0/1136.0*(self.carMove.center.y-Center1)/2.0,self.carMove.center.y-Center1)];
        
        
        //    [self.kacheMove setFrame:CGRectMake(160-45, self.kacheMove.center.y-54-kacheCenter1, 90, 90)];
        
        
    }
    //    NSLog(@"%f,%f,%f",self.kacheMove.center.x,self.kacheMove.center.y,self.kacheMove.bounds.size.width);
}
-(void)luhuMoveA{
    float Center1=0.9*level;
    float SizeChange=90.0/(1226.0*1.0/Center1);
    if(self.luhuMove.center.y<=-45.0){
        [self.luhuMove setCenter:CGPointMake(270.0/2.0-50.0/1136.0*1226.0/2.0,1226.0/2.0)];
        [self.luhuMove setFrame:CGRectMake(self.luhuMove.frame.origin.x,self.luhuMove.frame.origin.y,90.0,90.0)];
    }else{
        [self.luhuMove setFrame:CGRectMake(self.luhuMove.frame.origin.x,self.luhuMove.frame.origin.y , self.luhuMove.bounds.size.width-SizeChange, self.luhuMove.bounds.size.height-SizeChange)];
        [self.luhuMove setCenter:CGPointMake(270.0/2.0-50.0/1136.0*(self.luhuMove.center.y-Center1)/2.0,self.luhuMove.center.y-Center1)];
        
        
        //    [self.kacheMove setFrame:CGRectMake(160-45, self.kacheMove.center.y-54-kacheCenter1, 90, 90)];
        
        
    }
    //    NSLog(@"%f,%f,%f",self.kacheMove.center.x,self.kacheMove.center.y,self.kacheMove.bounds.size.width);
}
//==========右侧通道============
-(void)kacheMoveB{
    float Center1=1.3*level;
    float SizeChange=90.0/(1226.0*1.0/Center1);
    if(self.kacheMove2.center.y<=-45.0){
        [self.kacheMove2 setCenter:CGPointMake(370.0/2.0+50.0/1136.0*1226.0/2.0,1226.0/2.0)];
        [self.kacheMove2 setFrame:CGRectMake(self.kacheMove2.frame.origin.x,self.kacheMove2.frame.origin.y,90.0,90.0)];
    }else{
        [self.kacheMove2 setFrame:CGRectMake(self.kacheMove2.frame.origin.x,self.kacheMove2.frame.origin.y , self.kacheMove2.bounds.size.width-SizeChange, self.kacheMove2.bounds.size.height-SizeChange)];
        [self.kacheMove2 setCenter:CGPointMake(370.0/2.0+50.0/1136.0*(self.kacheMove2.center.y-Center1)/2.0,self.kacheMove2.center.y-Center1)];
        
        
        //    [self.kacheMove setFrame:CGRectMake(160-45, self.kacheMove.center.y-54-kacheCenter1, 90, 90)];
        
        
    }
    
}
-(void)carMoveB{
    float Center1=1.0*level;
    float SizeChange=90.0/(1226.0*1.0/Center1);
    if(self.carMove2.center.y<=-45.0){
        [self.carMove2 setCenter:CGPointMake(370.0/2.0+50.0/1136.0*1226.0/2.0,1226.0/2.0)];
        [self.carMove2 setFrame:CGRectMake(self.carMove2.frame.origin.x,self.carMove2.frame.origin.y,90.0,90.0)];
    }else{
        [self.carMove2 setFrame:CGRectMake(self.carMove2.frame.origin.x,self.carMove2.frame.origin.y , self.carMove2.bounds.size.width-SizeChange, self.carMove2.bounds.size.height-SizeChange)];
        [self.carMove2 setCenter:CGPointMake(370.0/2.0+50.0/1136.0*(self.carMove2.center.y-Center1)/2.0,self.carMove2.center.y-Center1)];
        
        
        //    [self.kacheMove setFrame:CGRectMake(160-45, self.kacheMove.center.y-54-kacheCenter1, 90, 90)];
        
        
    }
    
}
-(void)luhuMoveB{
    float Center1=0.7*level;
    float SizeChange=90.0/(1226.0*1.0/Center1);
    if(self.luhuMove2.center.y<=-45.0){
        [self.luhuMove2 setCenter:CGPointMake(370.0/2.0+50.0/1136.0*1226.0/2.0,1226.0/2.0)];
        [self.luhuMove2 setFrame:CGRectMake(self.luhuMove2.frame.origin.x,self.luhuMove2.frame.origin.y,90.0,90.0)];
    }else{
        [self.luhuMove2 setFrame:CGRectMake(self.luhuMove2.frame.origin.x,self.luhuMove2.frame.origin.y , self.luhuMove2.bounds.size.width-SizeChange, self.luhuMove2.bounds.size.height-SizeChange)];
        [self.luhuMove2 setCenter:CGPointMake(370.0/2.0+50.0/1136.0*(self.luhuMove2.center.y-Center1)/2.0,self.luhuMove2.center.y-Center1)];
        
        
        //    [self.kacheMove setFrame:CGRectMake(160-45, self.kacheMove.center.y-54-kacheCenter1, 90, 90)];
        
        
    }
    
}






- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)mainMoveDoing:(UIControl *)sender {
    [UIView beginAnimations:@"main" context:NULL];
    if (self.mainMoveView.center.x==260.0/2.0) {
        [self.mainMoveView setCenter:CGPointMake(380.0/2.0, self.mainMoveView.center.y)];
    }else if (self.mainMoveView.center.x==380.0/2.0) {
        [self.mainMoveView setCenter:CGPointMake(260.0/2.0, self.mainMoveView.center.y)];
    }else if (self.mainMoveView.center.x==260.0/2.0-60.0){
        [self.mainMoveView setCenter:CGPointMake(260.0/2.0, self.mainMoveView.center.y)];
    }else if (self.mainMoveView.center.x==380.0/2.0+60.0){
        [self.mainMoveView setCenter:CGPointMake(380.0/2.0, self.mainMoveView.center.y)];
    }
        
        
        
    NSLog(@"Main:%f-%f",self.mainMoveView.center.x,self.mainMoveView.center.y);
    NSLog(@"Main:%f-%f",self.mainMove.center.x,self.mainMove.center.y);
    [UIView commitAnimations];
    [self.saveModelPicture setImage:[UIImage imageNamed:@"saveModelOn.png"]];
}

-(void)mainMoveStart{
    int i=arc4random()%2;
    if (i==0) {
        [self.mainMoveView setCenter:CGPointMake(260.0/2.0, self.mainMoveView.center.y)];
    }else{
        [self.mainMoveView setCenter:CGPointMake(380.0/2.0, self.mainMoveView.center.y)];
    }
}







- (IBAction)SaveModel:(UIControl *)sender {
    [UIView beginAnimations:@"saveModel" context:NULL];
    if (self.mainMoveView.center.x==260.0/2.0){
        [self.mainMoveView setCenter:CGPointMake(260.0/2.0-60.0,self.mainMoveView.center.y)];
    }
    if (self.mainMoveView.center.x==380.0/2.0){
        [self.mainMoveView setCenter:CGPointMake(380.0/2.0+60.0,self.mainMoveView.center.y)];
    }
    
    [UIView commitAnimations];
    
    
    [self.saveModelPicture setImage:[UIImage imageNamed:@"saveModelOff.png"]];

}

-(void)cash{
    if (side==1) {
        if (abs(self.kacheMove.center.y-self.mainMoveView.center.y)<=15) {
            NSLog(@"Cash");
        }
        if (abs(self.carMove.center.y-self.mainMoveView.center.y)<=15) {
            NSLog(@"Cash");
        }
        if (abs(self.luhuMove.center.y-self.mainMoveView.center.y)<=15) {
                NSLog(@"Cash");
        }
    }
    if (side==2) {
        if (abs(self.kacheMove2.center.y-self.mainMoveView.center.y)<=15) {
            NSLog(@"Cash");
        }
        if (abs(self.carMove2.center.y-self.mainMoveView.center.y)<=15) {
            NSLog(@"Cash");
        }
        if (abs(self.luhuMove2.center.y-self.mainMoveView.center.y)<=15) {
            NSLog(@"Cash");
        }
    }
    
    
    
    
}

@end
