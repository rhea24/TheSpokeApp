//
//  PostView.swift
//  TheSpoke
//
//  Created by Rhea Malik on 11/6/22.
//

import SwiftUI

struct PostView: View {
    let newsPost: NewsPost
    
    var body: some View {
        VStack {
            if let image = newsPost.image {
                AsyncImage(url: URL(string: image)) { x in
                    x.resizable()
                } placeholder: {
                    Color.gray
                }
                .aspectRatio(contentMode: .fill)
            }
            Text(newsPost.post.title.rendered ?? "")
                .multilineTextAlignment(.center)
        }
        
    }
}

//struct PostView_Previews: PreviewProvider {
//    static var previews: some View {
//        PostView()
//    }
//}
