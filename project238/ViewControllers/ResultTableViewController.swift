//
//  ResultTableViewController.swift
//  project238
//
//  Created by Денис Хафизов on 02.11.2023.
//

import UIKit

class ResultTableViewController: UITableViewController {

}


// MARK: - TableViewDataSource
extension ResultTableViewController {

    override func numberOfSections(in tableView: UITableView) -> Int {
        1
    }
}

// MARK: - TableViewDelegate
extension ResultTableViewController {

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as? ResultTableViewCell
        cell?.wordLabel.text = "Кот"
        cell?.correctTranslationLabel.text = "Cat"
        cell?.incorrectЕranslationLabel.text = "Cot"
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        110
    }
}
