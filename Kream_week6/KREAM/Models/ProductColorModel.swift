
import UIKit
struct ProductColorModel{
    let image: UIImage
}

extension ProductColorModel{
    static func ProductColorDummy()-> [ProductColorModel]{
        return [ ProductColorModel(image: .karina),
                 ProductColorModel(image: .winter),
                 ProductColorModel(image: .karina)
                ]
    }
    
}
