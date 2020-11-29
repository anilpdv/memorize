//
//  MemoryGame.swift
//  Memorize
//
//  Created by anil pdv on 28/11/20.
//

import Foundation

struct MemoryGame<CardContent> {
    var cards: Array<Card>
    
    init(numberOfPairs:Int,cardContentFactory:(Int) -> CardContent) {
        cards = Array<Card>()
        for pairIndex in 0..<numberOfPairs{
            let content = cardContentFactory(pairIndex)
            cards.append(Card( content: content,id: pairIndex*2))
            cards.append(Card( content: content,id: pairIndex*2+1))
        }
    }
    
    mutating func chosoe(card: Card)  {
        print("card choosen \(card)")
        let choosenIndex: Int = cards.firstIndex(matching: card)
        cards[choosenIndex].isFaceUp = !cards[choosenIndex].isFaceUp
    }
    
    struct Card: Identifiable {
        var isFaceUp: Bool = false
        var isMatched: Bool = false
        var content: CardContent
        var id: Int
    }
}

