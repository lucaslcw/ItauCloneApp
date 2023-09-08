//
//  ContentView.swift
//  itau-clone
//
//  Created by LUCAS on 05/09/23.
//

import SwiftUI

struct ContentView: View {
  @State private var selectedTab: Tab = .house
  
  var body: some View {
    VStack(spacing: 0) {
      switch selectedTab {
        case .house:
          HomeView()
        case .extract:
          HomeView()
        case .transactions:
          HomeView()
        case .products:
          HomeView()
        case .help:
          HomeView()
      }
      CustomTabBar(selectedTab: $selectedTab)
    }
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
