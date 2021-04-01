//
//  ContentView.swift
//  health-app
//
//  Created by 里見健太 on 2021/04/01.
//

import SwiftUI

struct ContentView: View {
    @State var isAuthenticated = true;
    var body: some View {
        if isAuthenticated {
            TabViewLayout()
        } else {
            SigninView()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
