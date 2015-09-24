//
//  ViewController.m
//  NDSegmentedControl
//
//  Created by Nelson on 15/09/14.
//  Copyright (c) 2014 MO2O. All rights reserved.
//

#import "ViewController.h"
#import "NDSegmentedControl.h"

@interface ViewController ()

@property (nonatomic, strong) NDSegmentedControl *segmentedControl;

@end

@implementation ViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    self.title = @"Schedule";
    
    __typeof (&*self) __weak weakSelf = self;
    
    self.segmentedControl = [[NDSegmentedControl alloc] initWithFrame:CGRectMake(20, 40, 170, 40)];
    self.segmentedControl.required = YES;
    self.segmentedControl.tintColor = [UIColor darkGrayColor];
    self.segmentedControl.titleFont = [UIFont systemFontOfSize:15];
    [self.segmentedControl setUpdateSelectedItemHandler:^(id<NDSegmentedControlItem> item) {
        [weakSelf selectedItemChange:item];
    }];
    [self.view addSubview:self.segmentedControl];
    
    NSMutableArray *months = [NSMutableArray arrayWithArray:[[[NSDateFormatter alloc] init] shortMonthSymbols]];
    NSMutableArray *items = [[NSMutableArray alloc] init];
    [months enumerateObjectsUsingBlock:^(NSString *object, NSUInteger index, BOOL *stop) {
        NDSegmentedControlItemObject *item = [NDSegmentedControlItemObject itemWithTitle:object value:@(index + 1)];
        [items addObject:item];
    }];
    
    self.segmentedControl.items = [NSArray arrayWithArray:items];
    self.segmentedControl.selectedItem = [items objectAtIndex:7];
}

-(void)selectedItemChange:(id<NDSegmentedControlItem>)selectedItem
{
    NSLog(@"Selected item: %@:%@", selectedItem.title, selectedItem.value);
}

@end
