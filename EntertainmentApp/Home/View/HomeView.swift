//
//  HomeView.swift
//  EntertainmentApp
//
//  Created by Juan david Lopera lopez on 9/05/22.
//

import SwiftUI

struct HomeView: View {
    
    // MARK: - Private Properties
    @ObservedObject private var viewModel: HomeViewModel
    
    // MARK: - Internal Init
    init(viewModel: HomeViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        NavigationView {
            List(viewModel.postList?.posts ?? []) {
                post in PostView(post: post)
            }.frame(maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
                .listStyle(GroupedListStyle())
                .navigationTitle("Posts social media")
                .onAppear {
                    viewModel.fetchPost()
                }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView(viewModel: HomeViewModel())
    }
}
