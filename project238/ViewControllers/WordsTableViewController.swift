//
//  WordsTableViewController.swift
//  project238
//
//  Created by Денис Хафизов on 02.11.2023.
//

import UIKit

class WordsTableViewController: UITableViewController {
    var words = Word.getDictionary()

    override func viewDidLoad() {
        super.viewDidLoad()
//
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard segue.identifier == "segue" else { return }
        guard let wordInfoVC = segue.destination as? WordInfoViewController else { return }
        wordInfoVC.word = sender as? Word
    }
   
}

// MARK: - TableViewDataSource
extension WordsTableViewController {

    override func numberOfSections(in tableView: UITableView) -> Int {
        1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        words.count
    }
}

// MARK: - TableViewDelegate
extension WordsTableViewController {
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let word = words[indexPath.row]
        performSegue(withIdentifier: "segue", sender: word)
        tableView.deselectRow(at: indexPath, animated: true)
    }
    

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        let word = words[indexPath.row]
        
        var content = cell.defaultContentConfiguration()
        content.text = word.word
        content.secondaryText = word.translation
        cell.contentConfiguration = content
        
        return cell
    }
    

}
