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
            setResult(answerErrors: (Question.all.count - trueAnswers), label: CountAnswers.good.definition, smile: CountAnswers.good.rawValue )
        } else {
            setResult(answerErrors: (Question.all.count - trueAnswers), label: CountAnswers.bad.definition, smile: CountAnswers.bad.rawValue )
        }
    }
    
    func setResult(answerErrors: Int, label: String, smile: Character) {
        if answerErrors < 3 {
            resultLabel.text = "Отличный результат! Ошибок \(answerErrors)"
        } else  {
            resultLabel.text = "Ошибок \(answerErrors)"
        }
        resultAnswers.text = label
        smileLabel.text = "\(smile)"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        calculateResult()
        navigationItem.hidesBackButton = true
        
    }
    
    
}
