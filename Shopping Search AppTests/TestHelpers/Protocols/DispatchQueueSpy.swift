//
//  DispatchQueueSpy.swift
//  Shopping Search AppTests
//
//  Created by Gabriel Pereira on 20/12/23.
//

import Foundation
@testable import Shopping_Search_App

final class DispatchQueueSpy: DispatchQueueProtocol {
    func async(group: DispatchGroup?,
               qos: DispatchQoS,
               flags: DispatchWorkItemFlags,
               execute work: @escaping @convention(block) () -> Void) {
        work()
    }
    
    func sync<T>(execute work: () throws -> T) rethrows -> T {
        try work()
    }
    
    func asyncAfter(deadline: DispatchTime,
                    qos: DispatchQoS,
                    flags: DispatchWorkItemFlags,
                    execute work: @escaping @convention(block) () -> Void) {
        work()
    }
    
    func asyncAfter(deadline: DispatchTime, execute work: @escaping () -> Void) {
        work()
    }
}
