//
//  WordsTableViewController.swift
//  project238
//
//  Created by Денис Хафизов on 02.11.2023.
//

import UIKit

class WordsTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
//        self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    
    @IBAction func unwind(for segue: UIStoryboardSegue) {
    }
}

// MARK: - TableViewDataSource
extension WordsTableViewController {

    override func numberOfSections(in tableView: UITableView) -> Int {
        1
    }
}

// MARK: - TableViewDelegate
extension WordsTableViewController {
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as? WordInfoTableViewCell
        cell?.wordLabel.text = "Cat"
        cell?.translateLabel.text = "Кот"
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        85
    }
}
