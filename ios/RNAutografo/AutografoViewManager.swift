//
//  AutografoViewManager.swift
//  RNAutografo
//
//  Created by César Guadarrama on 1/31/19.
//  Copyright © 2019 Nure. All rights reserved.
//

@objc(AutografoViewManager)
class AutografoViewManager: RCTViewManager {
    override func view() -> UIView! {
        return AutografoView()
    }
    
    override
    static func requiresMainQueueSetup() -> Bool {
        return true
    }
    
    @objc
    func reset(_ node: NSNumber) {
        DispatchQueue.main.async {
            let component = self.bridge.uiManager.view(forReactTag: node) as! AutografoView
            component.reset()
        }
    }
    
    @objc
    func save(_ node: NSNumber, fileName: NSString) {
        if (!(fileName as String).isEmpty) {
            DispatchQueue.main.async {
                let component = self.bridge.uiManager.view(forReactTag: node) as! AutografoView
                component.saveImageAsFile()
            }
        } else {
            DispatchQueue.main.async {
                let component = self.bridge.uiManager.view(forReactTag: node) as! AutografoView
                component.sendBase64String()
            }
        }
    }
}
