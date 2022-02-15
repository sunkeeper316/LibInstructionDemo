
import Foundation
import UIKit

class CustomUILabel : UILabel {
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.numberOfLines = 1
        self.adjustsFontSizeToFitWidth = true
    }
    override func reloadInputViews() {
        
    }
    
}
class CustomUILabelRadius : UILabel {
    
    override func layoutSubviews() {
//        print("CustomUILabelRadius layoutSubviews")
        super.layoutSubviews()
        self.numberOfLines = 1
        self.adjustsFontSizeToFitWidth = true
        self.setRadius()
//        self.setRadius(radius: 15)
    }
    override func reloadInputViews() {
        
    }
    
}
