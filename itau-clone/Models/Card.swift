//
//  Card.swift
//  itau-clone
//
//  Created by LUCAS on 06/09/23.
//

import Foundation
import SwiftUI

struct Card: Identifiable {
  var id: UUID
  var name: String
  var flag: String
  var last4Digits: String
  var color: Color
  var availableLimit: Double
  var usedLimit: Double
  
  init(name: String, flag: String, availableLimit: Double, usedLimit: Double, last4Digits: String, color: Color) {
    self.id = UUID()
    self.name = name
    self.flag = flag
    self.last4Digits = last4Digits
    self.color = color
    self.availableLimit = availableLimit
    self.usedLimit = usedLimit
  }
}

var cardsData: [Card] = [
  Card(name: "Pao De Acucar Itau Visa Internacional", flag: "visa", availableLimit: 12000, usedLimit: 5739.24, last4Digits: "1234", color: Color(red: 177 / 255, green: 177 / 255, blue: 177 / 255)),
  Card(name: "Itau Visa Click", flag: "mastercard", availableLimit: 3200, usedLimit: 12.43, last4Digits: "4321", color: Color(red: 237 / 255, green: 111 / 255, blue:0 / 255))
]
