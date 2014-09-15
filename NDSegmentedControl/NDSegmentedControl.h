//
//  NDSegmentedControl.h
//  LaNeveraRoja
//
//  Created by Nelson on 06/08/14.
//  Copyright (c) 2014 MO2O. All rights reserved.
//

#import "NDSegmentedControlItemView.h"

extern const CGFloat kNDSegmentedControlSpaceBetweenItems;

@interface NDSegmentedControl : UIControl

/**
 Array of items to represents objects id<NDSegmentedControlItem>
 */
@property (nonatomic, strong) NSArray *items;

/**
 The selected item
 */
@property (nonatomic, assign) id<NDSegmentedControlItem> selectedItem;

/**
 Required selected item?
 */
@property (nonatomic, assign) BOOL required;

/**
 Background color for selected item
 */
@property (nonatomic, strong) UIColor *tintColor UI_APPEARANCE_SELECTOR;

/**
 Font for all items
 */
@property (nonatomic, strong) UIFont *titleFont UI_APPEARANCE_SELECTOR;

/**
 Title color for all items
 */
@property (nonatomic, strong) UIColor *titleColor UI_APPEARANCE_SELECTOR;

/**
 Block to call when selected item change
 */
@property (copy, readwrite, nonatomic) void (^updateSelectedItemHandler)(id<NDSegmentedControlItem> selectedItem);

@end
