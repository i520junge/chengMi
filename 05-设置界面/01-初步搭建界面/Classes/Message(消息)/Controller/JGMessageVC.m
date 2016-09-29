//
//  JGMessageVC.m
//  01-初步搭建界面
//
//  Created by 刘军 on 16/9/19.
//  Copyright © 2016年 JunGe. All rights reserved.
//

#import "JGMessageVC.h"

@interface JGMessageVC ()
/** 附近的View */
@property(nonatomic,weak)UIImageView *nearImageView;
@end

@implementation JGMessageVC
//图片只显示一次，所以懒加载nearImageView
-(UIImageView *)nearImageView
{
    
    if (!_nearImageView) {
        UIImageView *imageV = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"wnxBG"]] ;
        imageV.frame = [UIScreen mainScreen].bounds ;
        [self.view addSubview:imageV] ;
        _nearImageView = imageV ;
  
    }
    return _nearImageView ;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor colorWithRed:10/255.0 green:191/255.0 blue:174/255.0 alpha:0.7]  ;
    self.title = @"消息" ;
    [self setTitleView] ;
//    NSLog(@"%@\n %@",self.view,self.tableView) ;
}

//导航条添加
-(void)setTitleView
{
    UISegmentedControl *seg = [[UISegmentedControl alloc] initWithItems:@[@"推荐",@"附近"]] ;
    seg.width = screenW*0.5 ;
    //设置整体颜色
    seg.tintColor = [UIColor colorWithRed:20 / 255.0 green:149 / 255.0 blue:128 / 255.0 alpha:1];
    //设置默认选择按钮
    seg.selectedSegmentIndex = 0 ;
    //设置文字属性
    [seg setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor whiteColor]} forState:UIControlStateNormal] ;
    self.navigationItem.titleView = seg ;
    
    //监听点击
    [seg addTarget:self action:@selector(segClick:) forControlEvents:UIControlEventValueChanged] ;
    
    
}
//点击seg
-(void)segClick:(UISegmentedControl *)seg{
    NSString *subtype = nil ;
    if (seg.selectedSegmentIndex == 0) {
        //点击推荐
        self.tableView.scrollEnabled  = YES ;
        self.nearImageView.hidden = YES ;
        //设置从左边翻页
        subtype = @"fromLeft" ;
    }else if (seg.selectedSegmentIndex == 1){
        //点击附近
        self.tableView.contentOffset = CGPointMake(self.tableView.contentOffset.x, 0) ;
        self.tableView.scrollEnabled  = NO ;
        self.nearImageView.hidden = NO ;
        //设置从右边翻页
        subtype = @"fromRight" ;
    }
    
//    转场动画
    CATransition *anim = [CATransition animation] ;
    anim.type = @"pageCurl";
    //设置翻页方向
    anim.subtype = subtype ;
    anim.duration = 0.5 ;
    [self.view.layer addAnimation:anim forKey:nil] ;
}




#pragma mark - 数据源方法

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 30;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *messageID = @"message" ;
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:messageID] ;
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:messageID] ;
        cell.backgroundColor = [UIColor clearColor] ;
    }
    cell.textLabel.text = @"风吹裙起屁屁凉……" ;
    cell.textLabel.textColor = [UIColor whiteColor] ;
    return cell ;
}

@end
