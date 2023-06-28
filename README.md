# NetworkMonitor

NetworkMonitor is a Swift package that provides a simple way to check for network availability.

## Installation

To use NetworkMonitor in your project, add the following line to your `Package.swift` file:

```
.package(url: "https://github.com/EtneteraMobile/NetworkMonitor", .upToNextMajor(from: "1.0.0"))
```

Then, include "NetworkMonitor" as a dependency for your target:

```
.target(
    name: "YourTarget",
    dependencies: [
        .product(name: "NetworkMonitor", package: "NetworkMonitor")
    ]
)
```

## Usage

First register the `MainNetworkMonitor` into your container:

```
container.register(NetworkMonitor.self) { _ in
    MainNetworkMonitor()
}
```

Then to use `NetworkMonitor` resolve the current instance by using:

```
container.resolve(NetworkMonitor.self)
```

You can then check for connectivity using the `isConnected` publisher:

```
networkMonitor
    .isConnected
    .receive(on: DispatchQueue.main)
    .sink { isConnected in
        [Your code]
    }
    .store(in: &cancellables)
```

## License

NetworkMonitor is available under the MIT license.
