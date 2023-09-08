//
//  CurrencyFormatter.swift
//  itau-clone
//
//  Created by LUCAS on 06/09/23.
//

import Foundation

func currencyFormatter(number: Double) -> String {
  let formatter = NumberFormatter()
  formatter.locale = Locale(identifier: "pt_BR")
  formatter.numberStyle = .decimal
  formatter.minimumFractionDigits = 2
  formatter.maximumFractionDigits = 2
  
  if let formattedString = formatter.string(from: NSNumber(value: number)) {
    return formattedString
  } else {
    return ""
  }
}
