//
//  FeedView.swift
//  TheSpoke
//
//  Created by Rhea Malik on 12/24/22.
//

import SwiftUI

struct FeedView: View {
    
    @ObservedObject var networkManager = NetworkManager()
    var category: Category
    
    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVGrid(columns: [GridItem(.flexible())], alignment: .center, spacing: 30) {
                    ForEach(networkManager.posts.indices, id: \.self) { index in
                        if (networkManager.posts[index].post.category == category) {
                            NavigationLink(destination: ArticleView(post: networkManager.posts[index])) {
                                PostView(newsPost: networkManager.posts[index])
                            }
                            .buttonStyle(PlainButtonStyle())
                            .padding(.leading, 30)
                            .padding(.trailing, 30)
//                            NavigationLink(destination: WebView(content: networkManager.posts[index].post.content.rendered ?? "HTML cannot be rendered, please try again later.")) {
//                                PostView(newsPost: networkManager.posts[index])
//
//                            }
//                            .buttonStyle(PlainButtonStyle())
//                            .padding(.leading, 30)
//                            .padding(.trailing, 30)
                        }
                    }
                }
            }
            .navigationTitle("The Spoke")
        }
        .onAppear {
            self.networkManager.fetchData()
        }
    }
}

//struct FeedView_Previews: PreviewProvider {
//    static var previews: some View {
//        FeedView()
//    }
//}
