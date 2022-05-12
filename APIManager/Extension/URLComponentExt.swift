//
//  URLComponentExt.swift
//  APIManager
//
//  Created by Juan david Lopera lopez on 10/05/22.
//

import Foundation

extension URLComponents {
    var urlUnwrapped: URL {
        guard let url: URL = self.url?.absoluteURL else {
            return URL(fileURLWithPath: String())
        }
        return url
    }
}
