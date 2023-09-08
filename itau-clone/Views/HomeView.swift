//
//  HomeView.swift
//  itau-clone
//
//  Created by LUCAS on 07/09/23.
//

import SwiftUI

struct HomeView: View {
  var body: some View {
    ZStack {
      ScrollView(showsIndicators: false) {
        VStack(spacing: 0) {
          VStack {
            Header(name: "Lucas")
              .padding(.bottom, 15)
            Balance(balanceAvailable: 9.23, overdraftAvailable: 100)
          }
          .frame(maxWidth: .infinity, alignment: .leading)
          .padding([.bottom, .leading, .trailing])
          .padding(.top, 50)
          .background(Color("primary"))
          
          ScrollView(.horizontal, showsIndicators: false) {
            HStack(alignment: .top, spacing: 20) {
              ShortcutButton(icon: "cart", label: "Itaú Shop", action: {}, isHighlight: true)
              ShortcutButton(icon: "dollarsign", label: "Pix", action: {})
              ShortcutButton(icon: "barcode", label: "pagar conta", action: {})
              ShortcutButton(icon: "arrow.left.arrow.right", label: "fazer\ntransferências", action: {})
              ShortcutButton(icon: "plus", label: "personalizar\natalhos", action: {}, isCustomize: true)
            }
          }
          .padding()
        }
        .background(.white)
        
        VStack {
          ScrollView(.horizontal, showsIndicators: false) {
            HStack(alignment: .top, spacing: 15) {
              ForEach(cardsData) { card in
                CreditCardDetail(card: card)
              }
            }
            .padding(.horizontal, 15)
          }
          
          VStack(spacing: 15) {
            CardDetail(title: "crédito", buttonAction: {})
            CardDetail(title: "organize suas finanças", buttonAction: {}, buttonTitle: "ver contratos")
            CardDetail(title: "meus\ninvestimentos", buttonAction: {}, buttonTitle: "ver detalhes")
            CardDetail(title: "seguros", buttonAction: {})
          }
          .padding([.horizontal])
          .padding([.vertical])
        }
        .padding([.top, .bottom])
        .frame(maxWidth: .infinity)
      }
      .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
      .background(Color("background"))
      .edgesIgnoringSafeArea(.all)
    }
  }
}

struct HomeView_Previews: PreviewProvider {
  static var previews: some View {
    HomeView()
  }
}
