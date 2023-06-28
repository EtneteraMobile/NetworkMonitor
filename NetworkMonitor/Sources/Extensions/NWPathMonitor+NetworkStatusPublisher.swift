//
//  NWPathMonitor+NetworkStatusPublisher.swift
//  
//
//  Created by antonin.simek on 28.06.2023.
//

import Combine
import Foundation
import Network

extension NWPathMonitor {
    struct NetworkStatusPublisher: Publisher {
        typealias Output = NWPath.Status
        typealias Failure = Never

        private let monitor: NWPathMonitor
        private let queue: DispatchQueue

        init(monitor: NWPathMonitor, queue: DispatchQueue) {
            self.monitor = monitor
            self.queue = queue
        }

        func receive<S>(subscriber: S) where S: Subscriber, Never == S.Failure, NWPath.Status == S.Input {
            let subscription = NetworkStatusSubscription(
                subscriber: subscriber,
                monitor: monitor,
                queue: queue
            )

            subscriber.receive(subscription: subscription)
        }
    }

    func publisher(queue: DispatchQueue) -> NWPathMonitor.NetworkStatusPublisher {
        NetworkStatusPublisher(
            monitor: self,
            queue: queue
        )
    }
}
