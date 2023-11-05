//
//  WordInfoViewController.swift
//  project238
//
//  Created by Денис Хафизов on 02.11.2023.
//

import UIKit

final class WordInfoViewController: UIViewController {

    @IBOutlet weak var wordLabel: UILabel!
    @IBOutlet weak var translateLabel: UILabel!
    @IBOutlet weak var contextLabel: UILabel!
    
    var word: Word!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    
        
        wordLabel.text = word.word
        translateLabel.text = word.translation
        contextLabel.text = word.description
            
        
    }
    

  

}
