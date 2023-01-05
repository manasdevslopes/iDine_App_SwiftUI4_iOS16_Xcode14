//
//  iDine.swift
//  iDine
//
//  Created by MANAS VIJAYWARGIYA on 05/01/23.
//

import SwiftUI

struct iDine: View {
  let menu = Bundle.main.decode([MenuSection].self, from: "menu.json")
  
  var body: some View {
    NavigationStack {
      List {
        ForEach(menu) { section in
          Section(section.name) {
            ForEach(section.items) { item in
              NavigationLink(value: item) {
                ItemRow(item: item)
              }
            }
          }
        }
      }
      .navigationDestination(for: MenuItem.self) { item in
        ItemDetail(item: item)
      }
      .navigationTitle("Menu")
      .listStyle(.grouped)
    }
  }
}

struct iDine_Previews: PreviewProvider {
  static var previews: some View {
    iDine()
  }
}
