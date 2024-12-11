//
//  LocalDataManager.swift
//  Trail Blaze
//
//  Created by Udani Fernando on 11/12/2024.
//

import Foundation

class LocalDataManager {
    
    static let shared = LocalDataManager() // Singleton instance

    private init() {} // Prevent instantiation outside this class
    
    func saveData<T: Encodable>(_ data: T, to fileName: String) {
        let fileURL = getDocumentsDirectory().appendingPathComponent(fileName)
        do {
            let jsonData = try JSONEncoder().encode(data)
            try jsonData.write(to: fileURL)
            print("Data saved to \(fileURL)")
        } catch {
            print("Failed to save data: \(error.localizedDescription)")
        }
    }
    

    func getDocumentsDirectory() -> URL {
        FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
    }
    
    
    
    func loadData<T: Decodable>(from fileName: String, as type: T.Type) -> T? {
        let fileURL = getDocumentsDirectory().appendingPathComponent(fileName)
        do {
            let data = try Data(contentsOf: fileURL)
            let decodedData = try JSONDecoder().decode(T.self, from: data)
            return decodedData
        } catch {
            print("Failed to load data: \(error.localizedDescription)")
            return nil
        }
    }
    
}
