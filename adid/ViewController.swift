//
//  ViewController.swift
//  adid
//

import UIKit
import AdSupport

class ViewController: UIViewController {

    @IBOutlet weak var advertisingIdentifierValue: CopyLabel!
    @IBOutlet weak var isAdvertisingTrackingEnabledValue: CopyLabel!
    
    override func viewDidAppear(_ animated: Bool) {
        advertisingIdentifierValue.text =
            ASIdentifierManager.shared().advertisingIdentifier.uuidString
        isAdvertisingTrackingEnabledValue.text =
            ASIdentifierManager.shared().isAdvertisingTrackingEnabled ? "true" : "false"
    }
}
