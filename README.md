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

### Defining an API

In order to define an API, you must first create an `Endpoint`. This is a protocol that outlines the basic components of a network request. These components include the URL, HTTP request method, path, headers, and body of the request.

Here's an example of an `Endpoint`:

```swift
enum ExampleEndpoint: Endpoint {
    static var url: URL { URL(string: "example.com")! }

    case hello

    var method: HTTPRequestMethod {
        switch self {
        case .hello:    return .GET
        }
    }

    var path: String {
        switch self {
        case .hello:    return "hello"
        }
    }

    var headers: [String: String] {
        switch self {
        case .hello:
            return [
                "id": "hello"
            ]
        }
    }

    var body: Data? {
        switch self {
        case .hello:    return "hello".data(using: .utf8)
        }
    }
}

```

Once the `Endpoint` is defined, you can create an instance of `API` or `MockAPI` (for testing) to send requests to the endpoint. Here's how you can use the `MockAPI` in a test:

```swift
func testAPI() async throws {
    let api = MockAPI<ExampleEndpoint>()
    let expectedString = "hello"

    let dataResponse = try await api.request(.hello)
    let data = try XCTUnwrap(dataResponse.data)
    let string = String(data: data, encoding: .utf8)

    XCTAssertEqual(string, expectedString)
}

```

The above test creates a `MockAPI`, sends a `GET` request to the `hello` endpoint, and checks if the response matches the expected string "hello".

## Contributing

Contributions to `Network` are welcome! If you have ideas for improvements, find a bug, or want to contribute code, please submit a pull request. For major changes, please open an issue first to discuss potential updates.

## License

`Network` is available under the MIT license. See the [LICENSE](https://github.com/0xLeif/Network/blob/main/LICENSE) file for more information.
