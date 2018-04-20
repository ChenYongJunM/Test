//
//  ViewController.m
//  testCollection
//
//  Created by Chen on 2018/4/16.
//  Copyright © 2018年 YFY. All rights reserved.
//

#import "ViewController.h"
#import "TestCollectionViewCell.h"
#import "TestCollectionViewLayout.h"
#import "NewTestCollectionViewLayout.h"
@interface ViewController ()<UICollectionViewDelegate,UICollectionViewDataSource>

@property(nonatomic,strong)UICollectionView *collectionView;

@property(nonatomic,strong)NSMutableArray *dataArray;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    NSMutableArray;
    
    self.dataArray = @[].mutableCopy;

    UICollectionView *collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 100, self.view.bounds.size.width, 200) collectionViewLayout:[[NewTestCollectionViewLayout alloc]init]];
    collectionView.delegate = self;
    collectionView.dataSource = self;
    [collectionView registerNib:[UINib nibWithNibName:@"TestCollectionViewCell" bundle:nil] forCellWithReuseIdentifier:@"test"];
    [self.view addSubview:collectionView];
    self.collectionView = collectionView;
    
    // 创建数据
    for (NSInteger index = 1; index <= 20; index ++) {
        NSString *str = [NSString stringWithFormat:@"%zd",index];
        [self.dataArray addObject:str];
    }
    self.collectionView = collectionView;
    [self.collectionView reloadData];
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.dataArray.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    TestCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"test" forIndexPath:indexPath];
    return cell;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
