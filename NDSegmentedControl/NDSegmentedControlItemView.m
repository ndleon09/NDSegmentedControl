//
//  NDSegmentedControlItemView.m
//  LaNeveraRoja
//
//  Created by Nelson on 06/08/14.
//  Copyright (c) 2014 MO2O. All rights reserved.
//

#import "NDSegmentedControlItemView.h"

const CGFloat kNDSegmentedControlItemViewWith = 35.;

@implementation NDSegmentedControlItemObject

+(instancetype)itemWithTitle:(NSString*)title value:(NSNumber*)value
{
    return [[self alloc] initWithTitle:title value:value];
}

-(instancetype)initWithTitle:(NSString*)title value:(NSNumber*)value
{
    if (self = [super init]) {
        _title = title;
        _value = value;
    }
    return self;
}

-(BOOL)isEqual:(NDSegmentedControlItemObject*)object
{
    return [self.value isEqualToNumber:object.value];
}

@end

@implementation NDSegmentedControlItemView

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
    self.layer.cornerRadius = self.frame.size.width / 2;
}

-(void)setItem:(id<NDSegmentedControlItem>)item
{
    _item = item;
    
    [self setTitle:item.title forState:UIControlStateNormal];
}

-(void)setItemSelected:(BOOL)itemSelected
{
    _itemSelected = itemSelected;
    
    [UIView animateWithDuration:0.1 animations:^{
        self.backgroundColor = itemSelected ? self.tintColor : [UIColor clearColor];
        [self setTitleColor:(itemSelected ? [UIColor whiteColor] : self.titleLabelColor) forState:UIControlStateNormal];
    }];
}

-(void)setTitleLabelFont:(UIFont *)titleLabelFont
{
    _titleLabelFont = titleLabelFont;
    
    self.titleLabel.font = titleLabelFont;
}

-(void)setTitleLabelColor:(UIColor *)titleLabelColor
{
    _titleLabelColor = titleLabelColor;
    
    [self setTitleColor:titleLabelColor forState:UIControlStateNormal];
}

- (void)setHighlighted:(BOOL)highlighted
{
    [super setHighlighted:highlighted];
    
    if (highlighted) {
        self.backgroundColor = self.itemSelected ? self.tintColor : [self.tintColor colorWithAlphaComponent:0.5];
        [self setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    }
    else {
        self.backgroundColor = self.itemSelected ? self.tintColor : [UIColor clearColor];
        [self setTitleColor:(self.itemSelected ? [UIColor whiteColor] : self.titleLabelColor) forState:UIControlStateNormal];
    }
}

@end
