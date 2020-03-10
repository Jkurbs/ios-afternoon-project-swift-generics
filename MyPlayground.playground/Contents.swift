import UIKit

struct CountedSet<Element: Hashable>: ExpressibleByArrayLiteral {
 
    private(set) var elements = [Element]()
    
    typealias ArrayLiteralElement = Element
    
    init(arrayLiteral: ArrayLiteralElement...) {
        self.elements = arrayLiteral
    }
    
    mutating func insert(element: Element) {
        elements.append(element)
    }
    
    mutating func remove(_ element: Element) -> Int? {
        guard let index = elements.firstIndex(of: element) else { return 0 }
        elements.remove(at: index)
        let count = elements.filter({$0 == element}).count
        return count
    }
    
    func count() -> [Element] {
        return Array(NSOrderedSet(array: elements)) as! [Element]
    }
}

extension CountedSet {

    subscript(_ member: Element) -> Int {
        let count = elements.filter({$0 == member}).count
        return count
    }
}



enum Arrow { case iron, wooden, elven, dwarvish, magic, silver }
var aCountedSet = CountedSet<Arrow>()
aCountedSet[.iron] // 0
var myCountedSet: CountedSet<Arrow> = [.iron, .magic, .iron, .silver, .iron, .iron]
myCountedSet[.iron] // 4
myCountedSet.remove(.iron) // 3
myCountedSet.remove(.dwarvish) // 0
myCountedSet.remove(.magic) // 0


