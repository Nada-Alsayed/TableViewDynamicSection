//
//  ViewController.swift
//  dynamicTableRows
//
//  Created by MAC on 08/01/2024.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var addNewRoomL: UILabel!
    @IBOutlet weak var tableHeightCon: NSLayoutConstraint!
    
    //MARK: -Variables
    
    var sectionsNum :[Int] = [2]
   // var counter = 0

    //MARK: - View Controller LifeCycle
    
    override func viewWillAppear(_ animated: Bool) {
        tableView.addObserver(self, forKeyPath: "contentSize",options: .new , context: nil)
        tableView.reloadData()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        tableView.removeObserver(self, forKeyPath: "contentSize")
    }
    
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        if keyPath == "contentSize", let tableView = object as? UITableView, tableView == tableView {
            if let newvalue = change?[.newKey] as? CGSize {
                tableHeightCon.constant = newvalue.height
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("load")
        setUpTableView()
        addLabelTapGesture()
    }
    
    func addLabelTapGesture(){
        let tap = UITapGestureRecognizer(target: self, action: #selector(addNewSection))
        addNewRoomL.isUserInteractionEnabled = true
        addNewRoomL.addGestureRecognizer(tap)
    }
    
    @objc func addNewSection(){
        print("Array on click : \(sectionsNum)")
        sectionsNum.append(2)
        tableView.insertSections(IndexSet(integer: sectionsNum.count - 1), with: .automatic)
       // tableView.reloadData()
        print("after Array on click : \(sectionsNum)")
    }
}

