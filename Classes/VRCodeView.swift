//
//  VRCodeView.swift
//  VRCodeView
//
//  Created by Vatsal Rustagi on 9/6/18.
//

import UIKit

public protocol VRCodeViewDelegate: AnyObject {
	func didCompleteCodeEntry(codeEntered: String)
}

// MARK: - VARIABLES AND OVERRIDEN METHODS
@IBDesignable
open class VRCodeView: UIView, UIKeyInput {
	@IBInspectable public var numberOfFields: Int = 0 {
		didSet {
			initialization()
		}
	}
	@IBInspectable public var cornerRadius: CGFloat = 3.0 {
		didSet {
			for label in labels {
				label.setBorder(color: self.thinBorderColor, width: self.thinBorderWidth, corderRadius: self.cornerRadius)
			}
			for label in thickBorderedLabels {
				label.setBorder(color: self.thickBorderColor, width: self.thickBorderWidth, corderRadius: self.cornerRadius)
			}
		}
	}
	@IBInspectable public var thinBorderWidth: CGFloat = 1.0 {
		didSet {
			for label in labels {
				label.setBorder(color: self.thinBorderColor, width: self.thinBorderWidth, corderRadius: self.cornerRadius)
			}
			for label in thickBorderedLabels {
				label.setBorder(color: self.thickBorderColor, width: self.thickBorderWidth, corderRadius: self.cornerRadius)
			}
		}
	}
	@IBInspectable public var thickBorderWidth: CGFloat = 3.0 {
		didSet {
			for label in labels {
				label.setBorder(color: self.thinBorderColor, width: self.thinBorderWidth, corderRadius: self.cornerRadius)
			}
			for label in thickBorderedLabels {
				label.setBorder(color: self.thickBorderColor, width: self.thickBorderWidth, corderRadius: self.cornerRadius)
			}
		}
	}
	@IBInspectable public var thinBorderColor: UIColor = .black {
		didSet {
			for label in labels {
				label.setBorder(color: self.thinBorderColor, width: self.thinBorderWidth, corderRadius: self.cornerRadius)
			}
			for label in thickBorderedLabels {
				label.setBorder(color: self.thickBorderColor, width: self.thickBorderWidth, corderRadius: self.cornerRadius)
			}
		}
	}
	@IBInspectable public var thickBorderColor: UIColor = .black {
		didSet {
			for label in labels {
				label.setBorder(color: self.thinBorderColor, width: self.thinBorderWidth, corderRadius: self.cornerRadius)
			}
			for label in thickBorderedLabels {
				label.setBorder(color: self.thickBorderColor, width: self.thickBorderWidth, corderRadius: self.cornerRadius)
			}
		}
	}
	@IBInspectable public var spacing: CGFloat = 10 {
		didSet {
			initialization()
		}
	}

	public var allowedCharacters = CharacterSet.decimalDigits
	public var font = UIFont.systemFont(ofSize: 16, weight: .semibold)
	public var isUpperCased = false

	public var code = ""
	public weak var delegate: VRCodeViewDelegate?

	private var stackView: UIStackView?
	private var labels = [UITextField]()
	private var selectedLabel: UITextField?
	private var currentLabel: UITextField? {
		set {
			selectedLabel = newValue
			updateBorder()
		} get {
			return selectedLabel
		}
	}
	private var thickBorderedLabels = [UITextField]()

	public var keyboardType: UIKeyboardType = .asciiCapable
	public var returnKeyType: UIReturnKeyType = .done
	public var autocorrectionType: UITextAutocorrectionType = .no
	public var spellCheckingType: UITextSpellCheckingType = .no

	public var hasText: Bool {
		return code.isEmpty
	}

	override open var canBecomeFirstResponder: Bool {
		return true
	}

	override public init(frame: CGRect) {
		super.init(frame: frame)
		initialization()
	}

	required public init?(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder)
		initialization()
	}

	override open func awakeFromNib() {
		super.awakeFromNib()
		initialization()
	}
}

// MARK: - PRIVATE METHODS
extension VRCodeView {
	private func initialization() {
		let tap = UITapGestureRecognizer(target: self, action: #selector(self.handleTap))
		self.addGestureRecognizer(tap)

		if stackView != nil {
			for label in labels {
				label.removeFromSuperview()
			}
			stackView?.removeFromSuperview()
			stackView = nil
			labels.removeAll()
		}

		stackView = UIStackView(frame: self.bounds)
		stackView?.alignment = .fill
		stackView?.axis = .horizontal
		stackView?.distribution = .fillEqually
		stackView?.spacing = spacing

		for _ in 0..<numberOfFields {
			let label = UITextField()
			label.backgroundColor = .white
			label.textColor = .black
			setThinBorder(for: label)
			label.font = self.font
			label.textAlignment = .center
			label.isUserInteractionEnabled = false
			labels.append(label)
			stackView?.addArrangedSubview(label)
		}

		self.addSubview(stackView!)
	}

	private func updateBorder() {
		guard currentLabel != nil else {
			for label in thickBorderedLabels {
				setThinBorder(for: label)
			}
			return
		}
		setThickBorder(for: currentLabel!)
		for label in thickBorderedLabels where label != currentLabel! {
			setThinBorder(for: label)
		}
	}

	private func setThinBorder(for label: UITextField) {
		UIView.transition(with: self, duration: 0.1, options: .transitionCrossDissolve, animations: {
			label.setBorder(color: self.thinBorderColor, width: self.thinBorderWidth, corderRadius: self.cornerRadius)
		}, completion: nil)
	}

	private func setThickBorder(for label: UITextField) {
		UIView.transition(with: self, duration: 0.1, options: .transitionCrossDissolve, animations: {
			label.setBorder(color: self.thickBorderColor, width: self.thickBorderWidth, corderRadius: self.cornerRadius)
		}, completion: nil)
		thickBorderedLabels.append(label)
	}

	@objc private func handleTap() {
		if code.count < self.numberOfFields {
			currentLabel = labels[code.count]
		} else {
			currentLabel = nil
		}
		becomeFirstResponder()
	}
}

// MARK: - INTERNAL METHODS
extension VRCodeView {
	public func clear() {
		self.code = ""
		for i in 0..<numberOfFields {
			labels[i].text = ""
		}
		currentLabel = labels[0]
	}

	public func insertText(_ text: String) {
		if text == "\n" {
			resignFirstResponder()
		}
		guard code.count < self.numberOfFields, text.rangeOfCharacter(from: allowedCharacters) != nil else {
			return
		}
		var updatedText = text
		if isUpperCased {
			updatedText = updatedText.uppercased()
		}

		labels[code.count].text = updatedText
		code.append(updatedText)
		if code.count < self.numberOfFields {
			currentLabel = labels[code.count]
		} else {
			delegate?.didCompleteCodeEntry(codeEntered: code)
			resignFirstResponder()
			currentLabel = nil
		}
	}

	public func deleteBackward() {
		guard !code.isEmpty else {
			return
		}
		code.removeLast()
		labels[code.count].text = ""
		currentLabel = labels[code.count]
	}
}

