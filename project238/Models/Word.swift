//
//  Word.swift
//  project238
//
//  Created by Alexandr Baranov on 02.11.2023.
//

import Foundation

struct Word {
    let word: String
    let translation: String
    let description: String
    
    static func getDictionary() -> [Word] {
        var dictionary: [Word] = []
        let dataStore = DataStore.shared
        
        let words = dataStore.words
        let translations = dataStore.translations
        let descritions = dataStore.descriptions
             
        for index in 0..<dataStore.words.count {
            let word = Word(
                word: words[index],
                translation: translations[index],
                description: descritions[index]
            )
            dictionary.append(word)
        }
        
        return dictionary
    }
}
