//
//  NDSegmentedControl.m
//  LaNeveraRoja
//
//  Created by Nelson on 06/08/14.
//  Copyright (c) 2014 MO2O. All rights reserved.
//

#import "NDSegmentedControl.h"

const CGFloat kNDSegmentedControlSpaceBetweenItems = 5.;

@interface NDSegmentedControl()

@property (nonatomic, strong) NDSegmentedControlItemView *selectedItemView;

@property (nonatomic, strong) UIScrollView *itemsScrollView;

@end

@implementation NDSegmentedControl

-(void)awakeFromNib
{
    [self setupViews];
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setupViews];
    }
    return self;
}

- (void)setupViews
{
    self.autoresizingMask = UIViewAutoresizingFlexibleWidth;
    self.backgroundColor = [UIColor whiteColor];
    self.tintColor = [UIColor redColor];
    self.titleFont = [UIFont systemFontOfSize:14];
    self.titleColor = [UIColor darkGrayColor];
    self.required = NO;
}

-(void)setItems:(NSArray<NDSegmentedControlItem> *)items
{
    _items = items;
    _selectedItem = nil;
    
    [self updateItemsView];
}

-(void)setSelectedItemView:(NDSegmentedControlItemView *)selectedItemView
{
    _selectedItemView = selectedItemView;
    
    if (_selectedItemView) {
        _selectedItemView.itemSelected = YES;
        _selectedItem = selectedItemView.item;
    }
    else {
        _selectedItem = nil;
    }
    
    if (self.updateSelectedItemHandler) {
        self.updateSelectedItemHandler(selectedItemView.item);
    }
}

-(void)setSelectedItem:(id<NDSegmentedControlItem>)selectedItem
{
    _selectedItem = selectedItem;
    
    if (selectedItem != nil) {
        for (id subview in self.itemsScrollView.subviews) {
            if ([subview isKindOfClass:[NDSegmentedControlItemView class]]) {
                NDSegmentedControlItemView *itemView = (NDSegmentedControlItemView *)subview;
                if ([itemView.item isEqual:selectedItem]) {
                    self.selectedItemView = itemView;
                    break;
                }
            }
        }
    }
}

-(UIScrollView *)itemsScrollView
{
    if (!_itemsScrollView) {
        _itemsScrollView = [[UIScrollView alloc] initWithFrame:self.bounds];
        _itemsScrollView.showsHorizontalScrollIndicator = NO;
        _itemsScrollView.showsVerticalScrollIndicator = NO;
        _itemsScrollView.autoresizingMask = self.autoresizingMask;
        [self addSubview:_itemsScrollView];
    }
    return _itemsScrollView;
}

-(void)updateItemsView
{
    [self.itemsScrollView.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
    
    CGFloat currentItemXPosition = kNDSegmentedControlSpaceBetweenItems;
    
    for (id<NDSegmentedControlItem> item in self.items) {
        
        NDSegmentedControlItemView *itemView = [[NDSegmentedControlItemView alloc] initWithFrame:CGRectMake(currentItemXPosition, 0, kNDSegmentedControlItemViewWith, kNDSegmentedControlItemViewWith)];
        itemView.item = item;
        itemView.tintColor = self.tintColor;
        itemView.titleLabelFont = self.titleFont;
        itemView.titleLabelColor = self.titleColor;
        [itemView addTarget:self action:@selector(updateSelectedItem:) forControlEvents:UIControlEventTouchUpInside];
        [self.itemsScrollView addSubview:itemView];
        
        currentItemXPosition += kNDSegmentedControlItemViewWith + kNDSegmentedControlSpaceBetweenItems;
    }
    
    self.itemsScrollView.contentSize = CGSizeMake(currentItemXPosition, self.frame.size.height);
}

-(void)updateSelectedItem:(NDSegmentedControlItemView*)item
{
    if (self.selectedItemView != nil) {
        if ([self.selectedItemView isEqual:item] == YES) {
            if (!self.required) {
                self.selectedItemView.itemSelected = NO;
                self.selectedItemView = nil;
            }
        }
        else {
            self.selectedItemView.itemSelected = NO;
            self.selectedItemView = item;
        }
    }
    else {
        self.selectedItemView = item;
    }
}

@end
