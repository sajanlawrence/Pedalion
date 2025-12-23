//
//  Double.swift
//  Pedalion
//
//  Created by Sajan Lawrence on 23/12/25.
//

import Foundation

extension Double {
    func toCurrencyString(
        locale: Locale = Locale(identifier: "en_US"),
        currencyCode: String = "USD"
    ) -> String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        formatter.locale = locale
        formatter.currencyCode = currencyCode
        return formatter.string(from: NSNumber(value: self)) ?? "$0.00"
    }
    
    func toPercentage() -> String {
        return String(self) + "%"
    }
}
