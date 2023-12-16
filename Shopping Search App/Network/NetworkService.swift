//
//  NetworkService.swift
//  Shopping Search App
//
//  Created by Gabriel Pereira on 16/12/23.
//

import Foundation

import Foundation

final class NetworkService: NetworkServiceType {
    // MARK: - Properties
    private let urlSession: URLSessionProtocol
    
    init(urlSession: URLSessionProtocol = URLSession.shared) {
        self.urlSession = urlSession
    }
    
    // MARK: - Internal Methods
    func request<Request: DataRequest>(_ request: Request,
                                       completion: @escaping (Result<Request.Response, Error>) -> Void) {
        guard var urlComponent = URLComponents(string: request.url) else {
            let error = createError(withDomain: .invalidEndpoint, code: 404)
            completion(.failure(error))
            return
        }
        
        urlComponent.queryItems = request.queryItems.map { URLQueryItem(name: $0.key, value: $0.value) }
        
        guard let url = urlComponent.url else {
            let error = createError(withDomain: .invalidEndpoint, code: 404)
            completion(.failure(error))
            return
        }
        
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = request.method.rawValue
        urlRequest.allHTTPHeaderFields = request.headers
        
        urlSession.dataTask(with: urlRequest) { [weak self] data, response, error in
            guard let self = self else { return }
            
            if let error = error {
                completion(.failure(error))
                return
            }
            
            guard let response = response as? HTTPURLResponse, (200..<300).contains(response.statusCode) else {
                let errorMessage = "Unexpected status code: \((response as? HTTPURLResponse)?.statusCode ?? -1)"
                let error = self.createError(withDomain: .invalidResponse, code: 417, userInfo: [NSLocalizedDescriptionKey: errorMessage])
                completion(.failure(error))
                return
            }
            
            guard let data = data else {
                let error = self.createError(withDomain: .unprocessableEntity, code: 422)
                completion(.failure(error))
                return
            }
            
            do {
                completion(.success(try request.decode(data)))
            } catch let error as NSError {
                completion(.failure(error))
            }
        }
        .resume()
    }
    
    // MARK: - Private Methods
    private func createError(withDomain domain: ErrorResponse, 
                             code: Int,
                             userInfo: [String: Any]? = nil) -> Error {
        return NSError(domain: domain.rawValue, code: code, userInfo: userInfo)
    }
}
