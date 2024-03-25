import Foundation

/// A class that implements the `Networking` protocol to provide mock network responses.
open class MockNetwork: Network {
    private let responseData: Data?
    private let response: URLResponse?

    public init(
        responseData: Data?,
        response: URLResponse?
    ) {
        self.responseData = responseData
        self.response = response
    }

    public override func request(
        for url: URL,
        method: HTTPRequestMethod,
        headerFields: [String: String],
        body: Data?
    ) async throws -> DataResponse {
        DataResponse(
            data: responseData,
            response: response
        )
    }
}
