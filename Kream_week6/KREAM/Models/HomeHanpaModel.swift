
import UIKit
struct HomeHanpaModel{
    let image: UIImage
    let ig: String
}

extension HomeHanpaModel{
    static func HomeHanpaDummy()-> [HomeHanpaModel]{
        return [ HomeHanpaModel(image: .karina,ig: "@katarinabluu"),
                 HomeHanpaModel(image: .winter,ig: "@imwinter"),
                 HomeHanpaModel(image: .karina,ig: "@katarinabluu")
                ]
    }
    
}
