//
//  APIManager.swift
//  APIManager
//
//  Created by Juan david Lopera lopez on 10/05/22.
//

import Combine

public final class APIManager {
    
    // MARK: - Public Init
    public init() {}
    
    // MARK: - Public Function
    public func request<T: Decodable>(url: URLComponents,
                               httpMethod: HttpMethod = .´get´,
                               headers: [String: String] = [String: String]()) -> Future<T, ErrorAPI> {
        let session: URLSession = URLSession(configuration: .default)
        var request: URLRequest = URLRequest(url: url.urlUnwrapped)
        request.httpMethod = httpMethod.rawValue
        request.allHTTPHeaderFields = headers
        request.httpBody = nil
        return Future { promise in
            session.dataTask(with: request) { [weak self] data, response, error in
                guard error == nil else {
                    promise(.failure(.somethingWentWrong(message: "Error in request")))
                    return
                }
                guard let httpResponse: HTTPURLResponse = response as? HTTPURLResponse else {
                    promise(.failure(.somethingWentWrong(message: "Not http Response available")))
                    return
                }
                self?.logResponse(response: httpResponse)
                guard let data: Data = data else {
                    promise(.failure(.somethingWentWrong(message: "Not data available")))
                    return
                }
                self?.logData(data: data)
                switch httpResponse.statusCode {
                case 200...299:
                    do {
                        let object: T = try JSONDecoder().decode(T.self, from: data)
                        promise(.success(object))
                    } catch {
                        promise(.failure(.somethingWentWrong(message: "Not able to map the body response into a decodable object")))
                    }
                default:
                    promise(.failure(.somethingWentWrong(message: "unknow error")))
                }
            }
        }
    }
    
    public func requestLocal<T: Decodable>(fileName: String) -> Future<T, ErrorAPI> {
        return Future { promise in
            guard let fileLocation = Bundle.main.url(forResource: fileName, withExtension: "json") else {
                promise(.failure(.somethingWentWrong(message: "Error loading location localy Json file")))
                return
            }
            do {
                let data: Data = try Data(contentsOf: fileLocation)
                let object = try JSONDecoder().decode(T.self, from: data)
                promise(.success(object))
            } catch {
                promise(.failure(.somethingWentWrong(message: "Error loading localy Json file")))
            }
        }
    }
}

private extension APIManager {
    func logResponse(response: HTTPURLResponse) {
        debugPrint(" URL: \(response.url?.absoluteString ?? String())")
        debugPrint(" Status Code: \(response.statusCode)")
    }
    
    func logData(data: Data) {
        debugPrint(" Body: \(String(data: data, encoding: .utf8) ?? "Not body available")")
    }
}
