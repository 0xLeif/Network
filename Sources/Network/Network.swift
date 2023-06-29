import Foundation

/// A class that implements the `Networking` protocol to perform network requests using URLSession.
open class Network: Networking {
    public init() { }

    open func `get`(
        url: URL,
        headerFields: [String: String] = [
            "Content-Type": "application/json; charset=utf-8",
            "Accept": "application/json"
        ]
    ) async throws -> DataResponse {
        DataResponse(
            try await URLSession.shared.data(
                for: request(
                    for: url,
                    method: .GET,
                    headerFields: headerFields
                )
            )
        )
    }

    open func head(
        url: URL,
        headerFields: [String: String] = [
            "Content-Type": "application/json; charset=utf-8",
            "Accept": "application/json"
        ]
    ) async throws -> DataResponse {
        DataResponse(
            try await URLSession.shared.data(
                for: request(
                    for: url,
                    method: .HEAD,
                    headerFields: headerFields
                )
            )
        )
    }

    open func connect(
        url: URL,
        headerFields: [String: String] = [
            "Content-Type": "application/json; charset=utf-8",
            "Accept": "application/json"
        ]
    ) async throws -> DataResponse {
        DataResponse(
            try await URLSession.shared.data(
                for: request(
                    for: url,
                    method: .CONNECT,
                    headerFields: headerFields
                )
            )
        )
    }

    open func options(
        url: URL,
        headerFields: [String: String] = [
            "Content-Type": "application/json; charset=utf-8",
            "Accept": "application/json"
        ]
    ) async throws -> DataResponse {
        DataResponse(
            try await URLSession.shared.data(
                for: request(
                    for: url,
                    method: .OPTIONS,
                    headerFields: headerFields
                )
            )
        )
    }

    open func trace(
        url: URL,
        headerFields: [String: String] = [
            "Content-Type": "application/json; charset=utf-8",
            "Accept": "application/json"
        ]
    ) async throws -> DataResponse {
        DataResponse(
            try await URLSession.shared.data(
                for: request(
                    for: url,
                    method: .TRACE,
                    headerFields: headerFields
                )
            )
        )
    }

    open func post(
        url: URL,
        body: Data?,
        headerFields: [String: String] = [
            "Content-Type": "application/json; charset=utf-8",
            "Accept": "application/json"
        ]
    ) async throws -> DataResponse {
        var request = request(
            for: url,
            method: .POST,
            headerFields: headerFields
        )

        request.httpBody = body

        return DataResponse(
            try await URLSession.shared.data(
                for: request
            )
        )
    }

    open func put(
        url: URL,
        body: Data?,
        headerFields: [String: String] = [
            "Content-Type": "application/json; charset=utf-8",
            "Accept": "application/json"
        ]
    ) async throws -> DataResponse {
        var request = request(
            for: url,
            method: .PUT,
            headerFields: headerFields
        )

        request.httpBody = body

        return DataResponse(
            try await URLSession.shared.data(
                for: request
            )
        )
    }

    open func patch(
        url: URL,
        body: Data?,
        headerFields: [String: String] = [
            "Content-Type": "application/json; charset=utf-8",
            "Accept": "application/json"
        ]
    ) async throws -> DataResponse {
        var request = request(
            for: url,
            method: .PATCH,
            headerFields: headerFields
        )

        request.httpBody = body

        return DataResponse(
            try await URLSession.shared.data(
                for: request
            )
        )
    }

    open func delete(
        url: URL,
        body: Data?,
        headerFields: [String: String] = [
            "Content-Type": "application/json; charset=utf-8",
            "Accept": "application/json"
        ]
    ) async throws -> DataResponse {
        var request = request(
            for: url,
            method: .DELETE,
            headerFields: headerFields
        )

        request.httpBody = body

        return DataResponse(
            try await URLSession.shared.data(
                for: request
            )
        )
    }

    open func request(
        for url: URL,
        method : HTTPRequestMethod,
        headerFields: [String: String]
    ) -> URLRequest {
        var request = URLRequest(url: url)

        request.httpMethod = method.rawValue
        request.allHTTPHeaderFields = headerFields

        return request
    }
}
