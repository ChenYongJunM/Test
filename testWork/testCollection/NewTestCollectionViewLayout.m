//
//  NewTestCollectionViewLayout.m
//  testCollection
//
//  Created by Chen on 2018/4/20.
//  Copyright © 2018年 YFY. All rights reserved.
//

#import "NewTestCollectionViewLayout.h"

@implementation NewTestCollectionViewLayout

- (BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)newBounds
{
    return YES;
}
/**
 返回的是每一个属性
 
 @param indexPath indexPath
 @return 属性
 */
- (nullable UICollectionViewLayoutAttributes *)layoutAttributesForItemAtIndexPath:(NSIndexPath *)indexPath{
    NSInteger count = [self.collectionView numberOfItemsInSection:0];
    NSArray *angleArray = @[@(0),@(-0.2),@(-0.8),@(0.2),@(0.8)];
    UICollectionViewLayoutAttributes *attrs = [UICollectionViewLayoutAttributes layoutAttributesForCellWithIndexPath:indexPath];
    attrs.center = CGPointMake(150, 100);
    attrs.size = CGSizeMake(100, 100);
    if (indexPath.item >= 5) {
        attrs.hidden = YES;
    }else{
        attrs.hidden = NO;
        attrs.transform = CGAffineTransformMakeRotation([angleArray[indexPath.item] floatValue]);
    }
    attrs.zIndex = count - indexPath.item;
    return attrs;
}
/**
 这个方法是间距变化返回每一个attr的数组
 
 @param rect rect
 @return 属性的数组
 */
- (nullable NSArray<__kindof UICollectionViewLayoutAttributes *> *)layoutAttributesForElementsInRect:(CGRect)rect{
    
    NSMutableArray *dataArray = [NSMutableArray array];
    NSInteger count = [self.collectionView numberOfItemsInSection:0];
    for (NSInteger index = 0; index < count; index++) {
        UICollectionViewLayoutAttributes *attrs = [self layoutAttributesForItemAtIndexPath:[NSIndexPath indexPathForRow:index inSection:0]];
        [dataArray addObject:attrs];
    }
    return dataArray;
}
@end
