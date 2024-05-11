//
//  ArticleView.swift
//  TheSpoke
//
//  Created by Rhea Malik on 12/26/22.
//

import SwiftUI

struct ArticleView: View {
    var post: NewsPost
    var body: some View {
        ScrollView {
            VStack {
                if let title = post.post.title.rendered {
                    Text(title)
                        .font(.custom("New York", size: 36))
                        .padding(.bottom, 10)
                        .multilineTextAlignment(.center)
                }
                
                if let date = post.post.date {
                    Text(date)
                        .foregroundColor(Color(red: 155/255, green: 42/255, blue: 68/255))
                        .font(.custom("New York", size: 24))
                        .padding(.bottom, 10)
                }
                
                if let image = post.image {
                    AsyncImage(url: URL(string: image)) { x in
                        x.resizable()
                    } placeholder: {
                        Color.gray
                    }
                    .aspectRatio(contentMode: .fill)
                }
                
                
                
                // title
                // author(s) | date
                // image (+caption?)
                // article text
            }
        }
        
    }
}

//struct ArticleView_Previews: PreviewProvider {
//    static var previews: some View {
//        ArticleView()
//    }
//}
