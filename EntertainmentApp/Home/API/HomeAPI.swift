//
//  HomeAPI.swift
//  EntertainmentApp
//
//  Created by Juan david Lopera lopez on 10/05/22.
//

import APIManager
import Combine
import Foundation

protocol HomeAPIProtocol {
    func fetchPost() -> Future<PostList, ErrorAPI>
}

final class HomeAPI: HomeAPIProtocol {
    
    // MARK: - Private Properties
    private var baseURL: URLComponents
    private let requester: APIManager
    
    // MARK: - Internal Init
    init?(urlString: String) {
        guard let urlComponent: URLComponents = URLComponents(string: urlString) else {
            return nil
        }
        self.baseURL = urlComponent
        self.requester = APIManager()
    }
    
    func fetchPost() -> Future<PostList, ErrorAPI> {
        baseURL.path = "Any endpoint here"
        //baseURL.queryItems = Any paramters here
        return requester.request(url: baseURL)
    }
}
