import UIKit

// MARK: - Direct dispatch
class DirectDispatch {
}

extension DirectDispatch {
    func doSomething() {
        print("DirectDispatch")
    }
}


// MARK: - Virtual table
class VirtualTable {
    func doSomething() {
        print("VirtualTable")
    }
}

class VirtualTableChild : VirtualTable {
    override func doSomething() {
        print("VirtualTableChild")
    }
    
    func doSomething2() {
        print("doSomething2")
    }
}


// MARK: - Witness table
protocol WitnessTableProtocol {
    func doSomething()
}

class WitnessTable : WitnessTableProtocol {
    func doSomething() {
        print("doSomething")
    }
}


// MARK: - Message dispatch
@objcMembers
class MessageDispatch : NSObject {
    dynamic func doSomething() {
        print("MessageDispatch")
    }
}

@objcMembers
class MessageDispatchChild : MessageDispatch {
    override dynamic func sayHello() {
        print("MessageDispatchChild")
    }
}
