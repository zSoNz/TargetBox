//
//  TargetsBoxSpec.swift
//  TargetBoxTests
//
//  Created by Bogdan Kikacheishvili on 1/20/20.
//  Copyright © 2020 IDAP. All rights reserved.
//

import Quick
import Nimble

import RxCocoa
import RxSwift

@testable import TargetBox

class TargetsBoxSpec: QuickSpec {
    
    override func spec() {
        
        describe("the 'TargetBox'") {
            
            context("if current target equal 'TestsTarget'") {
                
                it("on selecting 'targetBoxTests' target should execute") {
                    self.proccess(target: TestsTarget.targetBoxTests, expect: beTrue())
                }
                
                it("on selecting 'targetBox' target shouldn't execute") {
                    self.proccess(target: TestsTarget.targetBox, expect: beFalse())
                }
            }
            
            context("if current target equal 'TargetBoxText'") {

                it("on selecting 'targetBoxTests' target shouldn't execute") {
                    self.proccess(target: TargetBoxTarget.targetBoxTests, expect: beFalse())
                }
                
                it("on selecting 'targetBox' target should execute") {
                    self.proccess(target: TargetBoxTarget.targetBox, expect: beTrue())
                }
            }
        }
    }
    
    private func proccess<Target: TargetsType>(target: Target, expect bePredicate: Predicate<Bool>) {
        let emulation = TargetBoxEmulation(target: target)
        emulation.executeTrigger()
        
        expect(emulation.isExecuted).to(bePredicate)
    }
}

class TargetBoxEmulation<Target: TargetsType>: ReactiveCompatible {
    
    var box: TargetsBox<TargetBoxEmulation, Target>?
    
    private(set) var isExecuted = false
    
    init(target: Target) {
        let functionBox = WeakFunction(
            signature: TargetBoxEmulation.prepareTargetBox,
            object: self
        )
        
        let containerBox = TargetingFunctionContainer(
            function: functionBox,
            trigger: #selector(TargetBoxEmulation.executeTrigger),
            target: target
        )
        
        self.box = TargetsBox(container: containerBox)
    }
    
    @objc dynamic func executeTrigger() {
        
    }
    
    func prepareTargetBox() {
        self.isExecuted = true
    }
}
