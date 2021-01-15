//
//  Settings1.swift
//  test
//
//  Created by Mohammed on 1/15/21.
//
/*
import SwiftUI
import SDWebImageSwiftUI

struct Settings1: View {
    var edges = UIApplication.shared.windows.first?.safeAreaInsets
    @StateObject var settingsData = SettingsViewModel()
    @EnvironmentObject var env: FirebaseEnv

    var body: some View {

        VStack {
            
            HStack {
                
                Text("Settings")
                    .font(.largeTitle)
                    .fontWeight(.heavy)
                    .foregroundColor(.white)
                
                Spacer(minLength: 0)
                
            }
            .padding()
            .padding(.top,edges!.top)
            .background(Color("bg"))
            .shadow(color: Color.white.opacity(0.06), radius: 5, x: 0, y: 5)
            
            if settingsData.userInfo.pic != ""{
                
                ZStack {
                    
                    WebImage(url: URL(string: settingsData.userInfo.pic)!)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 125, height: 125)
                        .clipShape(Circle())
                    
                    if settingsData.isLoading {
                     
                        ProgressView()
                            .progressViewStyle(CircularProgressViewStyle(tint: Color("blue")))
                    }
                }
                .padding(.top,25)
                .onTapGesture {
                    settingsData.picker.toggle()
                }
            }
            
            HStack(spacing: 15) {
                
                Text(settingsData.userInfo.username)
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                
                Button(action: {settingsData.updateDetails(field: "Name")}) {
                    
                    Image(systemName: "pencil.circle.fill")
                        .font(.system(size: 24))
                        .foregroundColor(.white)
                }
            }
            .padding()
            
            HStack(spacing: 15) {
                
                Text(settingsData.userInfo.bio)
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                
                Button(action: {settingsData.updateDetails(field: "bio")}) {
                    
                    Image(systemName: "pencil.circle.fill")
                        .font(.system(size: 24))
                        .foregroundColor(.white)
                }
            }
// LogOut Button....
            Button("Signout") {
                env.signOut()
            }
            .foregroundColor(.red)
            
            Spacer(minLength: 0)
        }
        .sheet(isPresented: $settingsData.picker) {
            
            ImagePicker(picker: $settingsData.picker, img_Data: $settingsData.img_data)
        }
        .onChange(of: settingsData.img_data) { (newData) in
            
            settingsData.updateImage()
        }
    }
}

struct Settings1_Previews: PreviewProvider {
    static var previews: some View {
        Settings1()
    }
}
*/

import SwiftUI
import SDWebImageSwiftUI

struct Settings1: View {
    var edges = UIApplication.shared.windows.first?.safeAreaInsets
    @StateObject var settingsData = SettingsViewModel()
    @EnvironmentObject var env: FirebaseEnv

    var body: some View {
        
        VStack{
            
            HStack{
                
                Text("Settings")
                    .font(.largeTitle)
                    .fontWeight(.heavy)
                    .foregroundColor(Color("Liver"))
                
                Spacer(minLength: 0)
                
            }
            .padding()
            .padding(.top,edges!.top)
            // Top Shadow Effect...
            .background(Color("Tan"))
            .shadow(color: Color.white.opacity(0.06), radius: 5, x: 0, y: 5)
            
            if settingsData.userInfo.pic != ""{
                
                ZStack{
                    
                    WebImage(url: URL(string: settingsData.userInfo.pic)!)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 125, height: 125)
                        .clipShape(Circle())
                    
                    if settingsData.isLoading{
                        
                        ProgressView()
                            .progressViewStyle(CircularProgressViewStyle(tint: Color("Coffee")))
                    }
                }
                .padding(.top,25)
                .onTapGesture {
                    settingsData.picker.toggle()
                }
            }
            
            HStack(spacing: 15){
                
                Text(settingsData.userInfo.username)
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                
                // Edit Button...
                
//                Button(action: {settingsData.updateDetails(field: "Name")}) {
//
//                    Image(systemName: "pencil.circle.fill")
//                        .font(.system(size: 24))
//                        .foregroundColor(.white)
//                }
            }
            .padding()
            
            HStack(spacing: 15){
                
                Text(settingsData.userInfo.bio)
                    .foregroundColor(.white)
                
                // Edit Button...
                
//                Button(action: {settingsData.updateDetails(field: "Bio")}) {
//                    
//                    Image(systemName: "pencil.circle.fill")
//                        .font(.system(size: 24))
//                        .foregroundColor(.white)
//                }
            }

            // LogOut Button...
            
            Button(action: env.signOut, label: {
                Text("Logout")
//                    .foregroundColor(.white)
//                    .fontWeight(.bold)
//                    .padding(.vertical)
//                    .frame(width: UIScreen.main.bounds.width - 100)
//                    .background(Color.blue)
//                    .clipShape(Capsule())
                    .font(.custom("Montserrat-Medium", size: 30))
                    .foregroundColor(.init("Almond"))
                    .padding()
                    .frame(width: 312.0, height: 55.0)
                    .background(Color.init("Cafe"))
                    .clipShape(Capsule())
                    .shadow(color: Color.init("Desert"), radius: 30, x: 15, y: 15)
                    .padding()
            })
            .padding()
            .padding(.top,10)
            
            Spacer(minLength: 0)
        }
        .sheet(isPresented: $settingsData.picker) {
         
            ImagePicker(picker: $settingsData.picker, img_Data: $settingsData.img_data)
        }
        .onChange(of: settingsData.img_data) { (newData) in
            // whenever image is selected update image in Firebase...
            settingsData.updateImage()
        }
    }
}

