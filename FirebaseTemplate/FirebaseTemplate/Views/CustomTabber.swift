//
//  CustomTabber.swift
//  test
//
//  Created by Mohammed on 1/15/21.
//
/*
import SwiftUI

struct CustomTabber: View {
    @Binding var selectedTab: String
    var body: some View {
        
        HStack(spacing: 65) {
            
            TabButton(title: "\(Image(systemName: "mail"))", selectedTab: $selectedTab)
            
            TabButton(title: "\(Image(systemName: "gear"))", selectedTab: $selectedTab)
        }
        .padding(.horizontal)
        .background(Color.white)
        .clipShape(Capsule())
    }
}

struct TabButton: View {
    
    var title: String
    @Binding var selectedTab: String
    
    var body: some View {
        
        Button(action: {selectedTab = title}) {
            
            VStack(spacing: 5) {
                
                Image(title)
                    .renderingMode(.template)
                
                Text(title)
                    .font(.caption)
                    .fontWeight(.bold)
            }
            .foregroundColor(selectedTab == title ? Color("blue") : .gray)
        }
        
    }
    
}
*/

import SwiftUI

struct CustomTabbar: View {
    @Binding var selectedTab : String
    var body: some View {
        
        HStack(spacing: 65){
            
            TabButton(title: "Posts", selectedTab: $selectedTab)
            
            TabButton(title: "Settings", selectedTab: $selectedTab)
        }
        .padding(.horizontal)
        .background(Color.white)
        .clipShape(Capsule())
    }
}

struct TabButton : View {
    
    var title : String
    @Binding var selectedTab : String
    
    var body: some View{
        
        Button(action: {selectedTab = title}) {
            
            VStack(spacing: 5){
                
                Image(title)
                    .renderingMode(.template)
                
                Text(title)
                    .font(.caption)
                    .fontWeight(.bold)
            }
            .foregroundColor(selectedTab == title ? Color("blue") : .gray)
            .padding(.horizontal)
            .padding(.vertical,10)
        }
    }
}
