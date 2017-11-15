//
//  MainTableViewController.swift
//  CustomTransitionDemo
//
//  Created by 王俊硕 on 2017/10/11.
//  Copyright © 2017年 王俊硕. All rights reserved.
//

import UIKit

class MainTableViewController: UIViewController {

    var transition = JSPresentDelegate()
    @IBOutlet var contentView: UITableView!
    var selectedOrigin: CGPoint!
    var selectedCellColor: UIColor!
    var selectedIndexPath: IndexPath!
    var selectedData: CellData { get { return cellsData[selectedIndexPath.section] } }
    var cellSnap: UIView { get { return (contentView.cellForRow(at: selectedIndexPath)?.snapshotView(afterScreenUpdates: false))! } }
    
    var cellsData: [CellData] = []
    
    let rowHeight = CGFloat(395)
    let cellColors: [UIColor] = [.yellow, .black, .red, .cyan, .blue]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initDataSet()
        contentView.delegate = self
        contentView.dataSource = self
        contentView.separatorStyle = .none
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func initDataSet() {
        let imageSet = ["D1", "D2", "D3"]
        let titleSet = ["Let's fly to the moon", "It's house everywhere", "Glaxcy is still in peace"]
        let subtitleSet = ["To the moon", "Have a look", "Glaxcy"]
        let descriptionSet = ["What's the dirjaijas", "DDasd asdaa squirrel", "Aadasdd a rabbit"]
        
        [0,1,2].forEach() {
            self.cellsData.append(CellData(image: imageSet[$0], title: titleSet[$0], subtitle: subtitleSet[$0], description: descriptionSet[$0]))
        }
    }
}
struct CellData {
    var image: String
    var title: String
    var subtitle: String
    var description: String
}
