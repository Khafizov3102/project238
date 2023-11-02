//
//  AddWordViewController.swift
//  project238
//
//  Created by Денис Хафизов on 02.11.2023.
//

import UIKit

class AddWordViewController: UIViewController {
    @IBOutlet weak var newWordTF: UITextField!
    @IBOutlet weak var translateNewWordTF: UITextField!
    @IBOutlet weak var newWordContextTF: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func saveButtonPressed() {
    }
    
    @IBAction func cancelButtonPressed() {
        dismiss(animated: true)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
