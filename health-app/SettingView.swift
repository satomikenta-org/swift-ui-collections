//
//  SettingView.swift
//  health-app
//
//  Created by 里見健太 on 2021/04/01.
//


// FEATURES
//
// ・Lifecycle (active, inactive background)
// ・NavigationLink

// onAppearは, 初回Mount時, 画面遷移先から戻った時にも呼ばれている

import SwiftUI

struct SettingView: View {
    @Environment(\.scenePhase) private var scenePhase
    var body: some View {
        NavigationView {
            VStack {
                Button(action: {},
                label: {
                    NavigationLink("Go to Detail", destination: ProfileDetailView())
                })
                .frame(maxWidth: .infinity)
                .frame(height: 40, alignment: .center)
                .background(Color.blue)
                .cornerRadius(20)
                .padding()
            }
            .onAppear(perform: {
                print("OnAppear")
            })
            .onChange(of: scenePhase) { scene in
                switch scene {
                case .active:
                    print("scenePhase: active")
                case .inactive:
                    print("scenePhase: inactive")
                case .background:
                    print("scenePhase: background")
                @unknown default: break
                }
            }
        }
    }
}

struct SettingView_Previews: PreviewProvider {
    static var previews: some View {
        SettingView()
    }
}
