//
//  Signin.swift
//  health-app
//
//  Created by 里見健太 on 2021/04/01.
//

import SwiftUI


// :: FEATURES ::
// ・TextField with Icon
// ・cornerRadius and shadow (by overlay)
// ・auto scroll up when keyboard appears (by simply put in ScrollView)
// ・place content center in ScrollView (by GeometryReader)
// ・MediaQuery (UIScreen.main.bounds.size.width)
// ・Keyboard dissappear when touch outside (by define extension in health_appApp.swift)


struct SigninView: View {
    @State var email = ""
    @State var password = ""
    let screenWidth = UIScreen.main.bounds.size.width
    
    var body: some View {
        GeometryReader { geometry in
            ScrollView {
                VStack(spacing: 30) {
                    Text("Signin")
                        .fontWeight(.bold)
                        .multilineTextAlignment(.leading)
                        .padding()
                        .font(.title)
                        .frame(width: screenWidth, alignment: .leading)
                    
                    HStack {
                        Image(systemName: "envelope")
                        TextField("email", text: $email)
                            .padding()
                    }
                    .frame(width: screenWidth - 50, height: 25)
                    .padding()
                    .overlay(
                        RoundedRectangle(cornerRadius: 22)
                            .stroke(Color.secondary, lineWidth: 0.2)
                            .shadow(color: .gray, radius: 2, x: 0, y: 2)
                    )
                    .keyboardType(.alphabet)
                    
                    HStack {
                        Image(systemName: "lock")
                        SecureField("password", text: $password)
                            .padding()
                    }
                    .frame(width: screenWidth - 50, height: 25)
                    .padding()
                    .overlay(
                        RoundedRectangle(cornerRadius: 22)
                            .stroke(Color.secondary, lineWidth: 0.2)
                            .shadow(color: .gray, radius: 2, x: 0, y: 2)
                    )
                    .keyboardType(.alphabet)
                    
                    Button(action: {
                        print("EMAIL is : \(email), PASSWORD is : \(password) ")
                    }, label: {
                        Spacer()
                        Text("Signin")
                            .padding()
                            .foregroundColor(.white)
                            .font(.title3)
                        Spacer()
                    })
                    .background(Color.blue)
                    .frame(width: screenWidth - 30, height: 50)
                    .cornerRadius(20)
                    .shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
                    .padding()
                }
                .ignoresSafeArea()
                .frame(width: geometry.size.width)
                .frame(minHeight: geometry.size.height)
            }
        }
    }
    
    
}


struct Signin_Previews: PreviewProvider {
    static var previews: some View {
        SigninView()
            .previewDevice("iPhone 12 Pro")
        SigninView()
            .previewDevice("iPhone SE (2nd generation)")
    }
}
