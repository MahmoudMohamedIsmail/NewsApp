//
//  Date+Extension.swift

import Foundation

enum DateAndTimeFormat: String{
    case UTC = "yyyy-MM-dd'T'HH:mm:ss'Z'" //2021-07-15T14:31:30Z
    case MMddyyyySlash = "MM/dd/yyyy" //2021/07/15
    case MMddyyyyDash = "MM-dd-yyyy" //2021-07-15
    case yyyyMMddMDash = "yyyy-MM-dd"
}

extension Date{
    
    func convertToString(toFormat : String = DateAndTimeFormat.yyyyMMddMDash.rawValue) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = toFormat
        return dateFormatter.string(from: self)
    }
    
}
