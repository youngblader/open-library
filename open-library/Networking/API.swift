//
//  API.swift
//  delivery-food-app
//
//  Created by Eugene on 13.04.23.
//

import Foundation
import Moya

protocol API {
    func request<T: Decodable>(target: BooksEndpoint, completion: @escaping (Result<T, Error>) -> ())
}

extension API {
    func request<T: Decodable>(target: BooksEndpoint, completion: @escaping (Result<T, Error>) -> ()) {
        let provider = MoyaProvider<BooksEndpoint>(plugins: [NetworkLoggerPlugin()])
        
        provider.request(target) { result in
            switch result {
            case let .success(response):
                
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                
                do {
                    let results = try decoder.decode(T.self, from: response.data)
                    completion(.success(results))
                } catch DecodingError.keyNotFound(let key, _) {
                    print("Отсутствует ключ: \(key.stringValue)")
                } catch let error {
                    completion(.failure(error))
                }
            case let .failure(error):
                completion(.failure(error))
            }
        }
    }
}
