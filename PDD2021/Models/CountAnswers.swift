//
//  CountAnswers.swift
//  PDD2021
//
//  Created by Evgeniy Goncharov on 15.06.2021.
//

enum CountAnswers: Character {
    
    case good = "👍",
         bad = "😭"
    
    var definition: String {
        switch self {
        case .bad:
            return "Сожалеем, но Вы не прошли тестирование! Допустив слишком много ошибок."
        case .good:
            return "Поздравляем! Вы успешно прошли тестирование, ответив на нужно колличество вопросов верно."
        }
        
    }
}

