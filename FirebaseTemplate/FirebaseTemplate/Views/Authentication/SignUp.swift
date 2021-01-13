//
//  SignInView.swift
//  FirebaseTemplate
//
//  Created by Omar Alibrahim on 12/27/20.
//  Copyright © 2020 OMAR. All rights reserved.
//

import SwiftUI

struct SignUp: View {
    
    @State var user = User()
    @State var password = ""
    @EnvironmentObject var env: FirebaseEnv
    @State private var error: String = ""
    @State private var showingAlert = false
    @State private var alertTitale: String = "أوه لااا"
    
    func errorCheck() -> String? {
        if user.Name.trimmingCharacters(in: .whitespaces).isEmpty || user.email.trimmingCharacters(in: .whitespaces).isEmpty || password.trimmingCharacters(in: .whitespaces).isEmpty {
            
            return "يرجى تعبئة جميع الحقول"
        }
        return nil
    }
    
    func signUp1() {
        if let error = errorCheck() {
            self.error = error
            self.showingAlert = true
            return
        }
    }
    
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
                                
                Text("انشئ حساب جديد")
                    .font(.custom("Montserrat-SemiBold", size: 40))
                    .foregroundColor(.init("Coffee"))
                    .padding()
                
                VStack {
                    HStack {
                        
                        Spacer()
                        
                        Text("اسم المستخدم")
                            .font(.custom("(A) Arslan Wessam A (A) Arslan Wessam A", size: 30))
                            .foregroundColor(.init("Brown Sugar"))
                    }
                    .padding(.trailing, 30.0)
                    .padding(.top)
                    
                    
                    TextField("اسم المستخدم", text: $user.Name)
                        .keyboardType(.default)
                        .font(.custom("Montserrat-Medium", size: 20))
                        .foregroundColor(.init("Cafe"))
                        .padding()
                        .frame(width: 340.0, height: 48.0)
                        .background(Color.init("Almond"))
                        .clipShape(Capsule())
                        .multilineTextAlignment(.trailing)
                    
                    HStack {
                        
                        Spacer()
                        
                        Text("البريد الالكتروني")
                            .font(.custom("(A) Arslan Wessam A (A) Arslan Wessam A", size: 30))
                            .foregroundColor(.init("Brown Sugar"))
                    }
                    .padding(.trailing, 30.0)
                    .padding(.top)
                    
                    TextField("البريد الالكتروني", text: $user.email)
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
                    
                    
                    SecureField("كلمة المرور", text: $password)
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
                    env.signUp(user: user, password: password)
                    signUp1()
                }
                , label: {
                    Text("انشئ حساب")
                        .font(.custom("Montserrat-Medium", size: 30))
                        .foregroundColor(.init("Almond"))
                        .padding()
                        .frame(width: 312.0, height: 55.0)
                        .background(Color.init("Cafe"))
                        .clipShape(Capsule())
                        .shadow(color: Color.init("Desert"), radius: 30, x: 15, y: 15)
                        .padding()
                }).alert(isPresented: $showingAlert) {
                    Alert(title: Text(alertTitale), message: Text(error), dismissButton: .default(Text("حسناً")))
                }
                NavigationLink("لديك حساب بالفعل؟ سجل دخولك", destination: SignIn())
                    .foregroundColor(.init("Liver"))
                
                Spacer()
                    
            }
            .padding()
        }
    }
}

struct SignUp_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            SignUp()
                .environmentObject(FirebaseEnv())
        }
    }
}
