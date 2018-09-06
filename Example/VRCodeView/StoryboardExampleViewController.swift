//
//  StoryboardExampleViewController.swift
//  VRCodeView_Example
//
//  Created by Vatsal Rustagi on 9/6/18.
//  Copyright © 2018 CocoaPods. All rights reserved.
//

import UIKit
import VRCodeView

class StoryboardExampleViewController: UIViewController {

	@IBOutlet weak var codeView: VRCodeView!
	@IBOutlet weak var codeEnteredLabel: UILabel!
	@IBAction func clearButtonPressed(_ sender: UIButton) {
		codeView.clear()
	}

	override func viewDidLoad() {
		codeView.allowedCharacters = CharacterSet.letters
		codeView.delegate = self
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

extension StoryboardExampleViewController: VRCodeViewDelegate {
	func didCompleteCodeEntry(codeEntered: String) {
		codeEnteredLabel.text = codeEntered
	}
}
