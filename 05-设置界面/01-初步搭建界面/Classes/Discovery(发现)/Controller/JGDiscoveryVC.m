//
//  JGDiscoveryVC.m
//  01-初步搭建界面
//
//  Created by 刘军 on 16/9/19.
//  Copyright © 2016年 JunGe. All rights reserved.
//

#import "JGDiscoveryVC.h"
#import "JGDiscoveryCell.h"
#import "JGDiscoveryItem.h"
#import "JGCellItem.h"
#import "JGHeaderView.h"
#import "JGHeaderItem.h"
#import "JGDetailVC.h"

@interface JGDiscoveryVC ()
@property(nonatomic,strong)NSArray *discoveryDataArr;
@property(nonatomic,strong)UIImage *image;
@end
static NSString *headerID = @"header" ;
static NSString *reuseCellID = @"DiscoveryCell" ;
@implementation JGDiscoveryVC
//懒加载数据
-(NSArray *)discoveryDataArr
{
    if (!_discoveryDataArr) {
        _discoveryDataArr = [JGDiscoveryItem getDiscoveryList] ;
    }
    return _discoveryDataArr ;
}

//设置UICollectionViewController的布局方式
-(instancetype)init
{
    UICollectionViewFlowLayout *flowL = [[UICollectionViewFlowLayout alloc] init] ;
    flowL.sectionInset = UIEdgeInsetsMake(10, 10, 10, 10) ;
    flowL.itemSize = CGSizeMake(screenW*0.5-20, 200) ;
    flowL.headerReferenceSize = CGSizeMake(screenW, 250) ;
    
    
    return [super initWithCollectionViewLayout:flowL] ;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.collectionView.backgroundColor = [UIColor colorWithRed:10/255.0 green:191/255.0 blue:174/255.0 alpha:0.7] ;
    self.title = @"发 现" ;
//    NSLog(@"%@\n%@",self.view,self.collectionView) ;
    
//    注册cell
    [self.collectionView registerNib:[UINib nibWithNibName:@"JGDiscoveryCell" bundle:nil] forCellWithReuseIdentifier:reuseCellID] ;
    
//    注册头部标题
    [self.collectionView registerNib:[UINib nibWithNibName:@"JGHeaderView" bundle:nil] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:headerID] ;
    
//    添加长按手势
    UILongPressGestureRecognizer *longPress = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(longPress:)] ;
    [self.collectionView addGestureRecognizer:longPress] ;
}
//长按
-(void)longPress:(UILongPressGestureRecognizer *)longGesture{
    //判断手势状态
    switch (longGesture.state) {
            //开始拖动
        case UIGestureRecognizerStateBegan:{
            //判断手势落点位置是否在路径上
            CGPoint curP = [longGesture locationInView:self.collectionView];
            //根据一个点,获取当前点在collectionView的哪个上面.
            NSIndexPath *indexPath = [self.collectionView indexPathForItemAtPoint:curP];
            //如果都不在,直接返回
            if (indexPath == nil) {
                break;
            }
            //在Item上则开始移动交互
            [self.collectionView beginInteractiveMovementForItemAtIndexPath:indexPath];
        }
            break;
        case UIGestureRecognizerStateChanged:
            //移动过程当中随时更新cell位置
            [self.collectionView updateInteractiveMovementTargetPosition:[longGesture locationInView:self.collectionView]];
            break;
        case UIGestureRecognizerStateEnded:
            //移动结束后关闭cell移动
            [self.collectionView endInteractiveMovement];
            break;
        default:
            [self.collectionView cancelInteractiveMovement];
            break;
    }
    
}
//是否能移动view
-(BOOL)collectionView:(UICollectionView *)collectionView canMoveItemAtIndexPath:(NSIndexPath *)indexPath{
    return YES ;
}
//移动时插入
-(void)collectionView:(UICollectionView *)collectionView moveItemAtIndexPath:(NSIndexPath *)sourceIndexPath toIndexPath:(NSIndexPath *)destinationIndexPath{
    //获取当前组数据
    JGDiscoveryItem *disItem = self.discoveryDataArr[sourceIndexPath.section] ;
    //取出源item数据
    JGCellItem *cellItem = [disItem.themes objectAtIndex:sourceIndexPath.row] ;
    //从资源数组中移除该数据,themes要用可变数组
    [disItem.themes removeObject:cellItem] ;
    //取出目标组
    JGDiscoveryItem *disItem1 = self.discoveryDataArr[destinationIndexPath.section] ;
    //将数据插入到资源数组中的目标位置上
    [disItem1.themes insertObject:cellItem atIndex:destinationIndexPath.row] ;
    
}

#pragma mark - 数据源方法
//有多少组
-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return self.discoveryDataArr.count ;
}
//没组多少格子
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    JGDiscoveryItem *item = self.discoveryDataArr[section] ;
    return item.themes.count ;
}

//每个格子显示什么内容，cell一定要用注册方式
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    JGDiscoveryCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseCellID forIndexPath:indexPath] ;
    JGDiscoveryItem *item = self.discoveryDataArr[indexPath.section] ;
    JGCellItem *cellItem = item.themes[indexPath.row] ;
    cell.cellItem = cellItem ;
    return cell ;
}

//每组显示什么内容
-(UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath
{
    if ([kind isEqualToString:@"UICollectionElementKindSectionHeader"]) {
        JGHeaderView *headerV = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:headerID forIndexPath:indexPath] ;
        
        //设置数据
        JGDiscoveryItem *item = self.discoveryDataArr[indexPath.section] ;
        JGHeaderItem *headerItem = item.header ;
        headerV.headerItem = headerItem ;
        return headerV ;
    }
    return nil ;
}
//点击cell的时候
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    
    JGDetailVC *detailVC = [[JGDetailVC alloc] init] ;
    JGDiscoveryItem *item = self.discoveryDataArr[indexPath.section] ;
    JGCellItem *cellItem = item.themes[indexPath.row] ;
    UIImage *image = [UIImage imageNamed:cellItem.img] ;
    self.image = image ;
    [[NSNotificationCenter defaultCenter] postNotificationName:@"cellClick" object:image] ;
//    UIImageView *imageV = [[UIImageView alloc] initWithImage:image] ;
//    imageV.frame = CGRectMake(0, 0, 300, 300) ;
//    [detailVC.imageView addSubview:imageV] ;
    [self.navigationController pushViewController:detailVC animated:YES] ;
    
    
}



@end
