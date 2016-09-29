//
//  JGHomeCell.m
//  01-初步搭建界面
//
//  Created by 刘军 on 16/9/21.
//  Copyright © 2016年 JunGe. All rights reserved.
//

#import "JGHomeCell.h"
#import "JGHomeCellItem.h"

@interface JGHomeCell ()
@property (weak, nonatomic) IBOutlet UIImageView *bgImageV;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *subLabel;
@property (weak, nonatomic) IBOutlet UILabel *countLabel;

@end

@implementation JGHomeCell
+(instancetype)homeCellWithTableView:(UITableView *)tableView
{
    static NSString *homeID = @"home" ;
    JGHomeCell *cell = [tableView dequeueReusableCellWithIdentifier:homeID] ;
    if (!cell) {
        cell = [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass([self class]) owner:nil options:nil] lastObject] ;
        
    }
    return cell ;
}

//处理数据
-(void)setHomeCellItem:(JGHomeCellItem *)homeCellItem
{
    _homeCellItem = homeCellItem ;

    self.bgImageV.image = [UIImage imageNamed:[NSString stringWithFormat:@"%@.jpg",homeCellItem.imageURL]] ;
    self.titleLabel.text = homeCellItem.section_title ;
    self.subLabel.text = homeCellItem.poi_name ;
    self.countLabel.text = homeCellItem.fav_count ;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
