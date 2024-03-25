import Foundation

open class API<APIEndpoint: Endpoint> {
    var network: Networking

    public init() {
        network = Network()
    }

    open func request(_ endpoint: APIEndpoint) async throws -> DataResponse {
        try await network.request(
            for: APIEndpoint.url.appending(path: endpoint.path),
            method: endpoint.method,
            headerFields: endpoint.headers,
            body: endpoint.body
        )
    }
}
