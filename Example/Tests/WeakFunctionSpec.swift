//
//  WeakFunctionSpec.swift
//  TargetBoxTests
//
//  Created by Bogdan Kikacheishvili on 1/20/20.
//  Copyright © 2020 IDAP. All rights reserved.
//

import Quick
import Nimble

import TargetBox

class WeakFunctionSpec: QuickSpec {
    
    override func spec() {
        
        describe("the 'WeakFunctionSpec'") {
            
            context("if configured") {
                it("should not capture object") {
                    var object: Object? = Object()
                    let function = WeakFunction(signature: Object.execute, object: object!)
                    
                    object = nil
                    expect(function.isEmpty).to(beTrue())
                }
            }
        }
    }
}

class Object {
    
    func execute() {
        print("cats is qute")
    }
}
