//
//  Array+Only.swift
//  Memorize
//
//  Created by anil pdv on 04/12/20.
//

import Foundation

extension Array {
    var only: Element? {
        count == 1 ? first : nil
    }
}
