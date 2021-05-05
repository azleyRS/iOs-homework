import UIKit

// MARK: - Задача 2
// Реализовать базовый протокол для контейнеров. Контейнер должны отвечать сколько они содержать элементов, добавлять новые элементы и возвращать элемент
// по индексу. На основе базового контейнера надо реализовать универсальный связный список и универсальную очередь (FIFO) в виде структур.

protocol Container {
    associatedtype Item
    var count: Int { get }
    mutating func add(_ item: Item)
    subscript(i: Int) -> Item? { get }
}

class Node<T> {
    var value: T
    var nextNode: Node?
    
    init(value: T, nextNode: Node?) {
        self.value = value
        self.nextNode = nextNode
    }
}

struct LinkedList<T> {
    var firstNode: Node<T>
}

extension LinkedList: Container {

    var count: Int {
        var counter = 1
        var node: Node? = firstNode
        while node?.nextNode != nil {
            counter += 1
            node = node?.nextNode
        }
        
        return counter
    }
    
    func add(_ item: Node<T>) {
        var node: Node? = firstNode
        while node?.nextNode != nil {
            node = node?.nextNode
        }
        
        node?.nextNode = item
    }
    
    subscript(i: Int) -> Item? {
        
        if i == 0 { return firstNode }
        
        var counter = 0
        var node: Node? = firstNode
        var searchNode: Node<T>?

        while node?.nextNode != nil {
            counter += 1
            node = node?.nextNode
            
            if counter == i {
                searchNode = node
                break
            }
        }
    
        return searchNode
    }
}

let testList = LinkedList(firstNode: Node(value: 42, nextNode: nil))
print(testList.count)
print(testList[0])
testList.add(Node(value: 123, nextNode: Node(value: 33, nextNode: Node(value: 1, nextNode: nil))))
print(testList.count)
print(testList[1])

struct Queue<T> {
    private var elements = [T]()
    
    mutating func push(_ element: T) {
        elements.append(element)
    }
    
    mutating func pop() -> T {
        return elements.removeFirst()
    }
}

extension Queue: Container {
    
    typealias Item = T
        
    var count: Int {
        return elements.count
    }
    
    mutating func add(_ item: Item) {
        push(item)
    }
    
    subscript(i: Int) -> Item? {
        if elements.indices.contains(i) {
            return elements[i]
        } else {
            return nil
        }
    }
}

var testQueue = Queue<Int>()
testQueue.push(22)
testQueue.add(42)
print(testQueue.count)
testQueue.pop()
print(testQueue.count)
if let res = testQueue[0] {
    print(res)
}
