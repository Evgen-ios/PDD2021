//
//  Qeston.swift
//  PDD2021
//
//  Created by Evgeniy Goncharov on 15.06.2021.
//

struct Question {
    
    let text: String
    let type: ResponseType
    
    let image: String
    let answers: [Answer]
    
    static let all: [Question] = [
        
        Question(text: "Какие из указанных знаков обозначают участки, на которых водитель обязан уступать дорогу пешеходам, находящимся на проезжей части?",
                 type: .single,
                 image: "1",
                 answers: [
                    Answer(text: "Только Б", type: false),
                    Answer(text: "Б и В", type: true),
                    Answer(text: "Все", type: false),
                 ]),
        
        Question(text: "Какие из указанных знаков разрешают движение грузовым автомобилям с разрешенной максимальной массой не более 3,5 т?",
                 type: .range,
                 image: "2",
                 answers: [
                    Answer(text: "Только А", type: false),
                    Answer(text: "А и В", type: true),
                    Answer(text: "Все", type: false),
                 ]),
        
        Question(text: "Какой маневр намеревается выполнить водитель легкового автомобиля?",
                 type: .single,
                 image: "3",
                 answers: [
                    Answer(text: "Обгон", type: false),
                    Answer(text: "Перестроение с дальнейшим опережением", type: true),
                    Answer(text: "Обьезд", type: false),
                 ]),
        
        Question(text: "Действие каких знаков из указанных распространяется только до ближайшего по ходу движения перекрестка?",
                 type: .multiple,
                 image: "4",
                 answers: [
                    Answer(text: "А и Б", type: false),
                    Answer(text: "Б и Г", type: true),
                    Answer(text: "В и Г", type: false),
                 ]),
        
        Question(text: "Какие из указанных знаков используются для обозначения номера, присвоенного дороге (маршруту)?",
                 type: .multiple,
                 image: "5",
                 answers: [
                    Answer(text: "Только А", type: false),
                    Answer(text: "Только Б", type: false),
                    Answer(text: "А и Б", type: true),
                 ]),
        
        Question(text: "Можно ли Вам за перекрестком въехать во двор?",
                 type: .single,
                 image: "6",
                 answers: [
                    Answer(text: "Можно", type: true),
                    Answer(text: "Можно, если Вы проживаете в этом доме", type: false),
                    Answer(text: "Нельзя", type: false),
                 ]),
        
        Question(text: "Вам разрешено выполнить поворот направо:",
                 type: .single,
                 image: "7",
                 answers: [
                    Answer(text: "Только по траектории А", type: true),
                    Answer(text: "Только по траектории Б", type: false),
                    Answer(text: "По любой траектории из указанных", type: false),
                 ]),
        
        Question(text: "Обязаны ли Вы включить указатели правого поворота перед въездом на этот перекресток?",
                 type: .single,
                 image: "8",
                 answers: [
                    Answer(text: "Обязаны", type: true),
                    Answer(text: "Обязаны при наличии транспортных средств", type: false),
                    Answer(text: "Не обязаны", type: false),
                 ]),
        
        Question(text: "Вы можете продолжить движение по крайней левой полосе:",
                 type: .range,
                 image: "9",
                 answers: [
                    Answer(text: "Только налево", type: false),
                    Answer(text: "Только в обратном", type: false),
                    Answer(text: "В обратном и налево", type: true),
                 ]),
        
        Question(text: "На каком расстоянии от транспортного средства должен быть выставлен знак аварийной остановки в данной ситуации?",
                 type: .multiple,
                 image: "10",
                 answers: [
                    Answer(text: "Не менее 10 м", type: false),
                    Answer(text: "Не менее 15 м", type: true),
                    Answer(text: "Не менее 20 м", type: false),
                    Answer(text: "Не менее 30 м", type: false),
                 ]),
        
        Question(text: "Кто из водителей, выполняющих поворот, должен уступить дорогу пешеходам?",
                 type: .range,
                 image: "11",
                 answers: [
                    Answer(text: "Водитель легкового автомобиля", type: false),
                    Answer(text: "Водитель грузового автомобиля", type: false),
                    Answer(text: "Оба Водителя должны уступить", type: true),
                 ]),
        
        Question(text: "Водители каких автомобилей не нарушили правила остановки?",
                 type: .multiple,
                 image: "12",
                 answers: [
                    Answer(text: "Только автомобиля Б", type: false),
                    Answer(text: "Только автомобиля B", type: false),
                    Answer(text: "Автомобилей А и Б", type: true),
                    Answer(text: "Автомобилей А и В", type: false),
                 ]),
        
        Question(text: "Нарушил ли водитель автомобиля правила остановки?",
                 type: .single,
                 image: "13",
                 answers: [
                    Answer(text: "Нарушил", type: true),
                    Answer(text: "Нарушил, если расстояние до линии разметки менее 3 м", type: false),
                    Answer(text: "Не нарушил", type: false),
                 ]),
        
        Question(text: "Вы намерены повернуть налево. Кому Вы должны уступить дорогу?",
                 type: .range,
                 image: "14",
                 answers: [
                    Answer(text: "Только пешеходам", type: false),
                    Answer(text: "Только автобусу", type: false),
                    Answer(text: "Автобусу и пешеходам", type: true),
                 ]),
        
        Question(text: "На каком расстоянии до неровного участка дороги устанавливается этот знак вне населенного пункта?",
                 type: .range,
                 image: "15",
                 answers: [
                    Answer(text: "150—300 м", type: true),
                    Answer(text: "В начале неровности", type: false),
                    Answer(text: "50—100 м", type: false),
                    
                 ]),
        
        Question(text: "При наличии какого знака водитель должен уступить дорогу, если встречный разъезд затруднен?",
                 type: .multiple,
                 image: "16",
                 answers: [
                    Answer(text: "Только В", type: false),
                    Answer(text: "А и В", type: true),
                    Answer(text: "Б и В", type: false),
                    Answer(text: "Б и Г", type: false),
                 ]),
        
        Question(text: "По каким полосам Правила разрешают Вам движение на этой дороге?",
                 type: .single,
                 image: "17",
                 answers: [
                    Answer(text: "По любой полосе", type: false),
                    Answer(text: "По правой или средней полосе", type: false),
                    Answer(text: "Только по правой полосе", type: true),
                    
                 ]),
        
        Question(text: "Такой сигнал рукой, подаваемый водителем мотоцикла, который движется по левой полосе, информирует о его намерении:",
                 type: .single,
                 image: "18",
                 answers: [
                    Answer(text: "Продолжить движение прямо", type: false),
                    Answer(text: "Повернуть направо", type: true),
                    Answer(text: "Остановиться", type: false),
                    
                 ]),
        
        Question(text: "На каком расстоянии от знака Вам разрешено поставить автомобиль на стоянку?",
                 type: .range,
                 image: "19",
                 answers: [
                    Answer(text: "Не менее 5 м", type: false),
                    Answer(text: "Не менее 10 м", type: false),
                    Answer(text: "Не менее 15 м", type: true),
                    
                 ]),
        
        Question(text: "Главная дорога показана:",
                 type: .range,
                 image: "20",
                 answers: [
                    Answer(text: "Только на левом верхнем", type: false),
                    Answer(text: "Только на правом верхнем", type: false),
                    Answer(text: "На обоих верхних рисунках", type: true),
                    Answer(text: "На всех рисунках", type: false),
                    
                 ]),
    ]
}
