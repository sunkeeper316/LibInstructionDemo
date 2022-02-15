
import Foundation
import UIKit

class CustomUIView : UIView {
    var customlayer : CAGradientLayer?
    override func layoutSubviews() {
        super.layoutSubviews()
        self.blueGradualColor()
    }
    func blueGradualColor() {
        if customlayer != nil {
            customlayer?.removeFromSuperlayer()
            customlayer = nil
        }
        customlayer = CAGradientLayer()
        customlayer?.frame = CGRect(origin: self.bounds.origin, size: CGSize(width: self.frame.width , height: self.frame.height))
        
//        customlayer?.colors = styleList[currentUIStyleIndex].lineGradualColors
        customlayer?.startPoint = CGPoint(x: 0, y: 0.5)
        customlayer?.endPoint = CGPoint(x: 1, y: 0.5)
        
        self.layer.insertSublayer(customlayer!, at: 0)
//        print("insertSublayer :\(layers?.count)")
        
    }
}
class CellUIView : UIView {
    var customlayer : CAShapeLayer?
    override func layoutSubviews() {
        super.layoutSubviews()
        self.cellView()
    }
    func cellView(){
        if customlayer == nil {
            customlayer = CAShapeLayer()
            let linepath = UIBezierPath()
            layer.frame = CGRect(origin: self.frame.origin, size: CGSize(width: self.frame.width , height: self.frame.height))
            
            linepath.move(to: CGPoint(x: self.frame.width, y: 0))
            linepath.addLine(to: CGPoint(x: self.frame.width, y: self.frame.height))
            linepath.addLine(to: CGPoint(x: self.frame.width * 2 / 3 , y: self.frame.height))
            linepath.addLine(to: CGPoint(x: self.frame.width * 2 / 3 + 20 , y: 0))
            customlayer?.path = linepath.cgPath
            customlayer?.fillColor = UIColor.grayColor.cgColor
            self.layer.insertSublayer(customlayer!, at: 0)
        }
        
//        self.layer.addSublayer(layer)
    }
    func removecustomlayer(){
        if customlayer != nil {
            customlayer?.removeFromSuperlayer()
            customlayer = nil
        }
    }
}

class DotView : UIView {
    override func layoutSubviews() {
        super.layoutSubviews()
        self.setRadius()
        self.backgroundColor = .black
    }
}

class CellUIView2 : UIView {
    override func layoutSubviews() {
        super.layoutSubviews()
        self.addBorder(width: 1, color: UIColor.blueColor.cgColor)
//        self.backgroundColor = .clear
    }
}
class CellUIViewGrayBorder : UIView {
    override func layoutSubviews() {
        super.layoutSubviews()
        
    }
    required init?(coder decoder:NSCoder) {
        super.init(coder: decoder)
//        print("init")
        self.addBorder(width: 1, color: UIColor.grayColor.cgColor)
//        self.backgroundColor = .clear
    }
}

extension UIView {
    
    func addBorder(){
        self.layer.borderWidth = 2
        self.layer.borderColor = UIColor.white.cgColor
    }
    func addBorder(width : CGFloat , color :CGColor){
        self.layer.borderWidth = width
        self.layer.borderColor = color
    }
    func addBorder(borderWidth : CGFloat , cgColor:CGColor){
        self.layer.borderWidth = borderWidth
        self.layer.borderColor = cgColor
    }
    func removeBorder(){
        self.layer.borderWidth = 0
        self.layer.borderColor = UIColor.clear.cgColor
    }
    func setRadius(){
        self.layer.masksToBounds = true
        self.layer.cornerRadius = self.bounds.width / 2.0
    }
    
    func setRadius(radius : CGFloat){
        self.layer.masksToBounds = true
        self.layer.cornerRadius = radius
    }
    
}
