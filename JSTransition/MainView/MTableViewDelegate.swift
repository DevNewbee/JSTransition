//
//  MTableViewDelegate.swift
//  CustomTransitionDemo
//
//  Created by 王俊硕 on 2017/10/11.
//  Copyright © 2017年 王俊硕. All rights reserved.
//

import UIKit

extension MainTableViewController: UITableViewDelegate {
  
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        print("did select")
        let cellContent = tableView.cellForRow(at: indexPath)!.contentView

        let demo = storyboard!.instantiateViewController(withIdentifier: "Demo")
        let rect = tableView.convert(tableView.rectForRow(at: indexPath), to: self.view)

        selectedIndexPath = indexPath
        selectedOrigin = rect.origin

        demo.modalPresentationStyle = .custom
        demo.transitioningDelegate = transition
        present(demo, animated: true) {
            print("Done")
        }
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return rowHeight
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 5
    }
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 30
    }
//    func scrollViewDidScroll(_ scrollView: UIScrollView) {
//        print(scrollView.contentOffset)
//    }
}
extension CGSize {
    func scale(_ r: CGFloat) -> CGSize {
        return CGSize(width: width*r, height: height*r)
    }
}
