//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by João Viana on 28/12/2020.
//

// this is the viewModel, captures intent and makes changes to the model. 

import SwiftUI

// a class is easy to share, lives in the heap, and has pointers to it. all of our views could have pointers to it.
class EmojiMemoryGame: ObservableObject {
    // call it something more descriptive, such as: game.
    // private(set) -> only EmojiMemoryGame can change the Model, but others can see its content.
    // @Published is a property wrapper -> it ensures that objectWillChange.send() when model changes. 
    @Published private var model: MemoryGame<String> = EmojiMemoryGame.createMemoryGame();
    
    // static so that model can call createMemoryGame
    static func createMemoryGame() -> MemoryGame<String> {
        let emojis: Array<String> = ["🌸", "🍀", "🍁"]
        return MemoryGame<String>(numberOfPairsOfCards: 2) { pairIndex in return emojis[pairIndex] }
    }
    // MARK: - Access to the Model

    var cards: Array<MemoryGame<String>.Card> {
        model.cards
    }

    // MARK: - Intent(s)

    func choose(card: MemoryGame<String>.Card) {
        model.choose(card: card)
    }
}
