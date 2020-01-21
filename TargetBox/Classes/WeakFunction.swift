//
//  WeakFunction.swift
//  TargetBox
//
//  Created by Bogdan Kikacheishvili on 10/14/19.
//  Copyright © 2019 IDAP. All rights reserved.
//

import Foundation

public struct WeakFunction<Object: AnyObject> {
    
    // MARK: -
    // MARK: Variables
    
    private let wrappedFunction: (Object) -> () -> ()
    
    private(set) weak var wrapped: Object?
    
    public var isEmpty: Bool {
        return self.wrapped == nil
    }
    
    // MARK: -
    // MARK: Initializations
    
    /**
     This will create weak reference on function in your controller.
     
     let functionTargetBox = WeakFunction(
        signature: ExampleViewController.prepareTargetBox,
        object: self
     )
     */
    public init(signature: @escaping (Object) -> () -> (), object: Object) {
        self.wrappedFunction = signature
        self.wrapped = object
    }
    
    // MARK: -
    // MARK: Public
    
    public func execute() {
        self.wrapped.do {
            self.wrappedFunction($0)()
        }
    }
}

extension Optional {
    
    func `do`(_ action: (Wrapped) -> ()) {
        self.map(action)
    }
}
