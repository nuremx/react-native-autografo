import UIKit

class AutografoView: UIView {
   private let signatureViewController = SignatureDrawingViewController()
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    self.backgroundColor = UIColor.white
    self.addSubview(signatureViewController.view)
    signatureViewController.view.clipsToBounds = true

    self.addConstraints([
      NSLayoutConstraint.init(item: signatureViewController.view, attribute: .leading, relatedBy: .equal, toItem: self, attribute: .leading, multiplier: 1, constant: 0),
      NSLayoutConstraint.init(item: signatureViewController.view, attribute: .trailing, relatedBy: .equal, toItem: self, attribute: .trailing, multiplier: 1, constant: 0),
      NSLayoutConstraint.init(item: signatureViewController.view, attribute: .top, relatedBy: .equal, toItem: self, attribute: .top, multiplier: 1, constant: 0),
      NSLayoutConstraint.init(item: signatureViewController.view, attribute: .bottom, relatedBy: .equal, toItem: self, attribute: .bottom, multiplier: 1, constant: 0),
      ])
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  func reset() {
    self.signatureViewController.reset()
  }

  
  @objc var onSave: RCTDirectEventBlock?
  @objc var strokeColor: NSString? {
    didSet {
      signatureViewController.signatureColor = UIColor(hex: ((strokeColor ?? "") as String)  ) ?? UIColor.black
    }
  }
  @objc var strokeWidth: NSNumber? {
    didSet {
        // TODO: set stroke width
    }
  }

  
  func sendBase64String() {
    let pngData = self.signatureViewController.fullSignatureImage?.pngData()
    let string = pngData?.base64EncodedString(options: .lineLength64Characters) ?? ""
    
    onSave!(["base64": string as NSString])
  }
  
  func saveImageAsFile() {
    let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
    guard let signatureImage = signatureViewController.fullSignatureImage else {
      onSave!(["error": "No signature image"])
      return
    }
    
    if let filePath = paths.first?.appendingPathComponent("signature.png") {
      // Save image.
      do {
        try signatureImage.pngData()?.write(to: filePath, options: .atomic)
        
        onSave!(["url": filePath.absoluteString as NSString])
      } catch {
        onSave!(["error": "Error while writing png data to url path"])
      }
    } else {
      onSave!(["error": "Error while obtaining document directory"])
    }
  }
  
}



