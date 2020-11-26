//
//  ViewController.swift
//  adid
//

import UIKit
import AdSupport

class ViewController: UIViewController {

  @IBOutlet weak var isAdvertisingTrackingEnabledResultLabel: UILabel!
  @IBOutlet weak var advertisingIdentifierResultLabel: UILabel!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view.
    isAdvertisingTrackingEnabledResultLabel.text =
      "\(ASIdentifierManager.shared().isAdvertisingTrackingEnabled)"
    advertisingIdentifierResultLabel.text =
      ASIdentifierManager.shared().advertisingIdentifier.uuidString
  }
}

