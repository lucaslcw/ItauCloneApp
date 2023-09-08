//
//  CardDetail.swift
//  itau-clone
//
//  Created by LUCAS on 06/09/23.
//

import SwiftUI

struct CardDetail: View {
  var title: String
  var buttonAction: () -> Void
  var buttonTitle: String = "ver mais"
  
  var body: some View {
    VStack(alignment: .leading, spacing: 20) {
      HStack {
        Text(title)
          .font(.title)
          .fontWeight(.thin)
        Spacer()
        Button {} label: {
          Text("expandir")
            .font(.subheadline)
            .foregroundColor(Color("grey"))
          Image(systemName: "chevron.down")
            .font(.caption)
            .foregroundColor(Color("primary"))
        }
      }
      Divider()
        .frame(height: 1)
        .background(Color("border"))
      Button {
        buttonAction()
      } label: {
        Text(buttonTitle)
          .foregroundColor(Color("blue"))
          .fontWeight(.medium)
      }
    }
    .padding()
    .frame(maxWidth: .infinity, alignment: .topLeading)
    .background(.white)
    .cornerRadius(5)
  }
}

struct CardDetail_Previews: PreviewProvider {
  static var previews: some View {
    CardDetail(title: "crédito", buttonAction: {})
  }
}
