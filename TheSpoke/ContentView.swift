//
//  ContentView.swift
//  TheSpoke
//
//  Created by Rhea Malik on 11/5/22.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
        TabView {
            FeedView(category: Category.news)
                .tabItem {
                    Label("News", systemImage: "newspaper")
                }
            FeedView(category: Category.telife)
                .tabItem {
                    Label("T/E Life", systemImage: "graduationcap")
                }
            FeedView(category: Category.sports)
                .tabItem {
                    Label("Sports", systemImage: "football")
                }
            FeedView(category: Category.opinion)
                .tabItem {
                    Label("Opinion", systemImage: "quote.bubble")
                }
        }
        
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
