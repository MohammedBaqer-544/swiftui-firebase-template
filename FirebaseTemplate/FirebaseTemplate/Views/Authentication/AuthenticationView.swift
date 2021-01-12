//
//  AuthenticationView.swift
//  FirebaseTemplate
//
//  Created by Omar Alibrahim on 12/27/20.
//  Copyright © 2020 OMAR. All rights reserved.
//

import SwiftUI

struct AuthenticationView: View {
    var body: some View {

            NavigationView {
                ZStack {
                    Image("fBG")
                        .resizable()
                        .ignoresSafeArea()
                    
                VStack{
                    
                    Text("مرحباً بكم !")
                        .font(.custom("ArefRuqaa-Regular", size: 80))
                        .foregroundColor(.init("Coffee"))
                        .padding()
                    
                    Text("كبتي")
                        .font(.custom("ArefRuqaa-Regular", size: 50))
                        .foregroundColor(.init("Brown Sugar"))
                        .padding()
                    
                    Spacer()
                    Spacer()

                    NavigationLink(
                        destination: SignIn(),
                        label: {
                            Text("تسجيل الدخول")
                                .font(.custom("Montserrat-Medium", size: 30))
                                .foregroundColor(.init("Cafe"))
                                .padding()
                                .frame(width: 312.0, height: 55.0)
                                .background(Color.init("Almond"))
                                .clipShape(Capsule())
                                .shadow(color: Color.init("Desert"), radius: 30, x: 15, y: 15)
                            
                        }
                    )
                    .padding()
                    
                    NavigationLink(
                        destination: SignUp(),
                        label: {
                            Text("انشئ حساب")
                                .font(.custom("Montserrat-Medium", size: 30))
                                .foregroundColor(.init("Almond"))
                                .padding()
                                .frame(width: 312.0, height: 55.0)
                                .background(Color.init("Cafe"))
                                .clipShape(Capsule())
                                .shadow(color: Color.init("Desert"), radius: 30, x: 15, y: 15)
                        }
                    )
                    
                    Spacer()

                }
            }
        }
    }
}

struct SignInModifier: ViewModifier{
    func body(content: Content) -> some View {
        content
            .foregroundColor(.white)
            .padding()
            .frame(minWidth: 100, idealWidth: 200, maxWidth: .infinity,  alignment: .center)
            .background(Color.blue)
            .cornerRadius(10)
            .padding(.horizontal)
    }
}

struct AuthenticationView_Previews: PreviewProvider {
    static var previews: some View {
        AuthenticationView()
    }
}
