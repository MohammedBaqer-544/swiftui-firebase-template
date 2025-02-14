//
//  NewPost.swift
//  FirebaseTemplate
//
//  Created by Mohammed on 1/15/21.
//  Copyright © 2021 MohammedBaqer. All rights reserved.
//


import SwiftUI

struct NewPost: View {
    @StateObject var newPostData = NewPostModel()
    @Environment(\.presentationMode) var present
    @Binding var updateId : String
    var body: some View {
        
        VStack{
            
            HStack(spacing: 15){
                
                Button(action: {
                    self.updateId = ""
                    present.wrappedValue.dismiss()
                    
                }) {
                    
                    Text("Cancel")
                        .fontWeight(.bold)
                        .foregroundColor(Color("Desert"))
                }
                
                Spacer(minLength: 0)
                
                if updateId == ""{
                    
                    // Only FOr New Posts....
                    Button(action: {newPostData.picker.toggle()}) {
                        
                        Image(systemName: "photo.fill")
                            .font(.title)
                            .foregroundColor(Color("Desert"))
                    }
                }
                
                Button(action: {newPostData.post(updateId: updateId,present: present)}) {
                    
                    Text("Post")
                        .font(.custom("Montserrat-Medium", size: 30))
                        .foregroundColor(.init("Brown Sugar"))
                        .padding(.vertical,10)
                        .padding(.horizontal,25)
                        .background(Color.init("Desert"))
                        .clipShape(Capsule())
                }
                .disabled(newPostData.postTxt == "" ? true : false)
                .opacity(newPostData.postTxt == "" ? 0.5 : 1)
            }
            .padding()
            .opacity(newPostData.isPosting ? 0.5 : 1)
            .disabled(newPostData.isPosting ? true : false)
            
            TextEditor(text: $newPostData.postTxt)
                .cornerRadius(15)
                .padding()
                .opacity(newPostData.isPosting ? 0.5 : 1)
                .disabled(newPostData.isPosting ? true : false)
            
            // Dispalying Image if its selected...
            
            if newPostData.img_Data.count != 0{
                
                ZStack(alignment: Alignment(horizontal: .trailing, vertical: .top)) {
                    
                    Image(uiImage: UIImage(data: newPostData.img_Data)!)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: UIScreen.main.bounds.width / 2, height: 150)
                        .cornerRadius(15)
                    
                    // Cancel Button...
                    
                    Button(action: {newPostData.img_Data = Data(count: 0)}) {
                        
                        Image(systemName: "xmark")
                            .foregroundColor(Color("Brown Sugar"))
                            .padding(10)
                            .background(Color("Desert"))
                            .clipShape(Circle())
                    }
                }
                .padding()
                .opacity(newPostData.isPosting ? 0.5 : 1)
                .disabled(newPostData.isPosting ? true : false)
            }
        }
        .background(Color("Coffee").ignoresSafeArea(.all, edges: .all)) 
        .sheet(isPresented: $newPostData.picker) {
            
            ImagePicker(picker: $newPostData.picker, img_Data: $newPostData.img_Data)
        }
    }
}
