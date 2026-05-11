//
//  FeedModel.swift
//  Navigation
//

import UIKit

final class FeedModel {
    
    private let secretWord = "Swift"
    
    func check(word: String) -> Bool {
        return word.lowercased() == secretWord.lowercased()
    }
    
}
