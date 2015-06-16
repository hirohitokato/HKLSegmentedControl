//
//  ViewController.m
//  HKLSegmentedControl
//
//  Created by Hirohito Kato on 2015/06/11.
//  Copyright (c) 2015 Hirohito Kato. MIT License.
//

#import "ViewController.h"
#import "HKLSegmentedControl.h"

@interface ViewController () <HKLSegmentedControlDelegate>
@property (weak, nonatomic) IBOutlet HKLSegmentedControl *slidableSegment;
@property (weak, nonatomic) IBOutlet UILabel *indexLabel;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

	_slidableSegment.delegate = self;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

// Value Changed event.
- (IBAction)selected:(id)sender {
	_indexLabel.text = [NSString stringWithFormat:@"%ld", _slidableSegment.selectedSegmentIndex];
	_indexLabel.textColor = [UIColor blueColor];
}

// Delegate method.
- (void)segmentedControl:(HKLSegmentedControl *)control didBeginTouch:(NSInteger)highlightedSegmentIndex {
	_indexLabel.text = [NSString stringWithFormat:@"%ld", highlightedSegmentIndex];
	_indexLabel.textColor = [UIColor brownColor];
}
- (void)segmentedControl:(HKLSegmentedControl *)control didChangedHighlightedIndex:(NSInteger)highlightedSegmentIndex {
	_indexLabel.text = [NSString stringWithFormat:@"%ld", highlightedSegmentIndex];
	_indexLabel.textColor = [UIColor redColor];
}
@end
