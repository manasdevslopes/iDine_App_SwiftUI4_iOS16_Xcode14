//
//  iDineApp.swift
//  iDine
//
//  Created by MANAS VIJAYWARGIYA on 05/01/23.
//

import SwiftUI

@main
struct iDineApp: App {
  @StateObject var order = Order()
  
  var body: some Scene {
    WindowGroup {
      MainView()
        .environmentObject(order)
    }
  }
}
