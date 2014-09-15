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
    
    self.segmentedControl = [[NDSegmentedControl alloc] initWithFrame:CGRectMake(15, CGRectGetHeight(self.view.frame) / 2, CGRectGetWidth(self.view.frame) - 30, 40)];
    self.segmentedControl.required = YES;
    self.segmentedControl.tintColor = [UIColor darkGrayColor];
    self.segmentedControl.titleFont = [UIFont systemFontOfSize:15];
    [self.segmentedControl setUpdateSelectedItemHandler:^(id<NDSegmentedControlItem> item) {
        [weakSelf selectedItemChange:item];
    }];
    [self.view addSubview:self.segmentedControl];
    
    NSCalendar *gregorian = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
    NSInteger weekDay = [gregorian ordinalityOfUnit:NSWeekdayCalendarUnit inUnit:NSWeekCalendarUnit forDate:[NSDate date]];
    
    NSMutableArray *weekdays = [NSMutableArray arrayWithArray:[[[NSDateFormatter alloc] init] shortWeekdaySymbols]];
    NSMutableArray *items = [[NSMutableArray alloc] init];
    [weekdays enumerateObjectsUsingBlock:^(NSString *object, NSUInteger index, BOOL *stop) {
        NDSegmentedControlItemObject *item = [NDSegmentedControlItemObject itemWithTitle:object value:@(index + 1)];
        [items addObject:item];
    }];
    
    self.segmentedControl.items = [NSArray arrayWithArray:items];
    self.segmentedControl.selectedItem = [items objectAtIndex:weekDay - 1];
}

-(void)selectedItemChange:(id<NDSegmentedControlItem>)selectedItem
{
    NSLog(@"Selected item: %@:%@", selectedItem.title, selectedItem.value);
}

@end
