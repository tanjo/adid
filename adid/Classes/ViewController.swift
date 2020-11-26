//
//  ViewController.swift
//  adid
//

import UIKit
import AdSupport

class ViewController: UIViewController {

  @IBOutlet weak var isAdvertisingTrackingEnabledResultLabel: CopiableLabel!
  @IBOutlet weak var advertisingIdentifierResultLabel: CopiableLabel!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view.
    isAdvertisingTrackingEnabledResultLabel.text =
      "\(ASIdentifierManager.shared().isAdvertisingTrackingEnabled)"
    advertisingIdentifierResultLabel.text =
      ASIdentifierManager.shared().advertisingIdentifier.uuidString
  }
}

