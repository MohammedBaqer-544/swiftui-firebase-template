//
//  Home1.swift
//  test
//
//  Created by Mohammed on 1/15/21.
//


import SwiftUI

struct Home1: View {
    
    @State var selectedTab = "Posts"
    var edges = UIApplication.shared.windows.first?.safeAreaInsets
    
    var body: some View {
        ZStack(alignment: Alignment(horizontal: .center, vertical: .bottom)) {
            
            // Custom Tab Bar....
            
            ZStack{
                
                Post1()
                    .opacity(selectedTab == "Posts" ? 1 : 0)
                
                Settings1()
                    .opacity(selectedTab == "Settings" ? 1 : 0)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            
            CustomTabbar(selectedTab: $selectedTab)
                .padding(.bottom,edges!.bottom == 0 ? 15 : 0)
        }
        .background(Color("Almond").ignoresSafeArea(.all, edges: .all))
        .ignoresSafeArea(.all, edges: .top)
    }
}

