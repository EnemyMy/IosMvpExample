//
//  UIDevice+GetOrientation.swift
//  MVPFirst
//
//  Created by Алексей on 16.12.2020.
//  Copyright © 2020 Alex. All rights reserved.
//

import UIKit

extension UIDevice {
    static var isLandcape: Bool {
        get {
            UIDevice.current.orientation.isLandscape
        }
    }
    static var isPortrait: Bool {
        get {
            UIDevice.current.orientation.isPortrait
        }
    }
}
