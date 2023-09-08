//
//  CardDetail.swift
//  itau-clone
//
//  Created by LUCAS on 06/09/23.
//

import SwiftUI

struct TopBorder: Shape {
  func path(in rect: CGRect) -> Path {
    var path = Path()
    path.move(to: CGPoint(x: rect.maxX, y: rect.minY))
    path.addLine(to: CGPoint(x: rect.minX, y: rect.minY))
    return path
  }
}

struct CreditCardDetail: View {
  var card: Card
  
  @State var isExpanded: Bool = false
  
  var body: some View {
    VStack(alignment: .leading, spacing: 15) {
      HStack {
        Text(card.name)
          .font(.headline)
          .fontWeight(.semibold)
          .lineLimit(2)
        Spacer()
        Button {
          isExpanded = !isExpanded
        } label: {
          Text(isExpanded ? "ocultar" : "expandir")
            .font(.subheadline)
            .foregroundColor(Color("grey"))
          Image(systemName: isExpanded ? "chevron.up" : "chevron.down")
            .font(.caption)
            .foregroundColor(Color("primary"))
        }
      }
      .padding(.top, 15)
      HStack {
        Image(card.flag)
        Text("final \(card.last4Digits)")
          .foregroundColor(Color("dark-grey"))
      }
      Divider()
        .frame(height: 1)
        .background(Color("line"))
      isExpanded ? (
        VStack(spacing: 30) {
          VStack(spacing: 15) {
            HStack {
              Text("limite utilizado")
                .foregroundColor(Color("dark-grey"))
                .font(.system(size: 16))
              Spacer()
              Text("disponível")
                .foregroundColor(Color("dark-grey"))
                .font(.system(size: 16))
            }
            ProgressView(value: card.usedLimit, total: card.availableLimit)
              .tint(Color("primary"))
              .scaleEffect(x: 1, y: 5, anchor: .center)
              .frame(height: 9)
              .clipShape(RoundedRectangle(cornerRadius: 5))
            HStack {
              Text("R$ \(currencyFormatter(number: card.usedLimit))")
                .fontWeight(.medium)
                .font(.system(size: 15))
              Spacer()
              Text("R$ \(currencyFormatter(number: card.availableLimit))")
                .fontWeight(.medium)
                .font(.system(size: 15))
            }
          }
          Divider()
            .frame(height: 1)
            .background(Color("line"))
          VStack(spacing: 30) {
            VStack(alignment: .leading, spacing: 5) {
              HStack {
                Text("fatura aberta")
                  .font(.system(size: 18))
                  .fontWeight(.medium)
                  .foregroundColor(Color("dark-grey"))
                Spacer()
                Text("venc. 06 de out.")
                  .font(.system(size: 16))
                  .fontWeight(.medium)
                  .foregroundColor(Color("dark-grey"))
              }
              Text("R$ \(currencyFormatter(number: card.usedLimit))")
                .font(.system(size: 24))
                .fontWeight(.semibold)
            }
            HStack {
              Image(systemName: "calendar")
                .font(.system(size: 22))
              Spacer()
              Text("compras a partir do dia 29 estarão na próxima fatura")
                .font(.system(size: 16))
                .fontWeight(.light)
                .lineLimit(2)
            }
          }
          Divider()
            .frame(height: 1)
            .background(Color("line"))
        }
        .padding(.top, 15)
      ) : nil
      HStack(spacing: 20) {
        Button {} label: {
          Text("ver fatura")
            .foregroundColor(Color("blue"))
            .fontWeight(.medium)
        }
        Button {} label: {
          Text("cartão virtual")
            .foregroundColor(Color("blue"))
            .fontWeight(.medium)
        }
      }
    }
    .frame(width: UIScreen.main.bounds.width - (35 * 2), alignment: .topLeading)
    .padding()
    .background(.white)
    .overlay(TopBorder().stroke(card.color, lineWidth: 15))
    .cornerRadius(5)
  }
}

struct CreditCardDetail_Previews: PreviewProvider {
  static var previews: some View {
    CreditCardDetail(card: cardsData[0])
  }
}
