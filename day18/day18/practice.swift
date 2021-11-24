//
//  practice.swift
//  day18
//
//  Created by Bibi on 2021/11/24.
//

import Foundation

func displayAllFiles(at path: String) {
    let fileManager = FileManager.default
    
    do {
        let contents = try fileManager.contentsOfDirectory(atPath: path)
    } catch let error as NSError {
        print("Error access directory: \(error)")
    }
}
