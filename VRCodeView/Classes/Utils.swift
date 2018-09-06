//
//  Utils.swift
//  VRCodeView
//
//  Created by Vatsal Rustagi on 9/6/18.
//

import Foundation

extension UIView {
	/// Sets shadow for a UIView
	///
	/// - Parameters:
	///   - color: shadow color
	///   - offset: shadow offset
	///   - opacity: shadow opacity
	///   - radius: shadow blur radius
	///   - corderRadius: corner radius of the UIView
	func setShadowWithValues(color: UIColor, offset: CGSize, opacity: Float, radius: CGFloat, corderRadius: CGFloat) {
		self.layer.shadowColor = color.cgColor
		self.layer.shadowOffset = offset
		self.layer.shadowRadius = radius
		self.layer.shadowOpacity = opacity
		self.layer.cornerRadius = corderRadius
	}

	/// Sets border for a UIView
	///
	/// - Parameters:
	///   - color: border color
	///   - width: border width
	///   - corderRadius: corner radius of the UIView
	func setBorder(color: UIColor, width: CGFloat, corderRadius: CGFloat) {
		self.layer.borderColor = color.cgColor
		self.layer.borderWidth = width
		self.layer.cornerRadius = corderRadius
		self.clipsToBounds = true
	}
}
