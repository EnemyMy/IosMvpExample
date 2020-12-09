//
//  OrientationHelper.swift
//  MVPFirst
//
//  Created by Алексей on 09.12.2020.
//  Copyright © 2020 Alex. All rights reserved.
//

import UIKit

enum OrientationHelper {
    static func isLandscape() -> Bool {
        UIDevice.current.orientation.isLandscape
    }
    
    static func isPortrait() -> Bool {
        UIDevice.current.orientation.isPortrait
    }
}
