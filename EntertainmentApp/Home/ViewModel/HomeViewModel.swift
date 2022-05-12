//
//  HomeViewModel.swift
//  EntertainmentApp
//
//  Created by Juan david Lopera lopez on 9/05/22.
//

import Combine
import APIManager
import Foundation

final class HomeViewModel: ObservableObject {
    
    // MARK: - Private Properties
    private let api: HomeAPIProtocol?
    private var bag: Set<AnyCancellable>
    @Published private(set) var postList: PostList?
    
    // MARK: - Internal Init
    init(api: HomeAPIProtocol? = HomeAPI(urlString: "Posts")) {
        self.api = api
        self.bag = Set<AnyCancellable>()
    }
    
    // MARK: - Internal Function
    func fetchPost() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) { [self] in
            api?.fetchPost()
                .receive(on: DispatchQueue.main)
                .sink { [weak self] completion in
                switch completion {
                case .finished:
                    print("Process has finished with success")
                case .failure(let error):
                    self?.handleError(error: error)
                }
            } receiveValue: { postList in
                self.postList = postList
            }
            .store(in: &bag)
        }
    }
}

// MARK: - Private Function
private extension HomeViewModel {
    func handleError(error: ErrorAPI) {
        switch error {
        case .somethingWentWrong(let message):
            print(message)
        }
    }
}
