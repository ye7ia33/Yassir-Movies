//  NetworkManager.swift
//  Created by Yahia El-Dow.

import Foundation
import Alamofire

class NetworkManager {

    typealias APIResponse = (result: Result<Decodable? ,Error>, statusCode: Int?)

    static let shared = NetworkManager()
    private init() { }
    
    func request<T: Decodable> (request: AFNRequest, type: T.Type, didRecivedResponse: @escaping(APIResponse)->()) {
        guard let url = request.uRL else { return }
        AF.request(url, parameters: request.parameters, headers: request.headers).validate()
          .responseDecodable(of: type) { response in
            let statusCode = HttpStatusCode(rawValue: response.response?.statusCode ?? -1)
              if statusCode?.isSuccessStatusCode ?? false {
                  didRecivedResponse((.success(response.value), statusCode: statusCode?.rawValue))
              } else {
                  didRecivedResponse((.failure(response.error ?? CreateCustomError.getDefault()), statusCode?.rawValue))
              }
        }
    }
}

struct AFNRequest {
    private(set) var uRL: String?
    private(set) var headers: HTTPHeaders = ["Content-Type": "application/json", "Accept" : "application/json"]
    private(set) var parameters: Parameters?
    private(set) var httpMethod: HTTPMethod = .get
    
    init(url: String, headers: [String: String]? =  nil, httpMethod: HTTPMethod = .get, paramters: [String: Any]? = nil) {
        self.uRL = url
        headers?.forEach({ (key, value) in
            self.headers.add(name: key, value: value)
        })
        self.parameters = paramters
        self.httpMethod = httpMethod
    }
    
    mutating func addHeader(key: String, value: String) {
        self.headers.add(name: key, value: value)
    }
}

struct CreateCustomError {
    var error: NSError?
    
    init(domain: String, code: Int, userInfo: [String : Any]? = nil) {
        self.error = NSError(domain: domain, code: code, userInfo: userInfo)
    }
    
    static func getDefault() -> NSError {
        return NSError(domain: "Invalid Error", code: -1, userInfo: nil)
    }
}
