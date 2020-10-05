//
//  NetworkManager.swift
//  NgaVTQLNV
//
//  Created by Admin on 10/5/20.
//  Copyright © 2020 NgaVu. All rights reserved.
//

import Foundation
import Moya
import ObjectMapper

struct NetworkManager {
    
    static let provider = MoyaProvider<MultiTarget>(
    plugins: [NetworkLoggerPlugin(configuration: .init(logOptions: .verbose))])
    
    static func request<T: Mappable>(class: T.Type,
                                      target: MultiTarget,
                                      success successCallback: @escaping (T) -> Void = {_ in },
                                      error errorCallback: @escaping  (_ description: String) -> Void = {_ in },
                                      failure failureCallback: @escaping (MoyaError) -> Void = {_ in }
    ) {
        provider.request(target) { result in
            var msg = ""

            switch result {
            case let .success(response):
                do {
                    if let json = try JSONSerialization.jsonObject(with: response.data, options: []) as? [String: Any], let object = T(JSON: json) {
                        successCallback(object)
                    }else {
                        msg = "Lỗi không chuyển đổi được kiểu dữ liệu"
                        errorCallback(msg)
                    }
                } catch let error {
                    msg = error.localizedDescription
                    errorCallback(msg)
                }
            case let .failure(error):
                failureCallback(error)
            }
        }
    }
}
