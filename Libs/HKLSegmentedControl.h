//
//  HKLSegmentedControl.h
//
//  Created by Hirohito Kato on 2015/06/11.
//  Copyright (c) 2015 Hirohito Kato. MIT License.
//

#import <UIKit/UIKit.h>

@protocol HKLSegmentedControlDelegate;

@interface HKLSegmentedControl : UISegmentedControl
@property (nonatomic, weak)id<HKLSegmentedControlDelegate> delegate;
@property (nonatomic, readonly)NSInteger highlightedSegmentIndex;
@end

@protocol HKLSegmentedControlDelegate <NSObject>
@optional
- (void)  segmentedControl:(HKLSegmentedControl*)control
didChangedHighlightedIndex:(NSInteger)highlightedSegmentIndex;
@end
