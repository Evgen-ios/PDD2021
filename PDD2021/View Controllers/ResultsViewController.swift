//
//  ResultsViewController.swift
//  PDD2021
//
//  Created by Evgeniy Goncharov on 15.06.2021.
//

import UIKit

class ResultsViewController: UIViewController {
    @IBOutlet weak var resultAnswers: UILabel!
    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var smileLabel: UILabel!
    
    let answers: [Answer]
    var trueAnswers = 0
    
    
    init?(coder: NSCoder, _ answers: [Answer]) {
        self.answers = answers
        super.init(coder: coder)
    }
    
    required init?(coder: NSCoder) {
        fatalError("\(#line) \(#function) init(coder:) has not been implemented")
    }
    
    
    func calculateResult() {
        
        for value in answers {
            if (value.type == true) {
                trueAnswers += 1;
            }
        }
        if Question.all.count - trueAnswers < 3 {
            setResult(answerErrors: Question.all.count - trueAnswers , label: CountAnswers.good.definition)
        } else {
            setResult(answerErrors: Question.all.count - trueAnswers , label: CountAnswers.bad.definition)
        }
    }
    
    func setResult(answerErrors: Int, label: String) {
        if answerErrors == 0 {
            resultLabel.text = "Отличный результат! Ошибок \(trueAnswers)"
            resultAnswers.text = label
            smileLabel.text = "\(CountAnswers.good.rawValue)"
        } else {
            resultLabel.text = "Ошибок \(trueAnswers)"
            resultAnswers.text = label
            smileLabel.text = "\(CountAnswers.bad.rawValue)"
            
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        calculateResult()
    }
    
    
}
