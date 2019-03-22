//
//  HKLSegmentedControl.swift
//  HKLSegmentedControl
//
//  Created by Hirohito Kato on 2019/03/22.
//  Copyright (c) 2019 Hirohito Kato. MIT License.
//

import UIKit

public protocol HKLSegmentedControlDelegate: class {

    /// Called when start touching the segmented control.
    ///
    /// This is optional.
    ///
    /// - Parameters:
    ///   - control: The HKLSegmentedControl object you touched.
    ///   - highlightedSegmentIndex: Current segment index you touched.
    func segmentedControl(_ control: HKLSegmentedControl, didBeginTouch index:Int)


    /// Called when the touched segment is changed.
    ///
    /// This method is only called when you are touching the segmented control.
    /// It is not called if you touch up it. To handle touch end event, use default "Value Changed" event.
    /// This is optional.
    ///
    /// - Parameters:
    ///   - control: The HKLSegmentedControl object you touched.
    ///   - index: Current segment index you are touching.
    func segmentedControl(_ control: HKLSegmentedControl, didChangedIndex index: Int)
}


/// HKLSegmentedControl class is the subclass of <code>UISegmentedControl</code>.
/// In addition to full feature of <code>UISegmentedControl</code>, it can fire
/// <b>dynamic value changed</b> event.
public class HKLSegmentedControl : UISegmentedControl {

    /// The object that acts as the delegate of the segmented control.
    public weak var delegate: HKLSegmentedControlDelegate?

    /// Current highlighted segment index you touch. If you don't touch it,
    ///  The value is same with that of <code>selectedSegmentIndex</code> property.
    public private(set) var highlightedSegmentIndex: Int = 0

    public override init(frame: CGRect) {
        super.init(frame: frame)
        highlightedSegmentIndex = selectedSegmentIndex
    }

    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        highlightedSegmentIndex = selectedSegmentIndex
    }
}

public extension HKLSegmentedControl {
    public override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)

        guard let touch = touches.first else { return }

        let index = currentHighlightedSegmentIndex(with: touch.location(in: self))

        if index >= 0 && index != highlightedSegmentIndex {
            highlightedSegmentIndex = index
            delegate?.segmentedControl(self, didBeginTouch: highlightedSegmentIndex)
        }
    }

    public override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesMoved(touches, with: event)

        guard let touch = touches.first else { return }

        let index = currentHighlightedSegmentIndex(with: touch.location(in: self))

        if index >= 0 && index != highlightedSegmentIndex {
            highlightedSegmentIndex = index
            delegate?.segmentedControl(self, didChangedIndex: highlightedSegmentIndex)
        }
    }

    public override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesEnded(touches, with: event)

        highlightedSegmentIndex = selectedSegmentIndex
    }

    public override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesCancelled(touches, with: event)

        highlightedSegmentIndex = selectedSegmentIndex
    }
}

// MARK: - Private methods
private extension HKLSegmentedControl {
    func sortedSubviews(ofView parent: UIView) -> [UIView] {
        return parent.subviews.sorted {
            $0.frame.origin.x < $1.frame.origin.x
        }
    }

    func currentHighlightedSegmentIndex(with touchedPoint: CGPoint) -> Int {
        let sorted = sortedSubviews(ofView: self)
        for i in 0..<sorted.count {
            let segment = sorted[i]
            if touchedPoint.x >= segment.frame.minX
                && touchedPoint.x <= segment.frame.maxX
                && touchedPoint.y >= -segment.frame.height * 2.43
                && touchedPoint.y <= segment.frame.height * 3.43 {
                return i
            }
        }
        return selectedSegmentIndex
    }
}

public extension HKLSegmentedControlDelegate {
    func segmentedControl(_ control:HKLSegmentedControl, didBeginTouch index:Int) {}
    func segmentedControl(_ control: HKLSegmentedControl, didChangedIndex index: Int) {}
}
