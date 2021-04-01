//
//  Tab.swift
//  health-app
//
//  Created by 里見健太 on 2021/04/01.
//

import SwiftUI

struct TabViewLayout: View {
    var body: some View {
        TabView{
            HomeView()
                .tabItem {
                    VStack {
                        Image(systemName: "house")
                        Text("Home")
                    }
                }
                .tag(1)
            SettingView()
                .tabItem {
                    VStack {
                        Image(systemName: "person.crop.circle.fill")
                        Text("Setting")
                    }
                }
                .tag(2)
        }
    }
}

struct Tab_Previews: PreviewProvider {
    static var previews: some View {
        TabViewLayout()
    }
}
