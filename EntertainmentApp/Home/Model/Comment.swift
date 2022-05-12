//
//  Comment.swift
//  EntertainmentApp
//
//  Created by Juan david Lopera lopez on 9/05/22.
//

import Foundation

struct Comment: Codable {
    let username: String
    let userImage: String
    let comment: String
    let likes: Int
}

extension Comment {
    static func getArrayMock() -> [Comment] {
        return [
            Comment(username: "Juan Mock",
                    userImage: "placeHolder",
                    comment: "Comment Mock",
                    likes: 0)
        ]
    }
}
