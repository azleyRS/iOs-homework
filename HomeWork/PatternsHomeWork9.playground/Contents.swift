import UIKit


//Билдер

/// Типы автомобилей
enum CarType {
    case Electric
    case Gas
    case Diesel
    case Hybrid
}


/// Доступные цвета для покраски
enum PredefinedCarColor {
    case RED
    case GREEN
    case BLACK
    case WHITE
}

/// Автомобиль
struct Car {
    let type: CarType
    let color: PredefinedCarColor
    let numberOfSeats: Int
}


/// Билдер
protocol Builder {
    func setCarType(carType: CarType) -> Builder
    func setCarColor(color: PredefinedCarColor) -> Builder
    func setSeatsAmount(seatsNumber: Int) -> Builder
    func build() -> Car
}

/// Реализация билдера
class CarBuilder: Builder {
    
    private var carType: CarType = .Gas
    private var carColor: PredefinedCarColor = .BLACK
    private var numberOfSeats: Int = 4
    
    /// Установить тип автомобилья
    /// - Parameter carType: тип автомобиля
    /// - Returns: экземпляр билдера
    func setCarType(carType: CarType) -> Builder {
        self.carType = carType
        return self
    }
    
    /// Установить цвет автомобиля
    /// - Parameter colorToSet: цвет автомобиля
    /// - Returns: экземпляр билдера
    func setCarColor(color colorToSet: PredefinedCarColor) -> Builder {
        self.carColor = colorToSet
        return self
    }
    
    /// установить количество сидений
    /// - Parameter seatsNumber: количество сидений
    /// - Returns: экземпляр билдера
    func setSeatsAmount(seatsNumber: Int) -> Builder {
        self.numberOfSeats = seatsNumber
        return self
    }
    
    /// Построить экземпляр автомобиля
    /// - Returns: экземпляр автомобиля
    func build() -> Car {
        Car(type: carType, color: carColor, numberOfSeats: numberOfSeats)
    }
}

let customCar: Car = CarBuilder().setCarColor(color: .RED)
    .setCarType(carType: .Electric)
    .setSeatsAmount(seatsNumber: 2)
    .build()


// Фабрика


/// Протокол фабрики для создания автомобилей
protocol Factory {
    /// Создать электромобиль
    /// - Parameter color: цвет автомобиля
    func createElectricCar(color: PredefinedCarColor) -> Car
    
    /// Создать автомобиль с бензиновым двигателем
    /// - Parameter color: цвет автомобиля
    func createGasCar(color: PredefinedCarColor) -> Car
}

/// Фабрика для создания спортивных автомобилей
class SportCarFactory: Factory {
    func createElectricCar(color: PredefinedCarColor) -> Car {
        Car(type: .Electric, color: color, numberOfSeats: 2)
    }
    
    func createGasCar(color: PredefinedCarColor) -> Car {
        Car(type: .Gas, color: color, numberOfSeats: 2)
    }
}

/// Фабрика для создания автобусов (много мест)
class BusFactory: Factory {
    func createElectricCar(color: PredefinedCarColor) -> Car {
        Car(type: .Electric, color: color, numberOfSeats: 42)
    }
    
    func createGasCar(color: PredefinedCarColor) -> Car {
        Car(type: .Gas, color: color, numberOfSeats: 42)
    }
}

// Абстрактная фабрика

protocol AbstractFactory {
    
    func createDuck() -> AbstractDuck
    func createGoose() -> AbstractGoose
}

protocol AbstractDuck {
    
    func makeSound() -> String
}

class BuddyDuck: AbstractDuck {
    func makeSound() -> String {
        "Yo bro"
    }
}


class LakeDuck: AbstractDuck {
    func makeSound() -> String {
        "Quack"
    }
}

protocol AbstractGoose {
    
    func bringPain() -> String
}

class KneeGoose: AbstractGoose {
    
    func bringPain() -> String {
        "bite knees"
    }
}

class HandGoose: AbstractGoose {
    func bringPain() -> String {
        "bite hands"
    }
}

class ConcreteBirdsFactory: AbstractFactory {
    func createDuck() -> AbstractDuck {
        BuddyDuck()
    }
    
    func createGoose() -> AbstractGoose {
        KneeGoose()
    }
}

class ConcreteBirds2Factory: AbstractFactory {
    func createDuck() -> AbstractDuck {
        LakeDuck()
    }
    
    func createGoose() -> AbstractGoose {
        HandGoose()
    }
}
