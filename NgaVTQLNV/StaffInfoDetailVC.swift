//
//  StaffInfoDetailVC.swift
//  NgaVTQLNV
//
//  Created by Admin on 10/4/20.
//  Copyright © 2020 NgaVu. All rights reserved.
//

import UIKit

protocol EditEmployeeDelegate {
    func completeEditEmployee(lstEmployee: [EmployeeBO])
}

class StaffInfoDetailVC: UIViewController {

    @IBOutlet weak var lbStaffName: UITextField!
    @IBOutlet weak var lbStaffAddress: UITextField!
    @IBOutlet weak var switchGender: UISwitch!
    
    var lstEmployee = [EmployeeBO]()
    var position: Int = -1
    var delegate: EditEmployeeDelegate?
    var employee: EmployeeBO?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        initView()
    }
    
    func initView(){
        if lstEmployee.count > 0 && position >= 0 {
            employee = lstEmployee[position]
            lbStaffName.text = employee?.name ?? ""
            lbStaffAddress.text = employee?.address ?? ""
            if let isMale = employee?.isMale, isMale {
                switchGender.isOn = true
            }else{
                switchGender.isOn = false
            }
        }
    }
    
    @IBAction func editAct(_ sender: Any) {
        employee?.name = lbStaffName.text
        employee?.address = lbStaffAddress.text
        employee?.isMale = switchGender.isOn
        delegate?.completeEditEmployee(lstEmployee: lstEmployee)
        if self.navigationController?.topViewController == self {
            self.navigationController?.popViewController(animated: true)
        }else{
            self.dismiss(animated: true, completion: nil)
        }
    }
    
}
