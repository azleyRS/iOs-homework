import UIKit

// Задача 0 (из лекции). Пример универсальной функции суммирования элементов. 

func sum<T: AdditiveArithmetic>(array: Array<T>) -> T {
	var result = T.zero
	for t in array {
		result = result + t
	}
	return result
}

let array = [1, 2, 3, 4, 5]

print(sum(array: array))
