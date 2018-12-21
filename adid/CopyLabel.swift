//
//  CopyLabel.swift
//  adid
//

import UIKit

class CopyLabel: UILabel {
    
    var isLongPress: Bool = false
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    func setup()  {
        self.isUserInteractionEnabled = true
        self.addGestureRecognizer(
            UILongPressGestureRecognizer(target: self, action: #selector(showContextMenu(_:))))
        
        NotificationCenter.default.addObserver(self, selector: #selector(backgroundWhite(_:)), name: UIMenuController.didHideMenuNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(backgroundBlue(_:)), name: UIMenuController.didShowMenuNotification, object: nil)
    }
    
    @objc func backgroundWhite(_ sender: Any?) {
        self.backgroundColor = UIColor.white
        isLongPress = false
    }
    
    @objc func backgroundBlue(_ sender: Any?) {
        if isLongPress {
            self.backgroundColor = UIColor(red: 0.0, green: 125.0/255.0, blue: 1.0, alpha: 0.2)
        }
    }
    
    @objc func showContextMenu(_ sender: Any?) {
        self.becomeFirstResponder()
        if !UIMenuController.shared.isMenuVisible {
            UIMenuController.shared.setTargetRect(self.bounds, in: self)
            UIMenuController.shared.setMenuVisible(true, animated: true)
            isLongPress = true
        }
    }
    
    override var canBecomeFirstResponder: Bool {
        return true
    }
    
    override func copy(_ sender: Any?) {
        UIPasteboard.general.string = self.text
        UIMenuController.shared.setMenuVisible(false, animated: true)
    }
    
    override func canPerformAction(_ action: Selector, withSender sender: Any?) -> Bool {
        return action == #selector(UIResponderStandardEditActions.copy(_:))
    }
}
