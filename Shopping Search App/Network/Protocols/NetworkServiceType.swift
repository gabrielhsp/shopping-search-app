//
//  NetworkServiceType.swift
//  Shopping Search App
//
//  Created by Gabriel Pereira on 16/12/23.
//

protocol NetworkServiceType {
    func request<Request: DataRequest>(_ request: Request, completion: @escaping (Result<Request.Response, Error>) -> Void)
}
