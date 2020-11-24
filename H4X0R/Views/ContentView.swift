//
//  ContentView.swift
//  H4X0R
//
//  Created by Jesualdo Plazola Corona on 11/20/20.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var networkManager = NetworkManager()
    
    var body: some View {
        NavigationView{
            List(networkManager.posts) {post in
                NavigationLink(
                    destination: DetailView(url: post.url)) {
                    HStack {
                        Text(String(post.points))
                        Text(post.title)
                    }
                }
            }
            .navigationBarTitle("H4X0R New")
        }
        .onAppear(perform: {
            self.networkManager.featchData()
        })
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}