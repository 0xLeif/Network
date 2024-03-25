import Foundation

public protocol Endpoint: Hashable {
    static var url: URL { get }

    var method: HTTPRequestMethod { get }
    var path: String { get }
    var headers: [String: String] { get }
    var body: Data? { get }
}
