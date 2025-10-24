import UIKit

protocol Resizable {
    var width: Float { get set }
    var height: Float { get set }
        
    init(width: Float, height: Float)
        
    func resizeBy(wFactor: Float,
    hFactor: Float)
}


class Rectangle: Resizable, CustomStringConvertible {
    
    var width: Float
    var height: Float

    var description: String { // Computed Variable
        return "Rectangle: width \(width), height \(height)"
    }
    
    required init(width: Float, height: Float) {
        self.width = width
        self.height = height
    }
    func resizeBy(wFactor: Float, hFactor: Float) {
        width *= wFactor
        height *= hFactor
    }
}


let rect = Rectangle(width: 10, height: 20)
rect.resizeBy(wFactor: 2, hFactor: 3)
print(rect)



