//
//  TargetBoxTarget.swift
//  TargetBoxTests
//
//  Created by Bogdan Kikacheishvili on 1/20/20.
//  Copyright © 2020 IDAP. All rights reserved.
//

import TargetBox

enum TargetBoxTarget: String, TargetsType {
    
    static var current: String {
        return "TargetBox"
    }
    
    case targetBoxTests = "xctest"
    case targetBox = "TargetBox"
}
