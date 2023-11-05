//
//  ResultTableViewController.swift
//  project238
//
//  Created by Денис Хафизов on 02.11.2023.
//

import UIKit

final class ResultTableViewController: UITableViewController {
    var incorrectWordsList: [Word]!
    
}

// MARK: - TableViewDataSource
extension ResultTableViewController {
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        incorrectWordsList.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        let word = incorrectWordsList[indexPath.row]
        
        var content = cell.defaultContentConfiguration()
        content.text = word.translation
        content.secondaryText = word.word
        cell.contentConfiguration = content
        
        return cell
    }
}

// MARK: - TableViewDelegate
extension ResultTableViewController {
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
//    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
//        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as? ResultTableViewCell
//        cell?.wordLabel.text = "Кот"
//        cell?.correctTranslationLabel.text = "Cat"
//        cell?.incorrectЕranslationLabel.text = "Cot"
//
//        return cell
//    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        "Кол-во ошибок: \(incorrectWordsList.count). Повторите слова:"
    }
    
   
//    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
//        110
//    }
}
