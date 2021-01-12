//
//  SignInView.swift
//  FirebaseTemplate
//
//  Created by Omar Alibrahim on 12/27/20.
//  Copyright © 2020 OMAR. All rights reserved.
//

import SwiftUI


struct SignIn: View {
    
    @State var userCredentials = SignInCredentials(email: "", password: "")
    @EnvironmentObject var env: FirebaseEnv
    @State var alertShown: Bool = false
    @State var alertError: String = ""
    
    var body: some View {
        
        ZStack {
            ZStack {
                
                Image("BG1")
                    .resizable()
                    .ignoresSafeArea()
                    .scaledToFit()
                    .padding(.bottom, 90.0)
                    .offset(y: -90)
                
                VStack {
                    
                    Rectangle()
                        .ignoresSafeArea()
                        .frame(height: 800.0)
                        .cornerRadius(80)
                        .offset(y: 90)
                        .foregroundColor(.init("Desert"))
                }
            }
            
            VStack{
                
                HStack {
                    
                    Spacer()
                    
                    Text("كبتي")
                        .font(.custom("Montserrat-Bold", size: 80))
                        .foregroundColor(.init("Coffee"))
                        .offset(y: -50.0)
                        .offset(x: -30, y: -30)
                }
                
                Text("تسجيل الدخول")
                    .font(.custom("Montserrat-SemiBold", size: 40))
                    .foregroundColor(.init("Coffee"))
                    .padding()
                
                VStack {
                    HStack {
                        
                        Spacer()
                        
                        Text("البريد الالكتروني")
                            .font(.custom("(A) Arslan Wessam A (A) Arslan Wessam A", size: 30))
                            .foregroundColor(.init("Brown Sugar"))
                    }
                    .padding(.trailing, 30.0)
                    .padding(.top)
                    
                    TextField("البريد الالكتروني", text: $userCredentials.email)
                        .keyboardType(.emailAddress)
                        .font(.custom("Montserrat-Medium", size: 20))
                        .foregroundColor(.init("Cafe"))
                        .padding()
                        .frame(width: 340.0, height: 48.0)
                        .background(Color.init("Almond"))
                        .clipShape(Capsule())
                        .multilineTextAlignment(.trailing)
                    
                    HStack {
                        
                        Spacer()
                        
                        Text("كلمة المرور")
                            .font(.custom("(A) Arslan Wessam A (A) Arslan Wessam A", size: 30))
                            .foregroundColor(.init("Brown Sugar"))
                    }
                    .padding(.trailing, 30.0)
                    .padding(.top)
                    
                    
                    SecureField("كلمة المرور", text: $userCredentials.password)
                        .font(.custom("Montserrat-Medium", size: 20))
                        .foregroundColor(.init("Cafe"))
                        .padding()
                        .frame(width: 340.0, height: 48.0)
                        .background(Color.init("Almond"))
                        .clipShape(Capsule())
                        .multilineTextAlignment(.trailing)
                    
                }
                
                Spacer()
                
                Button(action: {
                    env.signIn(user: userCredentials) { (uid) in
                        print("Signed in!")
                    } fail: { (error) in
                        alertError = error.debugDescription
                        alertShown = true
                    }
                }
                , label: {
                    Text("تسجيل الدخول")
                        .font(.custom("Montserrat-Medium", size: 30))
                        .foregroundColor(.init("Almond"))
                        .padding()
                        .frame(width: 312.0, height: 55.0)
                        .background(Color.init("Cafe"))
                        .clipShape(Capsule())
                        .shadow(color: Color.init("Desert"), radius: 30, x: 15, y: 15)
                        .padding()
                })
                NavigationLink("ليس لديك حساب؟ قم بإنشاء حساب جديد", destination: SignUp())
                    .foregroundColor(.init("Liver"))
                
                Spacer()
                
            }
            .alert(isPresented: $alertShown, content: {
                Alert(title: Text("هناك خطأ ما!"), message: Text(alertError), dismissButton: .cancel())
            })
            .padding()
            
        }
    }
}

struct SignInView_Previews: PreviewProvider {
    static var previews: some View {
        SignIn()
            .environmentObject(FirebaseEnv())
    }
}
