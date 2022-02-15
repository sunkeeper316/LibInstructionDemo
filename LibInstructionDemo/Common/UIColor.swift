
import UIKit
import Foundation

extension UIColor {
    
    
    public static let blueGradualColor : [CGColor] = [UIColor(hex: "#003595ff")!.cgColor,UIColor(hex: "#00c1deff")!.cgColor]
    public static let grayGradualColor : [CGColor] = [UIColor(hex: "#b3b3b4ff")!.cgColor,UIColor(hex: "#595757ff")!.cgColor]
    public static let redGradualColor : [CGColor] = [UIColor(hex: "#ff0d23ff")!.cgColor,UIColor(hex: "#231815ff")!.cgColor]
    public static let redblackGradualColor : [CGColor] = [UIColor(hex: "#ff0d23ff")!.cgColor,UIColor(hex: "#23181500")!.cgColor]
    public static let blackColor = UIColor(hex: "#000000ff")!
    public static let darkGrayColor = UIColor(hex: "#595757FF")! //word
    public static let lightGrayColor = UIColor(hex: "#9e9e9fff")! //框線未選
    public static let lightGrayColor2 = UIColor(hex: "#76CAECff")! //框線已選
    public static let whiteColor2 = UIColor(hex: "#D1EBF3ff")! //底色 已選
    public static let textFieldBColor = UIColor(hex: "#F7F7F7ff")! //輸入框底色 已選
    
    public static let disableColor = UIColor(hex: "#DBDCDCFF")! // button disable
    public static let disableColorBorder = UIColor(hex: "#888888FF")! // button disable
    
    public static let backColor = UIColor(hex: "#555455FF")! //word
        
    public static let grayColor = UIColor(hex: "#4c4b4cff")!
    public static let grayColor2 = UIColor(hex: "#F2F4F6ff")!
    public static let grayColor3 = UIColor(hex: "#EEEEEFff")!
    public static let grayColor4 = UIColor(hex: "#9E9E9Fff")!
    
    public static let greenColor = UIColor(hex: "#00c08bff")!
    public static let orangeColor = UIColor(hex: "#e68f12ff")!
    public static let blueColor = UIColor(hex: "#004488ff")! //上方 bar 顏色
    public static let lightBlueColor = UIColor(hex: "#4283BCff")! //淡藍色 顏色
    public static let lightBlueColor2 = UIColor(hex: "#B3DDFFff")! //淡藍色 顏色
    public static let lightBlueColor3 = UIColor(hex: "#EEF8FFff")! //淡藍色 顏色
//    F2F4F6
    public static let highColor = UIColor(hex: "#dc2527ff")!
    public static let normalColor = UIColor(hex: "#00c08bff")!
    public static let lowColor = UIColor(hex: "#00c1deff")!
    
    public convenience init?(hex: String) {
        let r, g, b, a: CGFloat

        if hex.hasPrefix("#") {
            let start = hex.index(hex.startIndex, offsetBy: 1)
            let hexColor = String(hex[start...])

            if hexColor.count == 8 {
                let scanner = Scanner(string: hexColor)
                var hexNumber: UInt64 = 0

                if scanner.scanHexInt64(&hexNumber) {
                    r = CGFloat((hexNumber & 0xff000000) >> 24) / 255
                    g = CGFloat((hexNumber & 0x00ff0000) >> 16) / 255
                    b = CGFloat((hexNumber & 0x0000ff00) >> 8) / 255
                    a = CGFloat(hexNumber & 0x000000ff) / 255
//                    print("r\(CGFloat((hexNumber & 0xff000000) >> 24))")
//                    print("g\(CGFloat((hexNumber & 0x00ff0000) >> 16))")
//                    print("b\(CGFloat((hexNumber & 0x0000ff00) >> 8))")
                    self.init(red: r, green: g, blue: b, alpha: a)
                    return
                }
            }
        }

        return nil
    }
    func toHexString() -> String {
            var r:CGFloat = 0
            var g:CGFloat = 0
            var b:CGFloat = 0
            var a:CGFloat = 0
            getRed(&r, green: &g, blue: &b, alpha: &a)
            let rgb:Int = (Int)(r*255)<<16 | (Int)(g*255)<<8 | (Int)(b*255)<<0
            return String(format:"#%06x", rgb)
        }
}
