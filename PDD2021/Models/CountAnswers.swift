//
//  CountAnswers.swift
//  PDD2021
//
//  Created by Evgeniy Goncharov on 15.06.2021.
//

enum CountAnswers {
    case good, bad
    
    var definition: String {
        switch self {
        case .bad:
            return "Вы завалили экзамен! Допустив слишком много ошибок."
        case .good:
            return "Вы успешно прошли тест"
        }
        
    }
}
