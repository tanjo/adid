# adid

## IDFA
### iOS14.2 (Xcode Version 12.2 (12B45b))
- `isAdvertisingTrackingEnabled` is changed by tracking setting.
- `advertisingIdentifier` is returned `00000000-0000-0000-0000-000000000000` if tracking is turned off.
- If it has been uninstalled, `ATTrackingManager.requestTrackingAuthorization` doesn't called, the past status will be reflected.
- Completion handler of `ATTrackingManager.requestTrackingAuthorization` isn't **Main** thread. So, you need use `DispatchQueue.main.async` if you change UI.
### iOS14.0-iOS14.1
- `isAdvertisingTrackingEnabled` always returns false.

## References

- [AdSupport \| Apple Developer Documentation](https://developer.apple.com/documentation/adsupport)
- [App Store Connect \- Support \- Apple Developer](https://developer.apple.com/support/app-store-connect/)
- [ASIdentifierManager \- AdSupport \| Apple Developer Documentation](https://developer.apple.com/documentation/adsupport/asidentifiermanager)
