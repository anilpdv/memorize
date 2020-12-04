//
//  MemoryGame.swift
//  Memorize
//
//  Created by anil pdv on 28/11/20.
//

import Foundation

struct MemoryGame<CardContent> where CardContent:Equatable {
   private(set) var cards: Array<Card>
    
    private var indexOfTheOneAndOnlyFaceUpCard: Int? {
        get { cards.indices.filter{ cards[$0].isFaceUp }.only }
        
        set {
            for index in cards.indices {
               cards[index].isFaceUp = index == newValue
            }
        }
    }
    
    init(numberOfPairs:Int,cardContentFactory:(Int) -> CardContent) {
        cards = Array<Card>()
        for pairIndex in 0..<numberOfPairs {
            let content = cardContentFactory(pairIndex)
            cards.append(Card( content: content,id: pairIndex*2))
            cards.append(Card( content: content,id: pairIndex*2+1))
        }
    }
    
    mutating func chosoe(card: Card)  {
        print("card choosen \(card)")
        // : remember this is special way of retrieving the optional value
        // : when you have optional value you need to you use syntax like this : `variableName!`
        // : instead of using that you can check for condition weather the value exits.
        if let choosenIndex: Int = cards.firstIndex(matching: card) , !cards[choosenIndex].isFaceUp,!cards[choosenIndex].isMatched {
            if let potentialMatchIndex = indexOfTheOneAndOnlyFaceUpCard {
                if cards[choosenIndex].content == cards[potentialMatchIndex].content {
                    cards[choosenIndex].isMatched = true
                    cards[potentialMatchIndex].isMatched = true
                }
                cards[choosenIndex].isFaceUp = true
            } else {
                indexOfTheOneAndOnlyFaceUpCard = choosenIndex
            }
        }
    }
    
    struct Card: Identifiable {
        var isFaceUp: Bool = false
        var isMatched: Bool = false
        var content: CardContent
        var id: Int
    }
}

