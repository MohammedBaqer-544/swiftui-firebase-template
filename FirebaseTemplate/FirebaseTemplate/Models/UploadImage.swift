//
//  UploadImage.swift
//  test
//
//  Created by Mohammed on 1/15/21.
//


import SwiftUI
import Firebase

func UploadImage(imageData: Data,path: String,completion: @escaping (String) -> ()){
    
    let storage = Storage.storage().reference()
    let uid = Auth.auth().currentUser!.uid
    
    storage.child(path).child(uid).putData(imageData, metadata: nil) { (_, err) in
        
        if err != nil{
            completion("")
            return
            
        }
        
        // Downloading Url And Sending Back...
        
        storage.child(path).child(uid).downloadURL { (url, err) in
            if err != nil{
                completion("")
                return
                
            }
            completion("\(url!)")
        }
    }
}

