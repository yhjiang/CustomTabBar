//
//  YHCustomTabbar.m
//  CustomTabbar
//
//  Created by Jiang on 14-5-28.
//  Copyright (c) 2014年 Johnny. All rights reserved.
//

#import "YHCustomTabbar.h"

@interface YHCustomTabbar ()

@end

@implementation YHCustomTabbar

@synthesize currentSelectedIndex;
@synthesize buttons;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (CGFloat)getScreenHeight
{
    if (IOS7_OR_LATER) {
        return [UIScreen mainScreen].applicationFrame.size.height + 20;
    }
    
    return [UIScreen mainScreen].applicationFrame.size.height;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    _images = [[NSMutableArray alloc] initWithCapacity:1];
    [_images addObjectsFromArray:@[@"tabbar_mine",@"tabbar_recommend",@"tabbar_search",@"tabbar_more"]];
    
    _selectedImages = [[NSMutableArray alloc] initWithCapacity:1];
    [_selectedImages addObjectsFromArray:@[@"hightlight_tabbar_mine",@"hightlight_tabbar_recommend",@"hightlight_tabbar_search",@"hightlight_tabbar_more"]];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewDidAppear:(BOOL)animated
{
    slideBg = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"tabar_bgview_selected"]];
    [self hideRealTabBar];
    [self customTabBar];
}

//隐藏掉系统自带的tabbar
- (void)hideRealTabBar
{
    for(UIView *view in self.view.subviews){
        if([view isKindOfClass:[UITabBar class]]){
            view.hidden = YES;
            break;
        }
    }
}

- (void)customTabBar
{
    UIImageView *imgView = [[UIImageView alloc] initWithImage: [UIImage imageNamed:@"tabbar_bgview"]];
    imgView.frame = CGRectMake(0, [self getScreenHeight] - imgView.image.size.height, imgView.image.size.width, imgView.image.size.height);
    [self.view addSubview:imgView];
    
    slideBg.frame = CGRectMake(0, self.tabBar.frame.origin.y, slideBg.image.size.width, slideBg.image.size.height);
    
    [self.view addSubview:slideBg];
    
    //创建按钮
    int viewCount = self.viewControllers.count > 5 ? 5 : self.viewControllers.count;
    self.buttons = [NSMutableArray arrayWithCapacity:viewCount];
    double _width = 320 / viewCount;
    double _height = self.tabBar.frame.size.height;
    for (int i = 0; i < viewCount; i++) {
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        btn.frame = CGRectMake(i*_width,self.tabBar.frame.origin.y, _width, _height);
        [btn setImage:[UIImage imageNamed:_images[i]] forState:UIControlStateNormal];
        [btn setImage:[UIImage imageNamed:_selectedImages[i]] forState:UIControlStateHighlighted];
        [btn addTarget:self action:@selector(selectedTab:) forControlEvents:UIControlEventTouchUpInside];
        btn.tag = i;
        [self.buttons addObject:btn];
        [self.view  addSubview:btn];
    }
    

    [self selectedTab:[self.buttons objectAtIndex:0]];
    
}

- (void)selectedTab:(UIButton *)button
{
    if (self.currentSelectedIndex == button.tag) {
      
        [([self.viewControllers objectAtIndex:button.tag]) popToRootViewControllerAnimated:YES];
	
        return;
    }
    self.currentSelectedIndex = button.tag;
    self.selectedIndex = self.currentSelectedIndex;
    [self performSelector:@selector(slideTabBg:) withObject:button];
}

- (void)slideTabBg:(UIButton *)btn
{
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:0.20];
    [UIView setAnimationDelegate:self];
    slideBg.frame = CGRectMake(btn.frame.origin.x, btn.frame.origin.y, slideBg.image.size.width, slideBg.image.size.height);
    [UIView commitAnimations];
}



@end
