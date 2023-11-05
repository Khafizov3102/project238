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
    
    var words: [Word] = []
    
    private var incorrectWordsList: [Word] = []
    private var incorrectAnswers: [String] = []
    private var questionСounter = 0
    private var currentWord = ""
    private var numberOfQuestions = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupAlert(title: "Введите количество слов", message: "Необходимо ввести количество слов которые будут участвовать в тесте: от 1 до \(words.count). При введении числа вне диапазона, число слов в тесте будет равно \(words.count)")
        
        setupUI()
        
        numberOfQuestions = 4
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let resultTVC = segue.destination as? ResultTableViewController else { return }
        resultTVC.incorrectWordsList = incorrectWordsList
        resultTVC.hidesBottomBarWhenPushed = true
        resultTVC.navigationItem.hidesBackButton = true
    }
    
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        if questionСounter == numberOfQuestions {
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
        if checkButton.titleLabel?.text == "Пройти тест еще раз" {
            setupAlert(title: "Введите количество слов", message: "Необходимо ввести количество слов которые будут участвовать в тесте: от 1 до \(words.count). При введении числа вне диапазона, число слов в тесте будет равно \(words.count)")
            
            setupButton(
                button: checkButton,
                title: "Проверить",
                backColor: .cyan
            )
            
            wordLabel.text = words.first?.translation
            
            checkWordTF.isHidden = false
        }
        
        if questionСounter == numberOfQuestions - 1 {
            setupButton(
                button: checkButton,
                title: "Завершить",
                backColor: .green
                )
        } else {
            setupButton(
                button: checkButton,
                title: "Проверить",
                backColor: .cyan
            )
            checkWordTF.isHidden = false
        }
        
        currentWord = checkWordTF.text ?? ""
        
        if questionСounter < numberOfQuestions {
            wordLabel.text = words[questionСounter + 1].translation
            title = "\(questionСounter + 1)/\(numberOfQuestions)"
        } else {
            title = "Проверь себя"
        }
        
        questionPV.setProgress(Float(questionСounter) / Float(numberOfQuestions), animated: true)
        
        checkWordTF.text = ""
        
        checkTranslation()
    }
    
    @IBAction func unwind(for segue: UIStoryboardSegue) {
        setupUI()
        setupButton(
            button: checkButton,
            title: "Пройти тест еще раз",
            backColor: .lightGray
        )
        resetTest()
    }
    
    private func resetTest() {
        incorrectWordsList = []
        incorrectAnswers = []
        questionСounter = 0
        currentWord = ""
        numberOfQuestions = 0
    }
    
    private func setupUI() {
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
        
        checkWordTF.isHidden = true
    }
    
    private func checkTranslation() {
        if questionСounter < numberOfQuestions {
            if words[questionСounter].word.lowercased() != currentWord.lowercased() {
                incorrectWordsList.append(words[questionСounter])
            }
        }
        questionСounter += 1
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
