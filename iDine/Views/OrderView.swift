//
//  OrderView.swift
//  iDine
//
//  Created by MANAS VIJAYWARGIYA on 05/01/23.
//

import SwiftUI

struct OrderView: View {
  @EnvironmentObject var order: Order
  
  var body: some View {
    NavigationStack {
      List {
        Section {
          ForEach(order.items) { item in
            HStack {
              Text(item.name)
              Spacer()
              Text("$\(item.price)")
            }
          }
          .onDelete(perform: deleteItems)
        }
        
        Section {
          NavigationLink("Place Order") {
            CheckoutView()
          }
        }
        .disabled(order.items.isEmpty)
      }
      .navigationTitle("Order")
      .toolbar {
        EditButton()
      }
    }
  }
  
  func deleteItems(at offsets: IndexSet) {
    order.items.remove(atOffsets: offsets)
  }
}

struct OrderView_Previews: PreviewProvider {
  static var previews: some View {
    NavigationStack {
      OrderView()
        .environmentObject(Order())
    }
  }
}
