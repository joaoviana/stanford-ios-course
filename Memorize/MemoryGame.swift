//
//  MemoryGame.swift
//  Memorize
//
//  Created by João Viana on 28/12/2020.
//

import Foundation

// model

struct MemoryGame<CardContent> {
    var cards: Array<Card>

    // functions that mutate `self`, should be mutating
    mutating func choose(card: Card) {
        // template strings in Swift
        print("card chosen: \(card)")
        let chosenIndex: Int = self.index(of: card)
        cards[chosenIndex].isFaceUp = !cards[chosenIndex].isFaceUp
    }
    
    func index(of card: Card)-> Int {
        for index in 0..<cards.count  {
            if cards[index].id == card.id {
                return index
            }
        }
        return 0 // TODO: fix this -> shouldn't return first element
    }
    
    // can have multiple inits with different arguments
    init(numberOfPairsOfCards: Int, cardContentFactory: (Int) -> CardContent) {
        cards = Array<Card>() // initialises an empty array
        for pairIndex in 0..<numberOfPairsOfCards {
            // swift inferred the type anyway for `content`
            let content: CardContent = cardContentFactory(pairIndex)
            cards.append(Card( id: pairIndex*2, content: content))
            cards.append(Card( id: pairIndex*2+1, content: content ))
        }
    }

    struct Card: Identifiable {
        var id: Int
        var isFaceUp: Bool = true
        var isMatched: Bool = false
        var content: CardContent
    }

}
