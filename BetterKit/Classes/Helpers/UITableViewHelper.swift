//
//  UITableViewHelper.swift
//  BetterKit
//
//  Created by Nathan Jangula on 3/15/18.
//

import Foundation

internal extension UITableView {
    @objc internal func _reloadData(animation: UITableView.RowAnimation, completion: (()->Void)? = nil) {
        var addedRows = [IndexPath]()
        var addedSections = IndexSet()
        var deletedRows = [IndexPath]()
        var deletedSections = IndexSet()
        var reloadedRows = [IndexPath]()
        
        var newRowCountBySections = [Int]()
        var oldRowCountBySections = [Int]()
        
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
                
                newRowCountBySections.append(newRowCount)
                oldRowCountBySections.append(oldRowCount)
                
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
        
        // We might be on the same thread, but that doesn't mean we can assume the values didn't change.
        // We need to double check that nothing has changed.
        
        func handleValueChanged(_ failingMethodName: String) {
            NSLog("\(failingMethodName) has returned an inconsistent value than at the beginning of the animation.  Aborting animation.")
            reloadData()
            endUpdates()
            CATransaction.commit()
        }
        
        guard newSectionCount == dataSource?.numberOfSections?(in: self) ?? 1 else {
            handleValueChanged("UITableViewDataSource.numberOfSections")
            return
        }
        guard oldSectionCount == numberOfSections else {
            handleValueChanged("UITableView.numberOfSections")
            return
        }
        
        for section in 0 ..< newRowCountBySections.count {
            let newRowCount = dataSource?.tableView(self, numberOfRowsInSection: section) ?? 0
            var oldRowCount = numberOfRows(inSection: section)
            //HACK: Sometimes numberOfRows returns Int.max rather than zero.
            if oldRowCount == Int.max {
                oldRowCount = 0
            }
            
            guard newRowCount == newRowCountBySections[section] else {
                handleValueChanged("UITableViewDataSource.tableView(tableView, numberOfRowsInSection:\(section)")
                return
            }
            
            guard oldRowCount == oldRowCountBySections[section] else {
                handleValueChanged("UITableView.numberOfRows(inSection:\(section)")
                return
            }
        }
        
        CATransaction.begin()
        beginUpdates()
        CATransaction.setCompletionBlock(completion)
        
        reloadRows(at: reloadedRows, with: animation)
        insertRows(at: addedRows, with: animation)
        insertSections(addedSections, with: animation)
        deleteRows(at: deletedRows, with: animation)
        deleteSections(deletedSections, with: animation)
        
        self.endUpdates()
        CATransaction.commit()
    }
}
