//
//  JGLeftView.m
//  01-初步搭建界面
//
//  Created by 刘军 on 16/9/19.
//  Copyright © 2016年 JunGe. All rights reserved.
//

#import "JGLeftView.h"
#import "JGButton.h"
#import "JGCityBtn.h"
#import "JGCityCell.h"

@interface JGLeftView ()<UITableViewDelegate,UITableViewDataSource>
@property (weak, nonatomic) IBOutlet JGButton *preSelBtn;
@property(nonatomic,weak)UITableView *cityTableView;
@property(nonatomic,strong)NSArray *cityArr;
@property(nonatomic,assign)BOOL isOpenCityBtn;
@property (weak, nonatomic) IBOutlet JGCityBtn *cityBtn;

@end

@implementation JGLeftView
-(NSArray *)cityArr
{
    if (!_cityArr) {
        _cityArr = @[@"北京",@"广州",@"深圳",@"上海" ,@"赣州",@"南昌"] ;
    }
    return _cityArr ;
}
//懒加载cityTableView
-(UITableView *)cityTableView
{
    if (!_cityTableView) {
        UITableView *cityTableV = [[UITableView alloc] init] ;
        cityTableV.layer.cornerRadius = 10 ;
        cityTableV.backgroundColor = [UIColor blackColor] ;
        cityTableV.alpha = 0.7;
        
        CGFloat w = self.cityBtn.width ;
        CGFloat h = 170 ;
        CGFloat x = self.cityBtn.x ;
        CGFloat y = CGRectGetMaxY(self.cityBtn.frame) ;
        cityTableV.frame = CGRectMake(x, y, w, h) ;
        
        cityTableV.dataSource = self ;
        cityTableV.delegate = self ;
        _cityTableView = cityTableV ;
        [self addSubview:cityTableV] ;
    }
    return _cityTableView ;
}
//点击城市按钮
- (IBAction)cityBtnClick:(UIButton *)cityBtn {
    if (self.isOpenCityBtn) {
        self.cityTableView.height = 0 ;
    }else if (!self.isOpenCityBtn){
        self.cityTableView.height = 170 ;
    }
    self.isOpenCityBtn = !self.isOpenCityBtn ;
}

+(instancetype)leftView
{
    return [[[NSBundle mainBundle] loadNibNamed:@"JGLeftView" owner:nil options:nil] firstObject] ;
}
- (IBAction)btnClick:(JGButton *)btn {
    if ([self.delegate respondsToSelector:@selector(lefeView:preSelBtnIndex:toClickMenuBtnIndex:)]) {
        [self.delegate lefeView:self preSelBtnIndex:self.preSelBtn.tag toClickMenuBtnIndex:btn.tag] ;
    }
    
    self.preSelBtn.selected = NO ;
    btn.selected = YES ;
    self.preSelBtn = btn ;
    
}
#pragma mark - 数据源
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.cityArr.count ;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    JGCityCell *cell = [JGCityCell cityCellWithTableView:tableView] ;
    
    
    cell.textLabel.text = self.cityArr[indexPath.row] ;
    return cell ;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *city =  self.cityArr[indexPath.row] ;
    //发通知告诉首页，选了城市，将城市显示在首页
    [[NSNotificationCenter defaultCenter] postNotificationName:@"cityClick" object:city] ;
    [self cityBtnClick:self.cityBtn] ;
    
    //选了城市后，用代理叫mainView关闭抽屉
    if ([self.delegate respondsToSelector:@selector(leftViewDidClickCityToCloseDrag:)]) {
        [self.delegate leftViewDidClickCityToCloseDrag:self] ;
    }
}

@end
