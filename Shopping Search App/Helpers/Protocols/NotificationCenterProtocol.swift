//
//  NotificationCenterProtocol.swift
//  Shopping Search App
//
//  Created by Gabriel Pereira on 19/12/23.
//

import Foundation

protocol NotificationCenterProtocol {
    func addObserver(forName name: NSNotification.Name?,
                     object obj: Any?,
                     queue: OperationQueue?,
                     using block: @escaping (Notification) -> Void) -> NSObjectProtocol
    func removeObserver(_ observer: Any)
}

extension NotificationCenter: NotificationCenterProtocol {}
