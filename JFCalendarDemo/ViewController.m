//
//  ViewController.m
//  CalendarDemo
//
//  Created by fisland on 15/11/11.
//  Copyright © 2015年 fisland. All rights reserved.
//

#import "ViewController.h"

#import "NSDate+JFCalendarHelp.h"

#import "CalendarCollectionViewCell.h"

@interface ViewController ()<UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout>

@property (weak, nonatomic) IBOutlet UILabel *selectedMonthLabel;///<头部月份label
@property (weak, nonatomic) IBOutlet UICollectionView *CalendarCollectionView;///<collectionView

@property(nonatomic , assign)NSInteger firstWeekday; ///< 第一个周几
@property(nonatomic , assign)NSInteger monthDay; ///< 月日数
@property(nonatomic , assign)NSInteger selectedMonth; ///< 本月
@property(nonatomic, assign)NSInteger selectedDay;///<本日
@property(nonatomic , assign)NSInteger selectedYear; ///< 本年
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    _CalendarCollectionView.delegate = self;
    _CalendarCollectionView.dataSource = self;
    
    _selectedYear = [NSDate currentYear];
    _selectedMonth = [NSDate currentMonth];
    _selectedDay = [NSDate currentDay];

    _firstWeekday = [NSDate firstWeekdayFromYear:_selectedYear month:_selectedMonth];
    _selectedMonthLabel.text = [NSString stringWithFormat:@"%ld年%ld月",_selectedYear,_selectedMonth];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark method
- (IBAction)lastMonthAction:(UIButton *)sender {
    if (_selectedMonth > 1) {
        _selectedMonth --;
    }
    else{
        _selectedYear --;
        _selectedMonth = 12;
    }
    [self changeTheSelectDay];
}

- (IBAction)nextMonthAction:(UIButton *)sender {
    if (_selectedMonth < 12) {
        _selectedMonth ++;
    }
    else{
        _selectedYear ++;
        _selectedMonth = 1;
    }
    [self changeTheSelectDay];
}
- (void)changeTheSelectDay{
    _firstWeekday = [NSDate firstWeekdayFromYear:_selectedYear month:_selectedMonth];
    
    _selectedMonthLabel.text = [NSString stringWithFormat:@"%ld年%ld月",_selectedYear,_selectedMonth];
    
    [_CalendarCollectionView reloadData];
}
#pragma mark collection delegate

#pragma mark collection datasource
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    CGFloat width =  [[UIScreen mainScreen] bounds].size.width;
    
    CGFloat cellWidth = (width - 20) / 7.0; 
    
    CGSize size = CGSizeMake(cellWidth, 40);
    
    return size;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
     return _firstWeekday + [NSDate numberOfDaysByYear:_selectedYear month:_selectedMonth];
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    
    CalendarCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"CalendarCell" forIndexPath:indexPath];
    
    if (indexPath.row >=  _firstWeekday) {
        cell.dayLabel.text = [NSString stringWithFormat:@"%ld",indexPath.row - _firstWeekday + 1];

    }
    else{
        cell.dayLabel.text = @"";
    }
    
    return cell;
}
@end
