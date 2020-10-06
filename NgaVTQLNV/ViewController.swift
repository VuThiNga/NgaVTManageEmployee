//
//  ViewController.swift
//  NgaVTQLNV
//
//  Created by Admin on 10/4/20.
//  Copyright © 2020 NgaVu. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, EditEmployeeDelegate {
    

    @IBOutlet weak var tbvStaff: UITableView!
    
    let vm = EmployeeVM()
    var lstEmployee = [EmployeeBO]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        registerTbv()
        vm.getEmployees(vc: self)
    }
    
    func registerTbv(){
        tbvStaff.estimatedRowHeight = 333
        tbvStaff.rowHeight = UITableView.automaticDimension
        tbvStaff.register(UINib(nibName: "StaffInfoCell", bundle: nil), forCellReuseIdentifier: "StaffInfoCell")
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return lstEmployee.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "StaffInfoCell") as! StaffInfoCell
        if lstEmployee.count > indexPath.row {
            let data = lstEmployee[indexPath.row]
            cell.configCell(data)
            cell.deleteEmployee = {
                let alert = UIAlertController(title: "Xác nhận", message: "Bạn có chắc chắn muốn xóa nhân viên \(data.name ?? "") không?", preferredStyle: UIAlertController.Style.alert)
                alert.addAction(UIAlertAction(title: "Đồng ý", style: UIAlertAction.Style.default, handler:{ (_) in
                    self.lstEmployee.remove(at: indexPath.row)
                    DispatchQueue.main.async{
                        self.tbvStaff.reloadData()
                    }
                }))
                self.present(alert, animated: true, completion: nil)
            }
            
            cell.openEditVC = {
                self.performSegue(withIdentifier: "showStaffInfoDetail", sender: data)
            }
            return cell
        }
        return UITableViewCell()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let nextVC = segue.destination as? StaffInfoDetailVC, let data = sender as? EmployeeBO {
            nextVC.employee = data
            nextVC.delegate = self
        }
    }
    
    func completeEditEmployee() {
        DispatchQueue.main.async{
            self.tbvStaff.reloadData()
        }
    }
}

