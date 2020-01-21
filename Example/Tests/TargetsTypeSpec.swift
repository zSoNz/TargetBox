//
//  TargetsTypeSpec.swift
//  TargetBoxTests
//
//  Created by Bogdan Kikacheishvili on 1/20/20.
//  Copyright © 2020 IDAP. All rights reserved.
//

import Quick
import Nimble

import RxCocoa
import RxSwift

import TargetBox

class TargetsTypeSpec: QuickSpec {
    
    override func spec() {
        
        describe("the 'TargetsTypeSpec'") {
            
            context("if configured") {
                it("current target should equal xctest") {
                    expect(TestsTarget.current).to(equal("xctest"))
                }
                
                it("'targetBoxTests' case should equal xctest") {
                    expect(TestsTarget.targetBoxTests.rawValue).to(equal("xctest"))
                }
                
                it("'targetBox' case should equal TargetBox") {
                    expect(TestsTarget.targetBox.rawValue).to(equal("TargetBox"))
                }
            }
        }
        
        describe("the 'TargetBoxTarget'") {
                   
            context("if configured") {
                it("current target should equal TargetBox") {
                    expect(TargetBoxTarget.current).to(equal("TargetBox"))
                }
                
                it("'targetBoxTests' case should equal xctest") {
                    expect(TargetBoxTarget.targetBoxTests.rawValue).to(equal("xctest"))
                }
                
                it("'targetBox' case should equal TargetBox") {
                    expect(TargetBoxTarget.targetBox.rawValue).to(equal("TargetBox"))
                }
            }
        }
    }
}
