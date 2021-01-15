//
//  PostCardImage.swift
//  FirebaseTemplate
//
//  Created by Mohammed on 1/14/21.
//  Copyright © 2021 MohammedBaqer. All rights reserved.
//
/*
import SwiftUI
import SDWebImageSwiftUI

struct PostCardImage: View {

    var post: PostModel

    
    var body: some View {
        
        VStack(alignment: .leading) {

            /*

















            */

            Text(post.caption)
                .lineLimit(nil)
                .padding(.leading, 16)
                .padding(.trailing, 32)
            
            WebImage(url: URL(string: post.mediaUrl)!)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: UIScreen.main.bounds.size.width, height: 400, alignment: .center)
                .clipped()
            
            
            
            
            
        }
        
    }
}


/*
struct PostCardImage_Previews: PreviewProvider {
    static var previews: some View {
        PostCardImage()
    }
}
*/
 */
