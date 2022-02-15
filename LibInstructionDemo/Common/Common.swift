import Foundation
import UIKit

let softVersion = "1.0.4"

func exponent(i: Int) -> String {
    let powers : [String] = [
      "\u{2070}",
      "\u{00B9}",
      "\u{00B2}",
      "\u{00B3}",
      "\u{2074}",
      "\u{2075}",
      "\u{2076}",
      "\u{2077}",
      "\u{2078}",
      "\u{2079}"
    ]

    let digits = Array(String(i))
    var string = ""

    for d in digits {
      string.append("\(powers[Int(String(d))!])")
    }
    return string
}

let wifiUrl = "App-prefs:WIFI"
let hotspot = "App-prefs:Hotspot"
func goToSetting(string:String) {
    if let url = URL(string:string) {
        UIApplication.shared.open(url)
//        UIApplication.shared.open(url, options: [:], completionHandler: nil)
//         if #available(iOS 10.0, *) {
//            UIApplication.shared.open(url, options: [:], completionHandler: nil)
//        } else {
//            UIApplication.shared.openURL(url)
//        }
    }
}

func getPresetDate() -> Date{
    var dateComponents = DateComponents()
    
    dateComponents.calendar = Calendar.current
    dateComponents.year = 2000
    dateComponents.month = 1
    dateComponents.day = 1
    
    return dateComponents.date!
}

////確認文字格式可以判斷email或電話等等格式
//func match(_ input: String, regular: String = "", regularEnum: Regular = .none) -> Bool {
//
//    let regular = regularEnum == .none ? regular : regularEnum.rawValue
//
//    let regex = try? NSRegularExpression(pattern: regular, options: .caseInsensitive)
//
//    if let matches = regex?.matches(in: input, range: NSMakeRange(0, input.count)) {
//        return matches.count > 0
//    } else {
//        return false
//    }
//}
//
//enum Regular: String {
//    //用户名验证（允许使用小写字母、数字、下滑线、横杠，一共3~16个字符）
//    case userName = "^[a-z0-9_-]{3,16}$",
//    eMail = "^([a-z0-9_.-]+)@([da-z.-]+).([a-z.]{2,6})$",
//    phone = "^1[0-9]{10}$",
//    url = "^(https?://)?([da-z.-]+).([a-z.]{2,6})([/w.-]*)*/?$",
//    ip = "^(?:(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?).){3}(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)$",
//    html = "^<([a-z]+)([^<]+)*(?:>(.*)</1>|s+/>)$",
//    pureNumber = "^[0-9]*$",
//    password = "^[\\x21-\\x7E]{8,16}$",
//    none = ""
//}
