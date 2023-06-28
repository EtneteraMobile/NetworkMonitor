//
//  MainNetworkMonitor.swift
//  
//
//  Created by antonin.simek on 28.06.2023.
//

import Combine
import Network
import Foundation

public final class MainNetworkMonitor: NetworkMonitor {
    private let networkMonitor = NWPathMonitor()
    private let monitorQueue = DispatchQueue(label: "monitor")

    public init() {}

    public var isConnected: AnyPublisher<Bool, Never> {
        networkMonitor
            .publisher(queue: monitorQueue)
            .map { $0 == .satisfied }
            .eraseToAnyPublisher()
    }
}
