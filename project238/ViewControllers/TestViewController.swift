//
//  TestViewController.swift
//  project238
//
//  Created by Денис Хафизов on 02.11.2023.
//

import UIKit

final class TestViewController: UIViewController {

    @IBOutlet weak var wordLabel: UILabel!
    @IBOutlet weak var checkWordTF: UITextField!
    @IBOutlet weak var checkButton: UIButton!
    @IBOutlet weak var questionPV: UIProgressView!
    
    var words = Word.getDictionary()
    private var incorrectWordsList: [Word] = []
    private var incorrectAnswers: [String] = []
    private var questionСounter = 0
    private var currentWord = ""
    private var numberOfQuestions = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupAlert(title: "Введите количество слов", message: "Необходимо ввести количество слов которые будут участвовать в тесте: от 1 до \(words.count). При введении числа вне диапазона, число слов в тесте будет равно \(words.count)")

        wordLabel.text = "Начать тест"
        
        questionPV.progressTintColor = .green
        questionPV.setProgress(0, animated: false)
        
        title = "Тест"
        
        setupButton(
            button: checkButton,
            title: "Начать тест",
            backColor: .darkGray
        )
        words.shuffle()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let resultTVC = segue.destination as? ResultTableViewController else { return }
        resultTVC.incorrectWordsList = incorrectWordsList
    }
    
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        if questionСounter == numberOfQuestions + 1 {
            true
        } else {
            false
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        view.endEditing(true)
    }
    
    @IBAction func checkButtonPressed(_ sender: UIButton) {
        if questionСounter < numberOfQuestions - 1 {
            setupButton(
                button: checkButton,
                title: "Проверить",
                backColor: .cyan
            )
            checkWordTF.isHidden = false
        } else {
            setupButton(
                button: checkButton,
                title: "Завершить",
                backColor: .green
                )
        }
        
        currentWord = checkWordTF.text ?? ""
        checkTranslation()
        
        if questionСounter < numberOfQuestions {
            wordLabel.text = words[questionСounter].translation
            title = "\(questionСounter + 1)/\(numberOfQuestions)"
        } else {
            title = "Проверь себя"
        }
        
        questionСounter += 1
        checkWordTF.text = ""
        questionPV.setProgress(Float(questionСounter) / Float(numberOfQuestions), animated: true)
    }
    
    
    private func checkTranslation() {
        if questionСounter < numberOfQuestions {
            if words[questionСounter].word.lowercased() != currentWord.lowercased() {
                incorrectWordsList.append(words[questionСounter])
            }
        }
    }
    
    private func setupButton(button: UIButton, title: String, backColor: UIColor) {
        button.setTitle(title, for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = backColor
        button.layer.cornerRadius = 10
    }
    
    private func setupAlert(title: String, message: String) {
        let alert = UIAlertController(
            title: title,
            message: message,
            preferredStyle: .alert
        )
        
        let saveAction = UIAlertAction(title: "Сохранить", style: .default) { _ in
            let numberOfQuestionsTF = alert.textFields?.first
            if let numberOfQuestions = Int(numberOfQuestionsTF?.text ?? "") {
                if numberOfQuestions > self.words.count {
                    self.numberOfQuestions = self.words.count
                } else {
                    self.numberOfQuestions = numberOfQuestions
                }
            }
        }
        alert.addTextField { _ in }
        alert.addAction(saveAction)
        
        present(alert, animated: true)
    }
}

