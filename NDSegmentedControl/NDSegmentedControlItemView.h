//
//  NDSegmentedControlItemView.h
//  LaNeveraRoja
//
//  Created by Nelson on 06/08/14.
//  Copyright (c) 2014 MO2O. All rights reserved.
//

#import <UIKit/UIKit.h>

extern const CGFloat kNDSegmentedControlItemViewWith;

@protocol NDSegmentedControlItem <NSObject>

@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSNumber *value;

@end


@interface NDSegmentedControlItemObject : NSObject <NDSegmentedControlItem>

@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSNumber *value;

+(instancetype)itemWithTitle:(NSString*)title value:(NSNumber*)value;
-(instancetype)initWithTitle:(NSString*)title value:(NSNumber*)value;

@end


@interface NDSegmentedControlItemView : UIButton

@property (nonatomic, assign) id<NDSegmentedControlItem> item;

@property (nonatomic, strong) UIFont *titleLabelFont;
@property (nonatomic, strong) UIColor *titleLabelColor;

@property (nonatomic, assign) BOOL itemSelected;

@end
