import UIKit

//Реализуйте проверяльщик примеров.
//
//
//1. Есть массив строк. Но это не обычные строки - это примеры.
//Пример - это строка формата «32 + 16 = 48». В нём два числа слева от равно, одно число справа. Операции: сложение и вычитание.

struct ArrayError: Error {
    var description: String
}

enum ArrayResult{
    case success(message: String)
    case errors(errorsArray: [String], message: String)
    case invalid(message: String)
}


let successArray = ["-32 + 16 = -16", "-32 - 17 = -49", "-33 - 16 = -49", "100 - 50 = 50"]
let array75 = ["2 + 2 = 5", "3 + 3 = 5", "1 + 1 = 3", "1 + 1 = 3", "1 + 1 = 2"]
let failedArray = ["2 ++ 2 = 5", "3 + 3 = 5", "1 + 1 = 3", "1 + 1 = 3", "1 + 1 = 2"]
let successfulTask = "-32 + 16 = -16"
let failedTask = "2 ++ 2 = 5"
let errorTask = "2 + 2 = 3"

let pattern = "-?\\d+\\s[+-]\\s-?\\d+\\s=\\s-?\\d+"

//2. Есть функция checkHomework, которая:
//    1. Принимает массив примеров
//    2. И возвращает:
//        1. Если больше 75% ошибок в примерах - функция возвращает список всех примеров с ошибками и подписью «делай заново»
//        2. Если пример решён верно - возвращает строку «молодец»
//        3. Если нет примеров - возвращает строку «нет примеров»
//    3. Если ей на вход дать хотя бы один невалидный пример - выводит "переделывай" и не оценивает другие примеры
func checkHomework(array: [String]) -> ArrayResult {
    var counter = 0
    var errorsArray = [String]()
    for str in array {
        if str.range(of: pattern, options: .regularExpression) == nil {
            return ArrayResult.invalid(message: "переделывай")
        }
        let splittedStr = str.split(separator: " ")
        if let x = Int(splittedStr[0]), let y = Int(splittedStr[2]), let result = Int(splittedStr[4]) {
            let operation = splittedStr[1]
            if (operation == "+" && x + y == result) || (operation == "-" && x - y == result) {
                counter += 1
            } else {
                errorsArray.append(str)
            }
        }
    }
    return Double(counter)/Double(array.count) < 0.25 ? ArrayResult.errors(errorsArray: errorsArray, message: "делай заново") : ArrayResult.success(message: "молодец")
}

print(checkHomework(array: successArray))
print(checkHomework(array: array75))
print(checkHomework(array: failedArray))

//3. Есть функция checkTask:
//    1. Она принимает пример
//    2. Если это не пример - надо кинуть исключение
//    3. Если пример решён правильно - возвращаем строку с похвалой. Если нет - возвращаем ошибку с правильным ответом
func checkTask(str: String) throws -> String {
    if str.range(of: pattern, options: .regularExpression) == nil {
        throw ArrayError(description: "переделывай")
    }
    let splittedStr = str.split(separator: " ")
    if let x = Int(splittedStr[0]), let y = Int(splittedStr[2]), let result = Int(splittedStr[4]) {
        let operation = splittedStr[1]
        if !((operation == "+" && x + y == result) || (operation == "-" && x - y == result)) {
            let actualRes = operation == "+" ? x + y : x - y
            throw ArrayError(description: "\(x) \(operation) \(y) = \(actualRes)")
        }
    }
    return "молодец"
}

// Проверка checkTask
print(try checkTask(str: successfulTask))
do {
    try checkTask(str: failedTask)
} catch {
    print("failed case \(error)")
}
do {
    try checkTask(str: errorTask)
} catch {
    print("error case \(error)")
}

// функция, если хотим под капотом использовать checkTask

func checkHomework2(array: [String]) -> ArrayResult {
    var counter = 0
    var errorsArray = [String]()
    for str in array {
        do {
            try checkTask(str: str)
            counter += 1
        } catch let error as ArrayError where error.description == "переделывай" {
            return ArrayResult.invalid(message: error.description)
        } catch let error as ArrayError {
            errorsArray.append(error.description)
        } catch {
            ArrayResult.invalid(message: "Переделывай")
        }
    }
    return Double(counter)/Double(array.count) < 0.25 ? ArrayResult.errors(errorsArray: errorsArray, message: "делай заново") : ArrayResult.success(message: "молодец")
}

print(checkHomework2(array: successArray))
print(checkHomework2(array: array75))
print(checkHomework2(array: failedArray))
