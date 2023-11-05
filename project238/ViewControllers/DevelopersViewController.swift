//
//  DevelopersViewController.swift
//  project238
//
//  Created by Денис Хафизов on 02.11.2023.
//

import UIKit

final class DevelopersViewController: UIViewController {
    @IBOutlet weak var nameDeveloperOne: UILabel!
    @IBOutlet weak var nameDeveloperTwo: UILabel!
    @IBOutlet weak var nameDeveloperThree: UILabel!
    @IBOutlet weak var nameDeveloperFour: UILabel!
    
    @IBOutlet weak var jobTitleFour: UILabel!
    @IBOutlet weak var jobTitleThree: UILabel!
    @IBOutlet weak var jobTitleTwo: UILabel!
    @IBOutlet weak var jobTitleOne: UILabel!
    
    private let developers = [
        "Хафизов Денис",
        "Баранов Александр",
        "Степанян Грайр",
        "Саталкин Кирилл"
    ]
    private let jobTitle = [
        "Руководитель проекта",
        "Разработик"
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        nameDeveloperOne.text = developers[0]
        nameDeveloperTwo.text = developers[1]
        nameDeveloperThree.text = developers[2]
        nameDeveloperFour.text = developers[3]
        
        jobTitleOne.text = jobTitle[0]
        jobTitleTwo.text = jobTitle[1]
        jobTitleThree.text = jobTitle[1]
        jobTitleFour.text = jobTitle[1]
    }
}

