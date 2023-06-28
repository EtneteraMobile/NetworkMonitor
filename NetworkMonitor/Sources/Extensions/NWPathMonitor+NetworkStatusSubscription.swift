//
//  NWPathMonitor+NetworkStatusSubscription.swift
//  
//
//  Created by antonin.simek on 28.06.2023.
//

import Combine
import Foundation
import Network

extension NWPathMonitor {
    class NetworkStatusSubscription<S: Subscriber>: Subscription where S.Input == NWPath.Status {
        private let subscriber: S?

        private let monitor: NWPathMonitor
        private let queue: DispatchQueue

        init(
            subscriber: S,
            monitor: NWPathMonitor,
            queue: DispatchQueue
        ) {
            self.subscriber = subscriber
            self.monitor = monitor
            self.queue = queue
        }

        func request(_ demand: Subscribers.Demand) {
            monitor.pathUpdateHandler = { [weak self] path in
                guard let self else { return }
                _ = self.subscriber?.receive(path.status)
            }

            monitor.start(queue: queue)
        }

        func cancel() {
            monitor.cancel()
        }
    }
}
