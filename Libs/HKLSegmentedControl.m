//
//  HKLSegmentedControl.m
//
//  Created by Hirohito Kato on 2015/06/11.
//  Copyright (c) 2015 Hirohito Kato. MIT License.
//

#import "HKLSegmentedControl.h"

@interface HKLSegmentedControl () {
	struct {
		unsigned int didChangedHighlightedIndex : 1;
	} _delegateFlags;
}
@property (nonatomic, readwrite)NSInteger highlightedSegmentIndex;
@end

@implementation HKLSegmentedControl
- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        _highlightedSegmentIndex = self.selectedSegmentIndex;
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)coder {
    self = [super initWithCoder:coder];
    if (self) {
        _highlightedSegmentIndex = self.selectedSegmentIndex;
    }
    return self;
}

- (void)setDelegate:(id<HKLSegmentedControlDelegate>)delegate {
	_delegate = delegate;
	_delegateFlags.didChangedHighlightedIndex =
	[delegate respondsToSelector:@selector(segmentedControl:didChangedHighlightedIndex:)];
}

#pragma mark - Touch events
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    [super touchesBegan:touches withEvent:event];

    CGPoint touchedPoint = [[touches anyObject] locationInView:self];

	NSInteger index = [self currentHighlightedSegmentIndexWithTouchPoint:touchedPoint];

	if (index >= 0 && index != _highlightedSegmentIndex) {

		_highlightedSegmentIndex = index;
		if (_delegateFlags.didChangedHighlightedIndex) {

			[_delegate segmentedControl:self
			 didChangedHighlightedIndex:_highlightedSegmentIndex];
		}
	}
}

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event {
    [super touchesMoved:touches withEvent:event];

	CGPoint touchedPoint = [[touches anyObject] locationInView:self];

	NSInteger index = [self currentHighlightedSegmentIndexWithTouchPoint:touchedPoint];

	if (index >= 0 && index != _highlightedSegmentIndex) {
		_highlightedSegmentIndex = index;

		if (_delegateFlags.didChangedHighlightedIndex) {

			[_delegate segmentedControl:self
			 didChangedHighlightedIndex:_highlightedSegmentIndex];
		}
	}
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
    [super touchesEnded:touches withEvent:event];

    _highlightedSegmentIndex = self.selectedSegmentIndex;
}

- (void)touchesCancelled:(NSSet *)touches withEvent:(UIEvent *)event {
    [super touchesCancelled:touches withEvent:event];

    _highlightedSegmentIndex = self.selectedSegmentIndex;
}

#pragma mark - other private methods
- (NSArray *)sortedSubviewsOfView:(UIView *)view {

	return [view.subviews sortedArrayUsingComparator:
			^NSComparisonResult(UIView *obj1, UIView *obj2) {
				return obj1.frame.origin.x > obj2.frame.origin.x;
			}];
}

- (NSInteger)currentHighlightedSegmentIndexWithTouchPoint:(CGPoint)touchedPoint {

	NSArray *sorted = [self sortedSubviewsOfView:self];
	for (NSInteger i=0; i<sorted.count; ++i) {

		UIView *segment = sorted[i];
		if (touchedPoint.x >= CGRectGetMinX(segment.frame) &&
			touchedPoint.x <= CGRectGetMaxX(segment.frame) &&
			touchedPoint.y >= -CGRectGetHeight(segment.frame)*2.43 &&
			touchedPoint.y <=  CGRectGetHeight(segment.frame)*3.43) {
			return i;
		}
	}
	return self.selectedSegmentIndex;
}

@end
