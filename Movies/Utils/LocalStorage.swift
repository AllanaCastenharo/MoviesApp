//
//  LocalStorage.swift
//  Movies
//
//  Created by Allana Castenharo Santamaria on 03/12/23.
//

import Foundation

protocol LocalStorageProtocol {
    func save<T: Encodable>(object: T, key: String)
    func get<T: Decodable>(key: String) -> T?
}

class LocalStorage: LocalStorageProtocol {
    func save<T: Encodable>(object: T, key: String) {
        if let encoded = try? JSONEncoder().encode(object) {
            UserDefaults.standard.set(encoded, forKey: key)
        }
    }
    
    func get<T: Decodable>(key: String) -> T? {
        if let data = UserDefaults.standard.object(forKey: key) as? Data,
           let response = try? JSONDecoder().decode(T.self, from: data) {
            return response
        }
        return nil
    }
}
