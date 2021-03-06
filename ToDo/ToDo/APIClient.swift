//
//  APIClient.swift
//  ToDo
//
//  Created by 변재우 on 20190606//.
//  Copyright © 2019 변재우. All rights reserved.
//

import Foundation

protocol SessionProtocol {
	func dataTask(
		with url: URL, completionHandler: @escaping
		(Data?, URLResponse?, Error?) -> Void)
		-> URLSessionDataTask
}

class APIClient {
	
	lazy var session: SessionProtocol = URLSession.shared
	
	func loginUser(withName username: String, password: String, completion: @escaping (Token?, Error?) -> Void) {
		
//		guard let url = URL(string: "https://awesometodos.com/login") else { fatalError() }
//		let allowedCharacters = CharacterSet(charactersIn: "/%&=?$#+-~@<>|\\*,.()[]{}^!").inverted
//		guard let encodedUsername = username.addingPercentEncoding(withAllowedCharacters: allowedCharacters) else { fatalError() }
//		guard let encodedPassword = password.addingPercentEncoding(withAllowedCharacters: allowedCharacters) else { fatalError() }
		
		let query = "username=\(username.percentEncoded)&password=\(password.percentEncoded)"
		guard let url = URL(string: "https://awesometodos.com/login?\(query)") else { fatalError() }

		session.dataTask(with: url) { (data, response, error) in
			guard error == nil else {
				return completion(nil, error)
			}
			guard let data = data else {
				completion(nil, WebserviceError.DataEmptyError)
				return 
			}
			do {
				let dict = try JSONSerialization.jsonObject(with: data, options: []) as? [String:String]
				
				let token: Token?
				if let tokenString = dict?["token"] {
					token = Token(id: tokenString)
				} else {
					token = nil
				}
				completion(token, nil)
			} catch {
				completion(nil, error)
			}

		}.resume()
		
	}
	
}



extension URLSession: SessionProtocol {
	
}

extension String {
	var percentEncoded: String {
		let allowedCharacters = CharacterSet(charactersIn: "/%&=?$#+-~@<>|\\*,.()[]{}^!").inverted
		
		guard let encoded = self.addingPercentEncoding(withAllowedCharacters: allowedCharacters) else { fatalError() }
		
		return encoded
	}
}

enum WebserviceError: Error {
	case DataEmptyError
	case ResponseError
}
