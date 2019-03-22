//
//  ViewController.swift
//  Sample
//
//  Created by Hirohito Kato on 2019/03/22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var indexLabel: UILabel!
    @IBOutlet weak var segmentedControl: HKLSegmentedControl!

    override func viewDidLoad() {
        super.viewDidLoad()

        segmentedControl.delegate = self
    }

    @IBAction func valueChanged(_ sender: HKLSegmentedControl) {
        indexLabel.text = "\(sender.selectedSegmentIndex)"
        indexLabel.textColor = .blue
    }
}

extension ViewController: HKLSegmentedControlDelegate {
    func segmentedControl(_ control:HKLSegmentedControl, didBeginTouch index:Int) {
        indexLabel.text = "\(control.highlightedSegmentIndex)"
        indexLabel.textColor = .brown
    }
    func segmentedControl(_ control: HKLSegmentedControl, didChangedIndex index: Int) {
        indexLabel.text = "\(control.highlightedSegmentIndex)"
        indexLabel.textColor = .red
    }
}
