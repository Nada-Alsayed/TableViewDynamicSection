//
//  TableViewCell.swift
//  dynamicTableRows
//
//  Created by MAC on 10/01/2024.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var number: UILabel!
    
    var cellIndexPath :IndexPath?
    var cellIndex :Int = 0
  //  var delegate : ClickDelegate?
    var delegate : DelegateOnClick?
    static let id = String(describing: TableViewCell.self)
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func prepareForReuse() {
        self.backgroundColor = .white
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setData(data : String,array:[Int]){
        label.text = data
        if label.text == "Childeren"{
            number.text = "\(array[cellIndexPath?.section ?? 0]-2)"
        }else{
            number.text = "0"
        }
    }
    
    @IBAction func increaseBtn(_ sender: Any) {
        if label.text == "Childeren"{
           // addChilderenNumber(op:"+")
            delegate?.clickPlus(cellIndexPath: cellIndexPath ?? IndexPath(), cellIndex: cellIndex)
        }
    }
    
    
    @IBAction func decreaseBtn(_ sender: Any) {
        if label.text == "Childeren"{
           // addChilderenNumber(op:"-")
            delegate?.clickMinus(cellIndexPath: cellIndexPath ?? IndexPath(), cellIndex: cellIndex)
        }
    }
    
//    func addChilderenNumber(op : String){
//        if op == "+"{
//           // counter+=1
//            //self.number.text = "\(self.counter)"
//            delegate?.click(cellIndexPath: cellIndexPath ?? IndexPath(),cellIndex: cellIndex , cellNumbers: counter+2)
//        }else if op == "-" && counter>0{
//            //counter-=1
//           // self.number.text = "\(self.counter)"
//            delegate?.click(cellIndexPath: cellIndexPath ?? IndexPath(),cellIndex: cellIndex , cellNumbers: counter+2)
//        }
//    }
    
}
