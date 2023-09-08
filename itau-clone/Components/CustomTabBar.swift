//
//  CustomTabBar.swift
//  itau-clone
//
//  Created by LUCAS on 07/09/23.
//

import SwiftUI

enum Tab: String, CaseIterable {
  case house
  case extract
  case transactions
  case products
  case help
}

struct CustomTabBar: View {
  @Binding var selectedTab: Tab
  
  let tabs: [TabBarItem] = [
    TabBarItem(iconName: "house", title: "início", link: Tab.house),
    TabBarItem(iconName: "list.bullet", title: "extrato", link: Tab.extract),
    TabBarItem(iconName: "dollarsign", title: "transações", link: Tab.transactions),
    TabBarItem(iconName: "square.grid.3x2", title: "produtos", link: Tab.products),
    TabBarItem(iconName: "questionmark.circle", title: "ajuda", link: Tab.help)
  ]
  
  var body: some View {
    HStack(spacing: 0) {
      ForEach(tabs, id: \.self) { tab in
        tabView(tab: tab)
      }
    }
    .frame(maxWidth: .infinity)
    .padding(.top, 10)
    .background(.white)
    .overlay(
      Divider()
        .frame(maxWidth: .infinity, maxHeight: 1)
        .background(Color("border")),
      alignment: .top
    )
  }
}

struct CustomTabBar_Previews: PreviewProvider {  
  static var previews: some View {
    CustomTabBar(selectedTab: .constant(.house))
  }
}

extension CustomTabBar {
  private func tabView(tab: TabBarItem) -> some View {
    VStack {
      VStack {
        ZStack {
          tab.link == selectedTab
            ? RoundedRectangle(cornerRadius: 5)
                .fill(Color("primary"))
                .frame(width: 45, height: 45)
            : nil
          Image(systemName: tab.iconName)
            .font(.title2)
            .foregroundColor(tab.link == selectedTab ? .white : Color("primary"))
        }
      }
      .frame(height: 25)
      tab.link != selectedTab
        ? Text(tab.title)
            .font(.system(size: 14))
            .foregroundColor(.black)
        : nil
    }
    .frame(width: UIScreen.main.bounds.width / CGFloat(tabs.count))
    .onTapGesture {
      selectedTab = tab.link
    }
  }
}

struct TabBarItem: Hashable {
  let iconName: String
  let title: String
  let link: Tab
}
