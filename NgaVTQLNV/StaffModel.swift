//
//  StaffModel.swift
//  NgaVTQLNV
//
//  Created by Admin on 10/4/20.
//  Copyright © 2020 NgaVu. All rights reserved.
//

import Foundation
import ObjectMapper

enum EmployeePosition: String {
    case Intern = "Intern"
    case Junior = "Junior"
    case Senior = "Senior"
}

final class EmployeeListBO: Mappable {
    var employees: [EmployeeBO]?
    func mapping(map: Map) {
        employees <- map["employees"]
    }
    
    init?(map: Map) {}
}

final class EmployeeBO: Mappable {
    var id: String?
    var createdAt: String?
    var name: String?
    var avatar: String?
    var address: String?
    var isMale: Bool?
    var status: Int?
    var dayWorking: Int?
    
    func mapping(map: Map) {
        id <- map["id"]
        createdAt <- map["createdAt"]
        name <- map["name"]
        avatar <- map["avatar"]
        address <- map["address"]
        isMale <- map["isMale"]
        status <- map["status"]
        dayWorking <- map["dayWorking"]
    }
    
    var position: EmployeePosition {
        get {
            if let dayWorking = dayWorking {
                switch dayWorking {
                case ..<60 :
                    return .Intern
                case 60..<200 :
                    return .Junior
                default:
                    return .Senior
                }
            }
            return .Intern
        }
    }
    
    init?(map: Map) {}
}
