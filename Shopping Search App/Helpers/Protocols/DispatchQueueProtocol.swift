//
//  DispatchQueueProtocol.swift
//  Shopping Search App
//
//  Created by Gabriel Pereira on 20/12/23.
//

import Foundation

protocol DispatchQueueProtocol {
    func async(group: DispatchGroup?,
               qos: DispatchQoS,
               flags: DispatchWorkItemFlags,
               execute work: @escaping @convention(block) () -> Void)
    
    func async(execute work: @escaping @convention(block) () -> Void)
    
    func sync<T>(execute work: () throws -> T) rethrows -> T
    
    func asyncAfter(deadline: DispatchTime,
                    qos: DispatchQoS,
                    flags: DispatchWorkItemFlags,
                    execute work: @escaping @convention(block) () -> Void)
    
    func asyncAfter(deadline: DispatchTime, execute work: @escaping @convention(block) () -> Void)
}

extension DispatchQueueProtocol {
    func async(execute work: @escaping @convention(block) () -> Void) {
        async(group: nil, qos: .unspecified, flags: [], execute: work)
    }
    
    func asyncAfter(deadline: DispatchTime, execute work: @escaping @convention(block) () -> Void) {
        asyncAfter(deadline: deadline, qos: .unspecified, flags: [], execute: work)
    }
}

extension DispatchQueue: DispatchQueueProtocol { }
