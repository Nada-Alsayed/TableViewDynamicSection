//
//  CustomViewHeader.swift
//  dynamicTableRows
//
//  Created by MAC on 11/01/2024.
//

import UIKit

class CustomViewHeader: UITableViewHeaderFooterView {
    
    @IBOutlet weak var sectionLabel: UILabel!
    
    var sectionNumber : Int?
    var delegate:RemovingSections?
    
    @IBAction func removeBtn(_ sender: Any) {
        delegate?.removeSectionOnClick(SectionNumber: sectionNumber ?? 0)
    }
}
