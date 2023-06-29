import XCTest
@testable import Network

final class MockNetworkTests: XCTestCase {
    class StringMockNetwork: MockNetwork {
        func data(for method: HTTPRequestMethod) -> DataResponse {
            DataResponse(data: "Hello, \(method.rawValue)".data(using: .utf8), response: URLResponse())
        }

        override func get(
            url: URL,
            headerFields: [String: String] = [:]
        ) async throws -> DataResponse {
            data(for: .GET)
        }

        override func head(
            url: URL,
            headerFields: [String: String] = [:]
        ) async throws -> DataResponse {
            data(for: .HEAD)
        }

        override func connect(
            url: URL,
            headerFields: [String: String] = [:]
        ) async throws -> DataResponse {
            data(for: .CONNECT)
        }

        override func options(
            url: URL,
            headerFields: [String: String] = [:]
        ) async throws -> DataResponse {
            data(for: .OPTIONS)
        }

        override func trace(
            url: URL,
            headerFields: [String: String] = [:]
        ) async throws -> DataResponse {
            data(for: .TRACE)
        }

        override func post(
            url: URL,
            body: Data?,
            headerFields: [String: String] = [:]
        ) async throws -> DataResponse {
            data(for: .POST)
        }

        override func put(
            url: URL,
            body: Data?,
            headerFields: [String: String] = [:]
        ) async throws -> DataResponse {
            data(for: .PUT)
        }

        override func patch(
            url: URL,
            body: Data?,
            headerFields: [String: String] = [:]
        ) async throws -> DataResponse {
            data(for: .PATCH)
        }

        override func delete(
            url: URL,
            body: Data?,
            headerFields: [String: String] = [:]
        ) async throws -> DataResponse {
            data(for: .DELETE)
        }

    }

    let network: StringMockNetwork = StringMockNetwork()

    var url: URL {
        get throws {
            try XCTUnwrap(URL(string: Self.self.description()))
        }
    }

    func testGet() async throws {
        let expectedString = "Hello, GET"

        let dataResponse = try await network.get(url: url)
        let data = try XCTUnwrap(dataResponse.data)
        let string = String(data: data, encoding: .utf8)

        XCTAssertEqual(string, expectedString)
    }

    func testHead() async throws {
        let expectedString = "Hello, HEAD"

        let dataResponse = try await network.head(url: url)
        let data = try XCTUnwrap(dataResponse.data)
        let string = String(data: data, encoding: .utf8)

        XCTAssertEqual(string, expectedString)
    }

    func testPost() async throws {
        let expectedString = "Hello, POST"

        let dataResponse = try await network.post(url: url, body: nil)
        let data = try XCTUnwrap(dataResponse.data)
        let string = String(data: data, encoding: .utf8)

        XCTAssertEqual(string, expectedString)
    }

    func testPut() async throws {
        let expectedString = "Hello, PUT"

        let dataResponse = try await network.put(url: url, body: nil)
        let data = try XCTUnwrap(dataResponse.data)
        let string = String(data: data, encoding: .utf8)

        XCTAssertEqual(string, expectedString)
    }

    func testDelete() async throws {
        let expectedString = "Hello, DELETE"

        let dataResponse = try await network.delete(url: url, body: nil)
        let data = try XCTUnwrap(dataResponse.data)
        let string = String(data: data, encoding: .utf8)

        XCTAssertEqual(string, expectedString)
    }

    func testConnect() async throws {
        let expectedString = "Hello, CONNECT"

        let dataResponse = try await network.connect(url: url)
        let data = try XCTUnwrap(dataResponse.data)
        let string = String(data: data, encoding: .utf8)

        XCTAssertEqual(string, expectedString)
    }

    func testOptions() async throws {
        let expectedString = "Hello, OPTIONS"

        let dataResponse = try await network.options(url: url)
        let data = try XCTUnwrap(dataResponse.data)
        let string = String(data: data, encoding: .utf8)

        XCTAssertEqual(string, expectedString)
    }

    func testTrace() async throws {
        let expectedString = "Hello, TRACE"

        let dataResponse = try await network.trace(url: url)
        let data = try XCTUnwrap(dataResponse.data)
        let string = String(data: data, encoding: .utf8)

        XCTAssertEqual(string, expectedString)
    }

    func testPatch() async throws {
        let expectedString = "Hello, PATCH"

        let dataResponse = try await network.patch(url: url, body: nil)
        let data = try XCTUnwrap(dataResponse.data)
        let string = String(data: data, encoding: .utf8)

        XCTAssertEqual(string, expectedString)
    }
}
