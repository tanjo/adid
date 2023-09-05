//
//  ViewController.swift
//  adid
//

import UIKit
import AdSupport
import AppTrackingTransparency

class ViewController: UIViewController {

  @IBOutlet weak var isAdvertisingTrackingEnabledResultLabel: CopiableLabel!
  @IBOutlet weak var advertisingIdentifierResultLabel: CopiableLabel!
  @IBOutlet weak var systemVersionResultLabel: CopiableLabel!
  @IBOutlet weak var trackingAuthorizationStatusResultLabel: CopiableLabel!
  @IBOutlet weak var requestTrackingAuthorizationButton: UIButton!
  @IBOutlet weak var identifierForVendorLabel: CopiableLabel!
  @IBOutlet weak var bundleIdentifierLabel: CopiableLabel!

  override func viewDidLoad() {
    super.viewDidLoad()
    if #available(iOS 14, *) {
      self.requestTrackingAuthorizationButton.isEnabled = true
    } else {
      self.requestTrackingAuthorizationButton.isEnabled = false
    }
  }
  
  override func viewWillAppear(_ animated: Bool) {
    self.refresh()
  }
  
  // MARK: - Action methods
  
  @IBAction func didClickRequestTrackingAuthorization(_ sender: Any) {
    if #available(iOS 14, *) {
      ATTrackingManager.requestTrackingAuthorization(
        completionHandler: self.showTrackingAuthorizationStatusResultLabel(state:))
    }
  }
  
  @IBAction func openSettings(_ sender: Any) {
    guard let url = URL(string: UIApplication.openSettingsURLString) else {
      return
    }
    UIApplication.shared.open(url, options: [:], completionHandler: nil)
  }
  
  // MARK: - Private methods
  
  @available(iOS 14, *)
  func showTrackingAuthorizationStatusResultLabel(state: ATTrackingManager.AuthorizationStatus) -> Void {
    DispatchQueue.main.async {
      switch (state) {
        case .notDetermined:
          self.trackingAuthorizationStatusResultLabel.text = "notDetermined"
        case .restricted:
          self.trackingAuthorizationStatusResultLabel.text = "restricted"
        case .denied:
          self.trackingAuthorizationStatusResultLabel.text = "denied"
        case .authorized:
          self.trackingAuthorizationStatusResultLabel.text = "authorized"
          self.refresh()
        @unknown default:
          self.trackingAuthorizationStatusResultLabel.text = "unknown"
      }
    }
  }
  
  func refresh() {
    isAdvertisingTrackingEnabledResultLabel.text =
      "\(ASIdentifierManager.shared().isAdvertisingTrackingEnabled)"
    advertisingIdentifierResultLabel.text =
      ASIdentifierManager.shared().advertisingIdentifier.uuidString
    
    systemVersionResultLabel.text = "\(UIDevice.current.systemVersion)"
    
    if #available(iOS 14, *) {
      showTrackingAuthorizationStatusResultLabel(state: ATTrackingManager.trackingAuthorizationStatus)
    }

    identifierForVendorLabel.text = "\(UIDevice.current.identifierForVendor?.uuidString ?? "null")"
      
    bundleIdentifierLabel.text = "\(Bundle.main.bundleIdentifier ?? "null")"
  }
}

