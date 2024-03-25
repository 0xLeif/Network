open class MockAPI<APIEndpoint: Endpoint>: API<APIEndpoint> {
    open override func request(_ endpoint: APIEndpoint) async throws -> DataResponse {
        try await MockNetwork(
            responseData: endpoint.body,
            response: nil
        )
        .request(
            for: APIEndpoint.url.appending(path: endpoint.path),
            method: endpoint.method,
            headerFields: endpoint.headers,
            body: endpoint.body
        )
    }
}
