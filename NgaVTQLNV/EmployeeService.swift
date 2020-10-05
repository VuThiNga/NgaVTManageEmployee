//
//  EmployeeService.swift
//  NgaVTQLNV
//
//  Created by Admin on 10/5/20.
//  Copyright © 2020 NgaVu. All rights reserved.
//

import Foundation
import Moya

enum EmployeeService {
    case employees(params: [String: Any])
}

extension EmployeeService: TargetType {
    var baseURL: URL {
        return URL(string: URLs.baseUrl)!
    }
    
    var path: String {
        switch self {
        case .employees:
            return "/vantrung8794/ttcTrainingRepo/db"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .employees:
            return .get
        }
    }
    
    var sampleData: Data {
        return Data()
    }
    
    var task: Task {
        switch self {
        case let .employees(params):
            return .requestParameters(parameters: params, encoding: URLEncoding.queryString)
        }
    }
    
    var headers: [String : String]? {
        let header = ["Content-type": "application/json"]
        return header
    }
    
    
}
