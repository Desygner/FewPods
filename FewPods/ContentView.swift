//
//  ContentView.swift
//  FewPods
//
//  Created by alex on 5/12/19.
//  Copyright © 2019 Hecktek. All rights reserved.
//

import SwiftUI
import TwitterKit

struct ContentView: View {
    var body: some View {
        Text("Hello, World!")
    }
}

func hello() {
    let a = TWTRTwitter.sharedInstance()
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
