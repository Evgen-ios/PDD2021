//
//  ResultsViewController.swift
//  PDD2021
//
//  Created by Evgeniy Goncharov on 15.06.2021.
//

import UIKit

class ResultsViewController: UIViewController {
    
    // MARK: - IBOutlets
    
    @IBOutlet weak var resultAnswers: UILabel!
    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var smileLabel: UILabel!
    
    // MARK: - Private Properties
    
    private let answers: [Answer]
    private var trueAnswers = 0
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        calculateResult()
        
        navigationItem.hidesBackButton = true
        
    }
    
    init?(coder: NSCoder, _ answers: [Answer]) {
        self.answers = answers
        super.init(coder: coder)
    }
    
    required init?(coder: NSCoder) {
        fatalError("\(#line) \(#function) init(coder:) has not been implemented")
    }
    
    // MARK: Private Methods
    
    
    /// Calculate true answers
    private func calculateResult() {
        for value in answers {
            if (value.type == true) {
                trueAnswers += 1
            }
        }
        checTrueAnswersResult(trueAnswers: trueAnswers)
    }
    
    
    /// Check true answers
    /// - Parameter trueAnswers: count true answers
    private func checTrueAnswersResult(trueAnswers: Int) {
        if Question.all.count - trueAnswers < 3 {
            setResult(answerErrors: (Question.all.count - trueAnswers), label: CountAnswers.good.definition, smile: CountAnswers.good.rawValue )
        } else {
            setResult(answerErrors: (Question.all.count - trueAnswers), label: CountAnswers.bad.definition, smile: CountAnswers.bad.rawValue )
        }
    }
    
    /// Set results
    /// - Parameters:
    ///   - answerErrors: How many answers false
    ///   - label: Set description
    ///   - smile: Set smile
    private func setResult(answerErrors: Int, label: String, smile: Character) {
        if answerErrors < 3 {
            resultLabel.text = "Отличный результат! Ошибок \(answerErrors)"
        } else  {
            resultLabel.text = "Ошибок \(answerErrors)"
        }
        resultAnswers.text = label
        smileLabel.text = "\(smile)"
    }
    
}
