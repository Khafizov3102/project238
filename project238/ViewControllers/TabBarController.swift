//
//  TabBarController.swift
//  project238
//
//  Created by Денис Хафизов on 02.11.2023.
//

import UIKit

final class TabBarController: UITabBarController {
    
    let words = Word.getDictionary()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        transferData()
    }
    
    private func transferData() {
        guard let viewControllers else { return }
        
        viewControllers.forEach {
            if let navigationVC = $0 as? UINavigationController {
                let WordsVC = navigationVC.topViewController
                if let WordsListVC = WordsVC as? WordsTableViewController {
                    WordsListVC.words = words
                }
                if let TestVC = WordsVC as? TestViewController {
                    TestVC.words = words
                }
            }
        }
    }
}
