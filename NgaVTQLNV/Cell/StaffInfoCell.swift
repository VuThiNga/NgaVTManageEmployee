//
//  StaffInfoCell.swift
//  NgaVTQLNV
//
//  Created by Admin on 10/4/20.
//  Copyright © 2020 NgaVu. All rights reserved.
//

import UIKit

class StaffInfoCell: UITableViewCell {

    @IBOutlet weak var lbName: UILabel!
    @IBOutlet weak var lbAddress: UILabel!
    @IBOutlet weak var lbGender: UILabel!
    @IBOutlet weak var lbPosition: UILabel!
    
    var deleteEmployee: (() -> ())?
    var openEditVC: (() -> ())?
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configCell(_ employee: EmployeeBO){
        lbName.text = employee.name ?? " "
        lbAddress.text = employee.address ?? " "
        if let isMale = employee.isMale, isMale {
            lbGender.text = "Nam"
        }else {
            lbGender.text = "Nữ"
        }
        
        lbPosition.text = employee.position.rawValue
    }
    
    @IBAction func deleteAct(_ sender: Any) {
        if let action = deleteEmployee {
            action()
        }
    }
    
    @IBAction func openEditScreenAct(_ sender: Any) {
        if let action = openEditVC {
            action()
        }
    }
}
