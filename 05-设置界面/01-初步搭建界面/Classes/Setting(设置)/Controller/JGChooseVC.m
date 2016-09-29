//
//  JGChooseVC.m
//  01-初步搭建界面
//
//  Created by 刘军 on 16/9/24.
//  Copyright © 2016年 JunGe. All rights reserved.
//

#import "JGChooseVC.h"
#import "JGChooseCell.h"

@interface JGChooseVC ()<UITableViewDataSource,UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet UIImageView *imageView;

/**记录当前点击的那一行 */
@property(nonatomic,assign)NSInteger curRow;
@property(nonatomic,assign)BOOL isOpen;

@end

@implementation JGChooseVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.dataSource = self ;
    self.tableView.delegate = self ;
    self.tableView.tableFooterView = [[UIView alloc] init] ;
}
#pragma mark - 数据源方法    
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 4 ;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *ID = @"choose" ;
    JGChooseCell *cell = [tableView dequeueReusableCellWithIdentifier:ID] ;
    if (!cell) {
        cell = [[[NSBundle mainBundle] loadNibNamed:@"JGChooseCell" owner:nil options:nil] lastObject] ;
    }
    return cell ;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    UIImage *image = [UIImage imageNamed:[NSString stringWithFormat:@"00%ld",indexPath.row+1]] ;

    self.imageView.image = image ;
    
    self.isOpen = !self.isOpen ;
    if (self.curRow != indexPath.row) {
        self.isOpen = YES ;
    }
    self.curRow = indexPath.row ;
    //更新数据，用beginUpdates方法更新数据，系统会自动添加一个序列帧动画
//    [self.tableView reloadData] ;
    [self.tableView beginUpdates] ;
    [self.tableView endUpdates] ;
    
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return (self.curRow == indexPath.row)&&self.isOpen?220:44 ;
}



@end
