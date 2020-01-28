//
//  TargetsBox.swift
//  TargetBox
//
//  Created by Bogdan Kikacheishvili on 10/14/19.
//  Copyright © 2019 IDAP. All rights reserved.
//

import UIKit

import RxSwift
import RxCocoa

func cast<Value, Result>(_ value: Value) -> Result? {
    return value as? Result
}

public protocol TargetsType: RawRepresentable where RawValue == String {

    static var current: String { get }
}

public extension TargetsType {
    
    static var current: String {
        return cast(Bundle.main.infoDictionary?["CFBundleName"]) ?? ""
    }
}

public class TargetingFunctionContainer<Object: AnyObject, Targets: TargetsType> {
    
    public let function: WeakFunction<Object>
    public let target: Targets
    public let trigger: Selector
    
    /**
     @param function Created early weak function.
     @param trigger Selector after which our weaked function will be called, function should be dynamic or marked as dynamic
     @param target The target, what be defined early, on which the function should be called
     */
    public init(function: WeakFunction<Object>, trigger: Selector, target: Targets) {
        self.function = function
        self.trigger = trigger
        self.target = target
    }
}

public class TargetsBox<Object: AnyObject & ReactiveCompatible, Targets: TargetsType> {
 
    public typealias ContainerType = TargetingFunctionContainer<Object, Targets>
    
    // MARK: -
    // MARK: Variables
    
    private let disposeBag = DisposeBag()
    
    private var containers: [ContainerType]
    
    // MARK: -
    // MARK: Initializations
    
    /// Adding array of containers on initialization
    public init(containers: [ContainerType]) {
        self.containers = containers
        
        self.process(containers: containers)
    }
    
    public convenience init(container: ContainerType) {
        self.init(containers: [container])
    }
    
    // MARK: -
    // MARK: Public
    
    /// Manually adding of new container to existing instance
    public func add(container: ContainerType) {
        self.containers.append(container)
        self.process(container: container)
    }
    
    public func add(containers: [ContainerType]) {
        containers.forEach(self.add)
    }
    
    // MARK: -
    // MARK: Private
    
    private func process(containers: [ContainerType]) {
        containers.forEach(self.process)
    }
    
    private func process(container: ContainerType) {
        container
            .function
            .wrapped?
            .rx
            .methodInvoked(container.trigger)
            .bind { [weak container] _ in
                if container?.target.rawValue == Targets.current {
                    container?.function.execute()
                }
            }
            .disposed(by: self.disposeBag)
    }
}
