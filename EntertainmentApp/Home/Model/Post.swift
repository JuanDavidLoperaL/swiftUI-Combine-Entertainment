//
//  Post.swift
//  EntertainmentApp
//
//  Created by Juan david Lopera lopez on 9/05/22.
//

import Foundation

struct Post: Decodable, Identifiable {
    var id: Int
    let username: String
    let userImage: String
    let likes: Int
    let image: String
    let description: String
    let commentsAmount: Int
    let comments: [Comment]
}

extension Post {
    static func getMock() -> Post {
        return Post(id: 0,
                    username: "Juan Mock",
                    userImage: "placeHolderProfile",
                    likes: 10,
                    image: "placeHolderImage",
                    description: "Description Mock",
                    commentsAmount: 2,
                    comments: Comment.getArrayMock())
    }
    
    static func getArrayMock() -> [Post] {
        return [
            Post(id: 0,
                 username: "Juan Mock",
                 userImage: "placeHolderProfile",
                 likes: 10,
                 image: "placeHolderImage",
                 description: "Description Mock",
                 commentsAmount: 2,
                 comments: Comment.getArrayMock()),
            Post(id: 1,
                 username: "Juan Mock",
                 userImage: "placeHolderProfile",
                 likes: 10,
                 image: "placeHolderImage",
                 description: "Description Mock",
                 commentsAmount: 2,
                 comments: Comment.getArrayMock())
        ]
    }
}
