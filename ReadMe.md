
##介绍

CustomTabBar是一款自定义的Tabbar，继承UITabbarViewController，可自定义tab图片，背景，以及选中背景。


##截图
<img  width="320" height="480" src="https://raw.githubusercontent.com/yhjiang/CustomTabBar/master/ScreenShot1.png"/> 


##用法
```
//初始化ViewController
    FirstViewController *home = [[FirstViewController alloc] init];
    home.title = @"首页";
    
    SecondViewController *list = [[SecondViewController alloc] init];
    list.title = @"推荐";
    
    ThirdViewController *search = [[ThirdViewController alloc] init];
    search.title = @"搜索";
    
    FourthViewController *more = [[FourthViewController alloc] init];
    more.title = @"更多";
    
    //创建导航
    UINavigationController *nav1 = [[UINavigationController alloc] initWithRootViewController:home];
    UINavigationController *nav2 = [[ UINavigationController alloc] initWithRootViewController:list];
    UINavigationController *nav3 = [[UINavigationController alloc] initWithRootViewController:search];
    UINavigationController *nav4 = [[UINavigationController alloc]initWithRootViewController:more];
    
    //把VC放到数组中
    NSMutableArray *controllers = [NSMutableArray arrayWithArray:@[nav1,nav2,nav3,nav4]];
    
    //初始化Tabbarcontroller
    _tabbarController = [[YHCustomTabbar alloc] init];
    _tabbarController.viewControllers = controllers;
    _tabbarController.selectedIndex = 0;
    
    [self.window setRootViewController:_tabbarController];
    
 ```
