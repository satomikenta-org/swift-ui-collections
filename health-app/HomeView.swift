//
//  HomeView.swift
//  health-app
//
//  Created by 里見健太 on 2021/04/01.
//

import SwiftUI

// FEATURES
//
// ・Image with sf-symbols with custom color and size
// ・StackView cornerRadius (by .background(RoundedRectangle) )
// ・change navigationTitle Color (in init func)

struct HomeView: View {
    @ObservedObject var fetcher = UserService()
    @State var showDetail = false
    @State var targetUser: User?
    
    init() {
        //Use this if NavigationBarTitle is with Large Font
        UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor: UIColor.darkGray]

        //Use this if NavigationBarTitle is with displayMode = .inline
        UINavigationBar.appearance().titleTextAttributes = [.foregroundColor: UIColor.darkGray]
    }

    var body: some View {
        if !showDetail {
            NavigationView {
                List(fetcher.users) { user in
                    HStack {
                        Image(systemName: "person.crop.circle.fill.badge.checkmark")
                            .renderingMode(.template)
                            .foregroundColor(.blue)
                            .font(.title)
                            
                        Text(user.name).font(.title3)
                    }
                    .onTapGesture {
                        targetUser = user;
                        showDetail.toggle()
                    }
                    .padding()
                }
                .navigationTitle("Users")
                
            }
        }
        if showDetail {
            VStack {
                VStack (alignment: .center, spacing: 5) {
                    HStack(alignment: .top) {
                        Button(action: {
                            showDetail.toggle()
                            targetUser = nil
                        }, label: {
                            HStack {
                                Image(systemName: "xmark.circle.fill")
                                    .renderingMode(.template)
                                    .foregroundColor(.white)
                                    .font(.title)
                            }
                        })
                        Spacer()
                        Image(systemName: "person.crop.circle")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 100, height: 100, alignment: .center)
                        Spacer()
                        Button("dum"){}.hidden()
                    }
                    .foregroundColor(.white)
                    .padding()
                    
                    
                    HStack {
                        Spacer()
                        Text(targetUser!.name).font(.title)
                        Spacer()
                    }.foregroundColor(.white)
                    
                    
                    HStack {
                        Spacer()
                        Text(targetUser!.email).font(.subheadline)
                        Spacer()
                    }
                    .foregroundColor(.white)
                    
                    VStack {
                        HStack {
                            Spacer()
                            Image(systemName: "house.circle.fill")
                                .renderingMode(.template)
                                .foregroundColor(.white)
                                .font(.title)
                            Text(targetUser!.address.zipcode).font(.subheadline)
                            Spacer()
                        }
                        .foregroundColor(.white)
                        
                        HStack {
                            Spacer()
                            Text(targetUser!.address.city + targetUser!.address.street).font(.subheadline)
                            Spacer()
                        }
                        .foregroundColor(.white)
                    }.padding()
                    
                    
                }
                .background(RoundedRectangle(cornerRadius: 20).fill(Color.blue))
                .padding()
                .shadow(radius: 20)
                
                
                Button(action: {}, label: {
                    Spacer()
                    HStack{
                        Image(systemName: "personalhotspot")
                            .foregroundColor(.white)
                        Text("follow").foregroundColor(.white).font(.title2)
                    }
                    Spacer()
                })
                .frame(width: 310, height: 15, alignment: .center)
                .padding()
                .background(RoundedRectangle(cornerRadius: 10).foregroundColor(.blue))
                .shadow(radius: 10)
            }
            
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
