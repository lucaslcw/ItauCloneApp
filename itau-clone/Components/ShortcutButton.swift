//
//  ShortcutButton.swift
//  itau-clone
//
//  Created by LUCAS on 06/09/23.
//

import SwiftUI

struct ShortcutButton: View {
  var icon: String
  var label: String
  var action: () -> Void
  var isHighlight: Bool = false
  var isCustomize: Bool = false
  
  var body: some View {
    Button(action: {}, label: {
      VStack {
        VStack {
          Image(systemName: icon)
            .foregroundColor(isHighlight ? .white : Color(isCustomize ? "blue" : "primary"))
            .font(.title2)
        }
        .frame(width: 55, height: 55)
        .background(
          RoundedRectangle(cornerRadius: 10, style: .continuous)
            .fill(isHighlight ? Color("blue") : .white)
        )
        .overlay(
          RoundedRectangle(cornerRadius: 10, style: .continuous)
            .strokeBorder(Color(isHighlight ? "blue" : "border"), lineWidth: 1)
        )
        Text(label)
          .foregroundColor(.black)
          .font(.system(size: 14))
      }
    })
  }
}

struct ShortcutButton_Previews: PreviewProvider {
  static var previews: some View {
    ShortcutButton(icon: "cart", label: "Itaú Shop", action: {}, isHighlight: true)
  }
}
