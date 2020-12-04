//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by anil pdv on 28/11/20.
//

import Foundation

class EmojiMemoryGame: ObservableObject{
   @Published private var model: MemoryGame<String> = EmojiMemoryGame.createMemoryGame()
    
    private static func createMemoryGame() -> MemoryGame<String>{
        let emojis: Array<String> = ["👻","🎃","🕷","🧛‍♂️","🧟‍♂️","🦹🏿‍♂️","👨🏿‍🏫","🐭","🧣","🥼"]
        return MemoryGame<String>(numberOfPairs: 10){ pairIndex in
            return emojis[pairIndex]
        }
    }
    
    // MARK: - Access to Model
    
    var cards: Array<MemoryGame<String>.Card>{
         model.cards
    }
    
    // MARK: - Intent(s)
    
    func choose(card: MemoryGame<String>.Card){
         model.chosoe(card: card)
    }
    
}
