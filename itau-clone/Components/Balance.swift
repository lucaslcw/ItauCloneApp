//
//  Balance.swift
//  itau-clone
//
//  Created by LUCAS on 06/09/23.
//

import SwiftUI
import SkeletonUI

struct Balance: View {
  var balanceAvailable: Double
  var overdraftAvailable: Double
  
  @State private var balanceIsVisible: Bool = false
  @State private var balanceIsLoading: Bool = false
  
  var body: some View {
    VStack(alignment: .leading) {
      Button {
        balanceIsVisible = !balanceIsVisible
      } label: {
        Image(systemName: !balanceIsVisible ? "eye" : "eye.slash")
          .foregroundColor(.white)
          .font(.subheadline)
        Text("saldo em conta")
          .foregroundColor(.white)
          .font(.subheadline)
          .fontWeight(.medium)
      }
      .padding(.bottom, 10)
      HStack {
        HStack(spacing: 5) {
          Text("R$")
            .font(.title)
            .fontWeight(.bold)
            .foregroundColor(.white)
          Text(balanceIsVisible ? currencyFormatter(number: balanceAvailable) : "••••")
            .skeleton(
              with: balanceIsLoading,
              size: CGSize(width: 100, height: 30),
              animation: .pulse(),
              shape: .rounded(.radius(5)),
              lines: 1
            )
            .font(.title)
            .fontWeight(.bold)
            .foregroundColor(.white)
        }
        Spacer()
        balanceIsVisible ? (
          Button {
            balanceIsLoading = true
            DispatchQueue.global().asyncAfter(deadline: .now() + 3) {
              balanceIsLoading = false
            }
          } label: {
            Image(systemName: "arrow.clockwise")
              .foregroundColor(.white)
              .font(.system(size: 16))
          }
        ) : nil
      }
        .padding(.bottom, 10)
      Divider()
        .frame(height: 1)
        .background(.white)
      HStack {
        HStack(spacing: 5) {
          Text("limite da conta disponível R$")
            .foregroundColor(.white)
            .font(.subheadline)
            .fontWeight(.medium)
          Text(balanceIsVisible ? currencyFormatter(number: overdraftAvailable) : "••••")
            .skeleton(
              with: balanceIsLoading,
              size: CGSize(width: 50, height: 17),
              animation: .pulse(),
              shape: .rounded(.radius(5)),
              lines: 1
            )
            .foregroundColor(.white)
            .font(.subheadline)
            .fontWeight(.medium)
        }
        Spacer()
        Image(systemName: "chevron.right")
          .foregroundColor(.white)
          .font(.subheadline)
      }
      .padding(.top, 10)
    }
    .frame(maxWidth: .infinity, alignment: .topLeading)
    .padding()
    .background(Color("secondary"))
    .cornerRadius(10)
  }
}

struct Balance_Previews: PreviewProvider {
  static var previews: some View {
    Balance(balanceAvailable: 92834, overdraftAvailable: 8300)
  }
}
