import Foundation

/// A class that implements the `Networking` protocol to provide mock network responses.
open class MockNetwork: Networking {
    public init() { }

    open func get(
        url: URL,
        headerFields: [String: String] = [:]
    ) async throws -> DataResponse {
        DataResponse(data: nil, response: URLResponse())
    }

    open func head(
        url: URL,
        headerFields: [String: String] = [:]
    ) async throws -> DataResponse {
        DataResponse(data: nil, response: URLResponse())
    }

    open func connect(
        url: URL,
        headerFields: [String: String] = [:]
    ) async throws -> DataResponse {
        DataResponse(data: nil, response: URLResponse())
    }

    open func options(
        url: URL,
        headerFields: [String: String] = [:]
    ) async throws -> DataResponse {
        DataResponse(data: nil, response: URLResponse())
    }

    open func trace(
        url: URL,
        headerFields: [String: String] = [:]
    ) async throws -> DataResponse {
        DataResponse(data: nil, response: URLResponse())
    }

    open func post(
        url: URL,
        body: Data?,
        headerFields: [String: String] = [:]
    ) async throws -> DataResponse {
        DataResponse(data: nil, response: URLResponse())
    }

    open func put(
        url: URL,
        body: Data?,
        headerFields: [String: String] = [:]
    ) async throws -> DataResponse {
        DataResponse(data: nil, response: URLResponse())
    }

    open func patch(
        url: URL,
        body: Data?,
        headerFields: [String: String] = [:]
    ) async throws -> DataResponse {
        DataResponse(data: nil, response: URLResponse())
    }

    open func delete(
        url: URL,
        body: Data?,
        headerFields: [String: String] = [:]
    ) async throws -> DataResponse {
        DataResponse(data: nil, response: URLResponse())
    }
}
