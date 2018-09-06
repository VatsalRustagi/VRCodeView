//
//  CodeExampleViewController.swift
//  VRCodeView_Example
//
//  Created by Vatsal Rustagi on 9/6/18.
//  Copyright © 2018 CocoaPods. All rights reserved.
//

import UIKit
import VRCodeView

class CodeExampleViewController: UIViewController {
	@IBOutlet weak var codeEnteredLabel: UILabel!
	@IBAction func clearButtonPressed(_ sender: UIButton) {
		codeView?.clear()
	}

	var codeView: VRCodeView?

	override func viewDidLoad() {
        super.viewDidLoad()

		let width: CGFloat = 200
		let codeViewFrame = CGRect(x: view.frame.midX - width/2, y: 150, width: width, height: 65)

		codeView = VRCodeView(frame: codeViewFrame)
		codeView?.delegate = self

		// Shadow properties
		codeView?.layer.shadowColor = UIColor.black.cgColor
		codeView?.layer.shadowOffset = CGSize(width: 0, height: 0)
		codeView?.layer.shadowRadius = 10.0
		codeView?.layer.shadowOpacity = 0.4

		// Keyboard properties
		codeView?.allowedCharacters = .decimalDigits
		codeView?.autocorrectionType = .no
		codeView?.spellCheckingType = .no
		codeView?.keyboardType = .decimalPad
		codeView?.returnKeyType = .go

		// Textfield properties
		codeView?.font = UIFont(name: "Avenir", size: 20)!
		codeView?.spacing = 5
		codeView?.numberOfFields = 3

		// Textfield border properties
		codeView?.cornerRadius = 10
		codeView?.thickBorderColor = UIColor.purple
		codeView?.thinBorderColor = UIColor.purple
		codeView?.thickBorderWidth = 2.5
		codeView?.thinBorderWidth = 1.0

		self.view.addSubview(codeView!)
    }
}

extension CodeExampleViewController: VRCodeViewDelegate {
	func didCompleteCodeEntry(codeEntered: String) {
		codeEnteredLabel.text = codeEntered
	}
}
