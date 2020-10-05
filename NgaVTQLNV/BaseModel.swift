//
//  BaseModel.swift
//  NgaVTQLNV
//
//  Created by Admin on 10/5/20.
//  Copyright © 2020 NgaVu. All rights reserved.
//

import Foundation
import ObjectMapper

class BaseModel: Mappable {
    var error_code: Int?
    var message: String?

    required init?(map: Map) {}

    func mapping(map: Map) {
        error_code <- map["error_code"]
        message <- map["message"]
    }
}
