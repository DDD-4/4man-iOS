//
//  UIKitExtension.swift
//  EatTogether
//
//  Created by 박진수 on 18/08/2020.
//  Copyright © 2020 FourMan. All rights reserved.
//

import UIKit

@IBDesignable
extension UIView {
    @IBInspectable var cornerRadius: CGFloat {
        get { return layer.cornerRadius }
        set { layer.cornerRadius = newValue }
    }
}

extension UIViewController {
    class func viewController(from storyboardName: String) -> UIViewController {
        let storyboard = UIStoryboard.init(name: storyboardName, bundle: nil)
        return storyboard.instantiateViewController(withIdentifier: self.className)
    }

    class var className: String {
        return String.init(describing: self).components(separatedBy: ".").last!
    }

    func viewController<T: UIViewController>(storyboard: String) -> T? {
        let storyBoard = UIStoryboard.init(name: storyboard, bundle: nil)
        return storyBoard.instantiateViewController(withIdentifier: T.className) as? T
    }

    class func pageChildViewController<T: BasePageChildViewController>(storyboard: String = "Splash", dataController: SplashDataController) -> T? {
        let storyBoard = UIStoryboard.init(name: storyboard, bundle: nil)
        let viewController = storyBoard.instantiateViewController(withIdentifier: self.className) as? T
        viewController?.dataController = dataController
        return viewController
    }
}

@IBDesignable
extension UIButton {
    @IBInspectable var selectedImage: UIImage {
        get { self.selectedImage }
        set { self.setImage(newValue, for: .selected)}
    }

    @IBInspectable var normalImage: UIImage {
        get { self.normalImage }
        set { self.setImage(newValue, for: .normal)}
    }
}

extension NSLayoutConstraint {
    @IBInspectable var heightConstraint: CGFloat {
        get { self.heightConstraint }
        set { self.constant = UIScreen.main.bounds.height / 812 * newValue }
    }

    @IBInspectable var widtConstraint: CGFloat {
        get { self.widtConstraint }
        set { self.constant = UIScreen.main.bounds.width / 375 * newValue }
    }
}

@IBDesignable
class FormTextField: UITextField {

    @IBInspectable var inset: CGFloat = 0

    override func textRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.insetBy(dx: inset, dy: inset)
    }

    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        return textRect(forBounds: bounds)
    }

}

@IBDesignable
extension UITextView: UITextViewDelegate {

    /// Resize the placeholder when the UITextView bounds change
    override open var bounds: CGRect {
        didSet {
            self.resizePlaceholder()
        }
    }

    /// The UITextView placeholder text
    @IBInspectable var placeholder: String? {
        get {
            var placeholderText: String?

            if let placeholderLabel = self.viewWithTag(100) as? UILabel {
                placeholderText = placeholderLabel.text
            }

            return placeholderText
        }
        set {
            if let placeholderLabel = self.viewWithTag(100) as! UILabel? {
                placeholderLabel.text = newValue
                placeholderLabel.sizeToFit()
            } else {
                self.addPlaceholder(newValue!)
            }
        }
    }

    /// When the UITextView did change, show or hide the label based on if the UITextView is empty or not
    ///
    /// - Parameter textView: The UITextView that got updated
    public func textViewDidChange(_ textView: UITextView) {
        if let placeholderLabel = self.viewWithTag(100) as? UILabel {
            placeholderLabel.isHidden = !self.text.isEmpty
        }
    }

    /// Resize the placeholder UILabel to make sure it's in the same position as the UITextView text
    private func resizePlaceholder() {
        if let placeholderLabel = self.viewWithTag(100) as! UILabel? {
            let labelX = self.textContainer.lineFragmentPadding
            let labelY = self.textContainerInset.top - 2
            let labelWidth = self.frame.width - (labelX * 2)
            let labelHeight = placeholderLabel.frame.height

            placeholderLabel.frame = CGRect(x: labelX, y: labelY, width: labelWidth, height: labelHeight)
        }
    }

    /// Adds a placeholder UILabel to this UITextView
    private func addPlaceholder(_ placeholderText: String) {
        let placeholderLabel = UILabel()

        placeholderLabel.text = placeholderText
        placeholderLabel.sizeToFit()

        placeholderLabel.font = self.font
        placeholderLabel.textColor = UIColor.lightGray
        placeholderLabel.tag = 100

        placeholderLabel.isHidden = !self.text.isEmpty

        self.addSubview(placeholderLabel)
        self.resizePlaceholder()
        self.delegate = self
    }

}
