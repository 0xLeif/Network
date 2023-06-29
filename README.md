# Network

`Network` is a lightweight networking library for Swift that makes it easy to interact with RESTful APIs. With `Network`, you can effortlessly make HTTP requests, handle responses, and process data in a concise and efficient way.

## Features

- **Simple and Intuitive API**: Make various HTTP requests (GET, POST, PUT, DELETE, etc.) with ease.
- **Flexible Request Handling**: Comprehensive support for request headers, URL encoding, and request bodies.
- **Asynchronous Requests**: Utilize Swift's `async/await` syntax for asynchronous network requests.
- **Customizable URLSession**: Customize and configure URLSession with default or custom configurations.
- **Mocking Support**: Easily mock network requests for simplified testing and development.

## Installation

To integrate `Network` into your project, you can use the Swift Package Manager. Simply add the following dependency to your `Package.swift` file:

```swift
dependencies: [
    .package(url: "https://github.com/0xLeif/Network.git", from: "1.0.0")
]
```

## Usage

### Performing a GET Request

```swift
import Network

let network = Network()

do {
    let dataResponse = try await network.get(url: URL(string: "https://api.example.com/posts")!)

    if let data = dataResponse.data {
        let json = try JSONSerialization.jsonObject(with: data, options: [])
        print(json)
    } else {
        print("No response data")
    }
} catch {
    print("Error: \(error)")
}
```

### Sending a POST Request

```swift
import Network

let network = Network()

do {
    let headers = ["Authorization": "Bearer your-token"]
    let body: [String: Any] = [
        "name": "John Doe",
        "email": "johndoe@example.com"
    ]

    let dataResponse = try await network.post(
        url: URL(string: "https://api.example.com/users")!,
        headerFields: headers,
        body: body
    )

    if let data = dataResponse.data {
        let json = try JSONSerialization.jsonObject(with: data, options: [])
        print(json)
    }
} catch {
    print("Error: \(error)")
}

```

## Contributing

Contributions to `Network` are welcome! If you have ideas for improvements, find a bug, or want to contribute code, please submit a pull request. For major changes, please open an issue first to discuss potential updates.

## License

`Network` is available under the MIT license. See the [LICENSE](https://github.com/0xLeif/Network/blob/main/LICENSE) file for more information.
