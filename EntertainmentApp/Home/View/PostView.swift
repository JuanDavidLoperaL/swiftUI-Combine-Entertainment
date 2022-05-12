//
//  PostView.swift
//  EntertainmentApp
//
//  Created by Juan david Lopera lopez on 9/05/22.
//

import SwiftUI

struct PostView: View {
    
    // MARK: - Private Properties
    private let post: Post
    
    // MARK: - Internal Init
    init(post: Post) {
        self.post = post
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            headerPost()
            Divider()
            VStack {
                bodyPost()
                footerPost()
                
            }
        }
        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .top)
    }
}

// MARK: - Private Functions
private extension PostView {
    @ViewBuilder
    func headerPost() -> some View {
        HStack {
            Image(post.userImage)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(maxWidth: 30.0)
            Text(post.username)
            Spacer()
        }
        .frame(minWidth: 0, maxWidth: .infinity)
        .padding(.leading)
    }
    
    @ViewBuilder
    func bodyPost() -> some View {
        Image(post.image)
            .resizable()
            .aspectRatio(contentMode: .fill)
            .frame(minWidth: 0.0, maxWidth: .infinity, minHeight: 0.0, maxHeight: 300.0)
        HStack {
            Image("heartIcon")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(minWidth: 0.0, maxWidth: 30.0, minHeight: 0.0, maxHeight: 30.0)
            Image("commentIcon")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(minWidth: 0.0, maxWidth: 30.0, minHeight: 0.0, maxHeight: 30.0)
            Image("sentIcon")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(minWidth: 0.0, maxWidth: 30.0, minHeight: 0.0, maxHeight: 30.0)
            Spacer()
        }
        .padding(.leading)
    }
    
    @ViewBuilder
    func footerPost() -> some View {
        Text(post.description)
            .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
            .padding()
    }
}
struct PostView_Previews: PreviewProvider {
    static var previews: some View {
        PostView(post: Post.getMock())
    }
}
