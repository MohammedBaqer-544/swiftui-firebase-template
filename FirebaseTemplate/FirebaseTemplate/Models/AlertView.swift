//
//  AlertView.swift
//  FirebaseTemplate
//
//  Created by Mohammed on 1/15/21.
//  Copyright © 2021 MohammedBaqer. All rights reserved.
//


import SwiftUI

func alertView(msg: String,completion: @escaping (String) -> ()){
    
    let alert = UIAlertController(title: "Message", message: msg, preferredStyle: .alert)
    
    alert.addTextField { (txt) in
        txt.placeholder = msg.contains("Verification") ? "123456" : ""
    }
    
    alert.addAction(UIAlertAction(title: "Cancel", style: .destructive))
    
    alert.addAction(UIAlertAction(title: msg.contains("Verification") ? "Verify" : "Update", style: .default, handler: { (_) in
        
        let code = alert.textFields![0].text ?? ""
        
        if code == ""{
            // Repromoting..
            UIApplication.shared.windows.first?.rootViewController?.present(alert, animated: true)
            return
        }
        completion(code)
    }))
    
    UIApplication.shared.windows.first?.rootViewController?.present(alert, animated: true)
}

