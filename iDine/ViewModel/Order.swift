//
//  Order.swift
//  iDine
//
//  Created by MANAS VIJAYWARGIYA on 05/01/23.
//

import SwiftUI

class Order: ObservableObject {
  @Published var items = [MenuItem]()
  
  var total: Int {
    if items.count > 0 {
      return items.reduce(0) { $0 + $1.price }
    } else {
      return 0
    }
  }
  
  func add(item: MenuItem) {
    items.append(item)
  }
  
  func remove(item: MenuItem) {
    if let index = items.firstIndex(of: item) {
      items.remove(at: index)
    }
  }
}
