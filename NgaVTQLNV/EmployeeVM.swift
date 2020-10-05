//
//  EmployeeVM.swift
//  NgaVTQLNV
//
//  Created by Admin on 10/5/20.
//  Copyright © 2020 NgaVu. All rights reserved.
//

import Foundation
import Moya

class EmployeeVM {
    func getEmployees(vc: ViewController){
        
        let input: [String: Any] = [:]
        let target = MultiTarget(EmployeeService.employees(params: input))
        NetworkManager.request(class: EmployeeListBO.self, target: target, success: { obj in
            if let lst = obj.employees, lst.count > 0 {
                vc.lstEmployee.append(contentsOf: lst)
                vc.tbvStaff.reloadData()
            }
        })
    }

}
