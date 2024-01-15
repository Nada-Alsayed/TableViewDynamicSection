//
//  ExtensionViewController.swift
//  dynamicTableRows
//
//  Created by MAC on 10/01/2024.
//

import Foundation
import UIKit

extension ViewController : UITableViewDelegate,UITableViewDataSource{
    
    func setUpTableView(){
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: TableViewCell.id, bundle: nil), forCellReuseIdentifier: TableViewCell.id)
        tableView.register(UINib(nibName: "CustomViewHeader", bundle: nil), forHeaderFooterViewReuseIdentifier: "CustomViewHeader")
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sectionsNum[section]
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: TableViewCell.id, for: indexPath) as! TableViewCell
        cell.selectionStyle = .none
        cell.cellIndexPath = indexPath
        cell.cellIndex = indexPath.row
        cell.delegate = self
        if indexPath.row == 0{
            cell.setData(data: SectionData.adults, array: sectionsNum)
        }else if indexPath.row == 1{
            cell.setData(data: SectionData.childeren, array: sectionsNum)
        }else{
            cell.setData(data: SectionData.childerenAge,array: sectionsNum)
        }
        
        return cell
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
      //  print("numberOfSections :\(sectionsNum.count)")

        return sectionsNum.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = tableView.dequeueReusableHeaderFooterView(withIdentifier: "CustomViewHeader") as! CustomViewHeader
        headerView.delegate = self
        headerView.sectionNumber = section
        headerView.sectionLabel.text = "Room \(section+1)"
        return headerView
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 60
    }
}

extension ViewController : DelegateOnClick{
    func clickPlus(cellIndexPath: IndexPath, cellIndex: Int) {
        sectionsNum[cellIndexPath.section]+=1
        print("\(sectionsNum)")
        tableView.reloadData()

    }
    
    func clickMinus(cellIndexPath: IndexPath, cellIndex: Int) {
        sectionsNum[cellIndexPath.section]-=1
        tableView.reloadData()
    }
}

extension ViewController : RemovingSections{
    func removeSectionOnClick(SectionNumber: Int) {
        sectionsNum.remove(at: SectionNumber)
        tableView.reloadData()
    }
}

