//
//  WebService.swift
//  FacebookInterview
//
//  Created by YangYusheng on 6/26/17.
//  Copyright © 2017 yusheng. All rights reserved.
//

import Foundation

enum HTTPMethod: String {
    case POST = "POST"
    case GET = "GET"
    case PUT = "PUT"
    case DELETE = "DELETE"
}

enum WebServiceResult {
    case success(Data, URLResponse?)
    case failure(Error, URLResponse?)
}

class WebService {
    ///simple webService
    static func sendRequest(_ url: String, method: HTTPMethod, parameters: [String: Any], completionHandler: @escaping (WebServiceResult) -> Void) {
        let url = URL(string: url)!
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let error = error {
                DispatchQueue.main.async {
                    completionHandler(.failure(error, response))
                }
            } else {
                if let data = data {
                    DispatchQueue.main.async {
                        completionHandler(.success(data, response))
                    }
                }
            }
        }
    }
}
