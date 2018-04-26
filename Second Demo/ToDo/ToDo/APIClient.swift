//
//  APIClient.swift
//  ToDo
//
//  Created by Martin Demiddel on 26.04.18.
//  Copyright © 2018 Martin Demiddel. All rights reserved.
//

import Foundation

class APIClient {
    lazy var session: SessionProtocol = URLSession.shared

    func loginUser(withName username: String,
                   password: String,
                   completion: @escaping (Token?, Error?) -> Void) {
        guard let url = URL(string: "https://awesometodos.com") else {
            fatalError()
        }
        session.dataTask(with: url) { (data, response, error) in
        }
    }
}

extension URLSession: SessionProtocol {}

protocol SessionProtocol {
    func dataTask(
        with url: URL,
        completionHandler: @escaping
        (Data?, URLResponse?, Error?) -> Void)
        -> URLSessionDataTask
}
