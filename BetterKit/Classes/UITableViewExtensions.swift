//
//  UITableViewExtensions.swift
//  BetterKit
//
//  Created by Nathan Jangula on 3/15/18.
//

import Foundation

@objc extension UITableView {
    
    @objc open func reloadData(_ animated: Bool) {
        guard animated else { reloadData(); return }

        reloadData(animation: .none)
    }
    
    @objc open func reloadData(animation: UITableViewRowAnimation) {
        beginUpdates()
        
        var addedRows = [IndexPath]()
        var addedSections = IndexSet()
        var deletedRows = [IndexPath]()
        var deletedSections = IndexSet()
        var reloadedRows = [IndexPath]()
        
        let newSectionCount = dataSource?.numberOfSections?(in: self) ?? 1
        let oldSectionCount = numberOfSections
        
        for section in 0 ..< max(newSectionCount, oldSectionCount) {
            if section >= oldSectionCount {
                addedSections.insert(section)
            } else if section >= newSectionCount {
                deletedSections.insert(section)
            } else {
                let newRowCount = dataSource?.tableView(self, numberOfRowsInSection: section) ?? 0
                var oldRowCount = numberOfRows(inSection: section)
                //HACK: Sometimes numberOfRows returns Int.max rather than zero.
                if oldRowCount == Int.max {
                    oldRowCount = 0
                }
                
                for row in 0 ..< max(newRowCount, oldRowCount) {
                    let indexPath = IndexPath(row: row, section: section)
                    if row >= oldRowCount {
                        addedRows.append(indexPath)
                    } else if row >= newRowCount {
                        deletedRows.append(indexPath)
                    } else {
                        reloadedRows.append(indexPath)
                    }
                }
            }
        }
        
        reloadRows(at: reloadedRows, with: animation)
        insertRows(at: addedRows, with: animation)
        insertSections(addedSections, with: animation)
        deleteRows(at: deletedRows, with: animation)
        deleteSections(deletedSections, with: animation)
        
        endUpdates()
    }
}
