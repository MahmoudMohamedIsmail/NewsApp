//
//  String+.swift


import UIKit

extension String {
    
    public var trimo: String {
        return self.trimmingCharacters(in: .whitespacesAndNewlines)
    }
    
    func convertTo(format outputFormat: DateAndTimeFormat = .yyyyMMddMDash, inputFormat: DateAndTimeFormat = .UTC, localIdentifier: String = "en_US_POSIX")->String{
        
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: localIdentifier)
        dateFormatter.dateFormat = inputFormat.rawValue
        
        guard  let date = dateFormatter.date(from: self) else {
            return ""
        }
        
        dateFormatter.dateFormat = outputFormat.rawValue
        return dateFormatter.string(from: date)
    }
}
