//
//  CopiableLabel.swift
//  adid
//

import UIKit

class CopiableLabel: UILabel {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

  var isLongPress: Bool = false

  // MARK: - Override methods
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    setup()
  }
  
  required init?(coder: NSCoder) {
    super.init(coder: coder)
    setup()
  }
  
  override var canBecomeFirstResponder: Bool {
    return true
  }
  
  override func copy(_ sender: Any?) {
    UIPasteboard.general.string = self.text
    UIMenuController.shared.hideMenu(from: self)
  }
  
  override func canPerformAction(_ action: Selector, withSender sender: Any?) -> Bool {
    return action == #selector(UIResponderStandardEditActions.copy(_:))
  }
  
  // MARK: - Private methods
  
  func setup() {
    self.isUserInteractionEnabled = true
    self.addGestureRecognizer(
      UILongPressGestureRecognizer(target: self,
                                   action: #selector(showContextMenu(_:))))
    
    NotificationCenter.default.addObserver(self,
                                           selector: #selector(applyBackgroundColorWhite(_:)),
                                           name: UIMenuController.didHideMenuNotification,
                                           object: nil)
    NotificationCenter.default.addObserver(self,
                                           selector: #selector(applyBackgroundColorBlue(_:)),
                                           name: UIMenuController.didShowMenuNotification,
                                           object: nil)
  }
  
  // show context menu for copy text.
  @objc func showContextMenu(_ sender: Any?) {
    self.becomeFirstResponder()
    if !UIMenuController.shared.isMenuVisible {
      UIMenuController.shared.showMenu(from: self, rect: self.bounds)
      isLongPress = true
    }
  }
  
  @objc func applyBackgroundColorWhite(_ sender: Any?) {
    self.backgroundColor = UIColor.clear
    isLongPress = false
  }
  
  @objc func applyBackgroundColorBlue(_ sender: Any?) {
    if isLongPress {
      self.backgroundColor = UIColor(red: 0.0, green: 125.0 / 255.0, blue: 1.0, alpha: 0.2)
    }
  }
}
