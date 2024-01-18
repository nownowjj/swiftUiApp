//
//  CustomHttpClient.swift
//  E4Pay
//
//  Created by 20-N311 on 1/16/24.
//

import Foundation
import Alamofire
import OSLog

class CustomHttpClient<T: Decodable>: ObservableObject {
    
    //    typealias onSuccess = (T,[String]?) -> ()
    typealias onSuccess = (T) -> ()
    typealias onFailure = () -> ()
    
    let headers: HTTPHeaders = [
        .accept("application/json"),
        .contentType("application/json")
    ]
    
    func alamofireNetworking(url: String, method:HTTPMethod,  parameters: Parameters? = nil, onSuccess: @escaping onSuccess, onFailure: @escaping onFailure) {
        guard let sessionUrl = URL(string: url) else {
            Log.debug("alamofireNetworking : {}" , url)
            return
        }
        AF.request(sessionUrl,
                   method: method,
                   parameters: parameters,
                   encoding: JSONEncoding.default,
                   headers: headers)
        .validate()
        .responseDecodable(of: T.self){ response in
            Log.debug("alamofireNetworking response : {}" , response.description)
            switch response.result {
            case .success(let value):
                onSuccess(value)
            case .failure(let error):
                let errorString = "\(error)"
                Log.error("alamofireNetworking error : {}" , error)
//                do {
//                    let errorResponse = try JSONDecoder().decode(ErrorResponse.self, from: response.data ?? Data())
//                    onFailure(errorResponse)
//                } catch {
//                    Log.error("Failed to decode error response: \(error)")
//                    onFailure(ErrorResponse(code: "unknown", message: "Unknown error", timestamp: "", errors: nil))
//                }
            }
        }
    }
    
    func alamofireNetworkingToString(url: String, method:HTTPMethod,  parameters: Parameters? = nil, onSuccess: @escaping onSuccess, onFailure: @escaping onFailure) {
        guard let sessionUrl = URL(string: url) else {
            Log.debug("alamofireNetworkingToString url : {}" , url)
            return
        }
        
        AF.request(sessionUrl,
                   method: method,
                   parameters: parameters,
                   encoding: JSONEncoding.default,
                   headers: headers)
        .validate()
        .responseString(encoding:.utf8){ response in
            Log.debug("alamofireNetworkingToString response : {}" , response)
            
            switch response.result {
            case .success(let value):
                onSuccess(value as! T)
            case .failure(let error):
                let errorString = "\(error)"
                Log.error("alamofireNetworkingToString error : {}" , errorString)
            }
        }
    }
}

// MARK: - not nuse
struct ErrorResponse: Codable {
    let code, message, timestamp: String
    let errors: String?
}
