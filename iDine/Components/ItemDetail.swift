//
//  ItemDetail.swift
//  iDine
//
//  Created by MANAS VIJAYWARGIYA on 05/01/23.
//

import SwiftUI

struct ItemDetail: View {
  let item: MenuItem
  
  @EnvironmentObject var order: Order
  
  var body: some View {
    VStack {
      ZStack(alignment: .bottomTrailing) {
        Image(item.mainImage)
          .resizable()
          .scaledToFit()
        
        Text("Photo: \(item.photoCredit)")
          .padding(4)
          .background(Color.black)
          .font(.caption)
          .foregroundColor(.white)
          .offset(x: -5, y: -5)
      }
      
      Text(item.description)
        .padding()
      
      Button("Order This") {
        order.add(item: item)
      }
      .buttonStyle(.borderedProminent)
      
      Spacer()
      
    }
    .navigationTitle(item.name)
    .navigationBarTitleDisplayMode(.inline)
  }
}

struct ItemDetail_Previews: PreviewProvider {
  static var previews: some View {
    NavigationStack {
      ItemDetail(item: MenuItem.example)
        .environmentObject(Order())
    }
  }
}
