//
//  NetworkMonitor.swift
//  
//
//  Created by antonin.simek on 28.06.2023.
//

import Combine
import Foundation

public protocol NetworkMonitor {
    var isConnected: AnyPublisher<Bool, Never> { get }
}
