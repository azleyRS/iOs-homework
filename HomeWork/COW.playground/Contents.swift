import UIKit

// Реализовать COW в своей структуре со свойством reference type (isKnownUniquelReferenced)

class Person {
    var name: String

    init(name: String) {
        self.name = name
    }
}

struct PersonStruct {
    private var ref: Person

    init(name: String) {
        ref = Person(name: name)
    }

    var name: String {
        get { return ref.name}
        set {
            if (!isKnownUniquelyReferenced(&ref)) {
                ref = Person(name: newValue)
                return
            }
            ref.name = newValue
        }
    }
}

var personTest = PersonStruct(name: "NAME 1")
print(personTest.name)
var personTest2 = personTest
print(personTest2.name)
personTest2.name = "SomeNew Name"
print(personTest.name)
print(personTest2.name)
