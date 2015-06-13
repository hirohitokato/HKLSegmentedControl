//
//  HKLSegmentedControl.h
//
//  Created by Hirohito Kato on 2015/06/11.
//  Copyright (c) 2015 Hirohito Kato. MIT License.
//

#import <UIKit/UIKit.h>

@protocol HKLSegmentedControlDelegate;

/**
 * HKLSegmentedControl class is the subclass of <code>UISegmentedControl</code>.
 * In addition to full feature of <code>UISegmentedControl</code>, it can fire
 * <b>dynamic value changed</b> event.
 */
@interface HKLSegmentedControl : UISegmentedControl

/** The object that acts as the delegate of the segmented control. */
@property (nonatomic, weak)id<HKLSegmentedControlDelegate> delegate;

/**
 * Current highlighted segment index you touch. If you don't touch it,
 * The value is same with that of <code>selectedSegmentIndex</code> property.
 */
@property (nonatomic, readonly)NSInteger highlightedSegmentIndex;
@end

@protocol HKLSegmentedControlDelegate <NSObject>
@optional
/**
 * Called when the touched segment is changed.
 *
 * This method is only called when you are touching the segmented control.
 * It is not called if you touch up it. Use default "Value Changed" event to handle it.
 *
 * @param control                 The HKLSegmentedControl object you touched.
 * @param highlightedSegmentIndex Current segment index you touched.
 */
- (void)  segmentedControl:(HKLSegmentedControl*)control
didChangedHighlightedIndex:(NSInteger)highlightedSegmentIndex;
@end
