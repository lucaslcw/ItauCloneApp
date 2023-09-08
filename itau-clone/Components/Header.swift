//
//  Header.swift
//  itau-clone
//
//  Created by LUCAS on 06/09/23.
//

import SwiftUI

struct Header: View {
  var name: String
  
  var body: some View {
    HStack(spacing: 10) {
      Image("avatar-placeholder")
        .resizable()
        .frame(width: 40, height: 40)
        .clipped()
        .clipShape(Circle())
      Text(name)
        .foregroundColor(.white)
        .fontWeight(.semibold)
        .font(.title3)
      Button(action: {}) {
        Image(systemName: "chevron.down")
          .foregroundColor(.white)
          .font(.callout)
      }
      Spacer()
      HStack(spacing: 15) {
        Button(action: {}) {
          Image(systemName: "magnifyingglass")
            .foregroundColor(.white)
            .font(.title2)
        }
        Button (action: {}) {
          Image(systemName: "bell")
            .foregroundColor(.white)
            .font(.title2)
        }
      }
    }
    .background(Color("primary"))
  }
}

struct Header_Previews: PreviewProvider {
  static var previews: some View {
    Header(name: "Lucas")
  }
}
