//
// TestCollectionViewController.m
// SensorsData
//
// Created by 王灼洲 on 2017/11/3.
// Copyright © 2015-2022 Sensors Data Co., Ltd. All rights reserved.
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//     http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.
//

#import "TestCollectionViewController.h"
#import <SensorsAnalyticsSDK/SensorsAnalyticsSDK.h>

@interface CustomCollectionViewCell : UICollectionViewCell

@end
@implementation CustomCollectionViewCell



@end

@interface TestCollectionViewController ()<UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout,SAUIViewAutoTrackDelegate>
@property(nonatomic,strong)NSMutableArray * dataArray;
@property(nonatomic,strong)UICollectionView *collectionView;
@end

@implementation TestCollectionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.dataArray = [NSMutableArray arrayWithArray:@[@1,@2,@3,@4]];
    self.view.backgroundColor = [UIColor whiteColor];
    self.collectionView = [[UICollectionView alloc]initWithFrame:self.view.bounds collectionViewLayout:[[UICollectionViewFlowLayout alloc]init]];
    self.collectionView.backgroundColor = [UIColor clearColor];
    self.collectionView.delegate = self;
    self.collectionView.dataSource = self;
    [self.collectionView registerClass:[CustomCollectionViewCell class] forCellWithReuseIdentifier:@"identifier"];
    [self.view addSubview:self.collectionView];
    
    
    self.collectionView.sensorsAnalyticsDelegate = self;
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.dataArray.count;
}

-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 3;
}

- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    CustomCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"identifier" forIndexPath:indexPath];
    
    for ( UIView *view in cell.contentView.subviews) {
        [view removeFromSuperview];
    }
    
//   UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
//   [button setBackgroundColor:[UIColor whiteColor]];
//   [button setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
//   [button setTitle:[NSString stringWithFormat:@"%@",self.dataArray[indexPath.item]] forState:UIControlStateNormal];
//   button.frame = CGRectMake(0, 0, 60, 60);
    
    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 60, 60)];
    label.text = [NSString stringWithFormat:@"%ld:%@",(long)indexPath.section, self.dataArray[indexPath.item]];
    label.textColor = [UIColor redColor];
    [cell.contentView addSubview:label];
//   [cell.contentView addSubview:button];
    
    return cell;
}

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    return CGSizeMake(60, 60);
}

-(UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section {
    return UIEdgeInsetsMake(0, 0, 0, 0);
}

@end

@implementation TestCollectionViewController_A

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    [super collectionView:collectionView didSelectItemAtIndexPath:indexPath];
}


@end
@implementation TestCollectionViewController_B

//-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
//{
//   
//}
@end
