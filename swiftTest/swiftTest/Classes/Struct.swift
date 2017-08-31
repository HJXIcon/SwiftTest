//
//  Struct.swift
//  swiftTest
//
//  Created by 晓梦影 on 2017/8/31.
//  Copyright © 2017年 黄金星. All rights reserved.
//
/**!
 使用 struct 来创建一个结构体。结构体和类有很多相同的地方，比如方法和构造器。它们之间最大的一个区别就 是结构体是传值，类是传引用。
 */

struct Card {
    var rank: Rank
    var suit: Suit
    func simpleDescription() -> String {
        return "The \(rank.simpleDescription()) of \(suit.simpleDescription())"
} }

enum Suit {
    case Spades, Hearts, Diamonds, Clubs
    func simpleDescription() -> String {
        switch self {
        case .Spades:
            return "spades"
        case .Hearts:
            return "hearts"
        case .Diamonds:
            return "diamonds"
        case .Clubs:
            return "clubs"
        }
} }



import UIKit

class Struct: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let threeOfSpades = Card(rank: .Three, suit: .Spades)
        let threeOfSpadesDescription = threeOfSpades.simpleDescription()
        print(threeOfSpadesDescription)
        
    }

}
