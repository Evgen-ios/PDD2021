//
//  QuestionViewController.swift
//  PDD2021
//
//  Created by Evgeniy Goncharov on 07.06.2021.
//

import UIKit


class QuestionViewController: UIViewController {
    
    
    @IBOutlet weak var imageStackViev: UIImageView!
    @IBOutlet weak var questionlabel: UILabel!
    
    @IBOutlet weak var singleStackView: UIStackView!
    @IBOutlet var singleButtons: [UIButton]!
    
    @IBOutlet weak var multipleStackView: UIStackView!
    @IBOutlet var multipleLabels: [UILabel]!
    @IBOutlet var multipleStackViewChildren: [UIStackView]!
    @IBOutlet var multipleSwitch: [UISwitch]!
    
    @IBOutlet weak var rangedSlider: UISlider!
    @IBOutlet weak var rangedStackView: UIStackView!
    @IBOutlet weak var rangeLabelAnswer: UILabel!
    @IBOutlet var rangeLabels: [UILabel]!
    
    @IBOutlet weak var questionProgressView: UIProgressView!
    
    private var answerChosen: [Answer] = [] {
        didSet {
            print(#line, #function, answerChosen)
        }
        
    }
    
    private var currentAnswers: [Answer] {
        currentQuestion.answers
    }
    
    private var currentQuestion: Question {
        Question.all[questionIndex]
    }
    
    // Start index question
    var questionIndex = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        rangedSlider.maximumValue = 0.9999
        updateUI()
    }
    
    
    func updateUI() {
        navigationItem.title = "Билет № 24 Вопрос № \(questionIndex + 1 )"
        setMultipleSwitchIsOff(sender: nil)
        
        func  updateSingleStack() {
            singleStackView.isHidden = false
            for (index,button) in singleButtons.enumerated() {
                button.setTitle(nil, for: [])
                button.tag = index
            }
            
            for (button, answer) in zip (singleButtons, answers) {
                button.setTitle(answer.text, for: [])
                button.isHidden = false
            }
        }
        
        
        func updateMultipleStack() {
            multipleStackView.isHidden = false
            for (label, answer) in zip (multipleLabels, answers) {
                label.text = answer.text
            }
            
            for (stack, _) in zip (multipleStackViewChildren, answers) {
                stack.isHidden = false
            }
        }
        
        
        func updateRangedStack() {
            rangedStackView.isHidden = false
            rangeLabelAnswer.text = currentAnswers[Int(floor(rangedSlider.value * Float(currentAnswers.count)))].text
            for (label, answer) in zip (rangeLabels, answers) {
                label.text = answer.text
            }
            
        }
        
        
        for stackView in [singleStackView, multipleStackView, rangedStackView] {
            stackView?.isHidden = true
        }
        
        
        let answers = currentQuestion.answers
        let totalProgress = Float(questionIndex) / Float(Question.all.count)
        questionlabel.text = currentQuestion.text
        imageStackViev.image = UIImage(named: "\(questionIndex + 1)")
        questionProgressView.setProgress(totalProgress, animated: true)
        
        switch currentQuestion.type {
        case .single:
            updateSingleStack()
        case .multiple:
            updateMultipleStack()
        case .range:
            updateRangedStack()
        }
    }
    
    
    func nextQuestinon() {
        questionIndex += 1
        if questionIndex < Question.all.count {
            updateUI()
        } else {
            navigationItem.title = ""
            performSegue(withIdentifier: "Results Segue", sender: nil)
        }
        
    }
    
    
    // Switch only one swecher
    func setMultipleSwitchIsOff(sender: UISwitch!) {
        for switcher in multipleSwitch {
            if switcher != sender {
                switcher.setOn(false, animated: true)
            }
        }
    }
    
    
    func showAlertErrorAswer()  {
        let alert = UIAlertController(title: "Ответ не выбран", message: "Выбирите ваш варант ответа и нажмите ответить", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Продолжить", style: .default, handler: nil))
        self.present(alert, animated: true)
    }
    
    
    @IBAction func singleButtonPressed(_ sender: UIButton) {
        let index = sender.tag
        
        guard 0 <= index && index < currentAnswers.count else {
            return
        }
        let answer = currentAnswers[index]
        answerChosen.append(answer)
        nextQuestinon()
    }
    
    
    @IBAction func multiButtonPressed() {
        for (index,multiSwitches) in multipleSwitch.enumerated() {
            if multiSwitches.isOn && index < currentAnswers.count {
                let answer = currentAnswers[index]
                answerChosen.append(answer)
            }
            
        }
        nextQuestinon()
    }
    
    
    @IBAction func touchMultipleSwitch(_ sender: UISwitch) {
        setMultipleSwitchIsOff(sender: sender)
    }
    
    
    @IBAction func rangedButtonPressed(){
        let index = Int(round(rangedSlider.value * Float(currentAnswers.count - 1)))
        if index < currentAnswers.count {
            let answer = currentAnswers[index]
            answerChosen.append(answer)
        }
        nextQuestinon()
    }
    
    
    @IBAction func ragedSliderChanged() {
        rangeLabelAnswer.text = currentAnswers[Int(floor(rangedSlider.value * Float(currentAnswers.count)))].text
        
    }
    
    
    @IBSegueAction func resultsSeque(_ coder: NSCoder) -> ResultsViewController? {
        return ResultsViewController(coder: coder, answerChosen)
    }
    
}
