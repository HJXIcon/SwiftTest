//
//  Enum.swift
//  swiftTest
//
//  Created by 晓梦影 on 2017/8/30.
//  Copyright © 2017年 黄金星. All rights reserved.
//

import UIKit

// 就像类和其他所有命名类型一样，枚举可以包含方法
enum Rank: Int {
    case Ace = 1
    case Two, Three, Four, Five, Six, Seven, Eight, Nine, Ten
    case Jack, Queen, King
    func simpleDescription() -> String {
        // 在 switch 里，枚举成员使用缩写 .ace 来引用，因为 self 的值已经知道是一个 Rank
        switch self {
        case .Ace:
            return "ace"
        case .Jack:
            return "jack"
        case .Queen:
            return "queen"
        case .King:
            return "king"
        default:
            return String(self.rawValue)
        }
} }

/**！
 默认情况下，Swift 按照从 0 开始每次加 1 的方式为原始值进行赋值，不过你可以通过显式赋值进行改变。在 上面的例子中， Ace 被显式赋值为 1，并且剩下的原始值会按照顺序赋值。你也可以使用字符串或者浮点数作为 枚举的原始值。使用 rawValue 属性来访问一个枚举成员的原始值
 */



/**！
 一个枚举成员的实例可以有实例值。相同枚举成员的实例可以有不同的值。创建实例的时候传入值即可。实例值
 和原始值是不同的:枚举成员的原始值对于所有实例都是相同的，而且你是在定义枚举的时候设置原始值。
 
 例如，考虑从服务器获取日出和日落的时间。服务器会返回正常结果或者错误信息。
 */

enum ServerResponse {
    case Result(String, String)
    case Failure(String)
}

//  MARK: - <枚举>
class Enum: BaseViewController {
    
    let success = ServerResponse.Result("6:00 am", "8:09 pm")
    
    override func viewDidLoad() {
        
        navigationItem.title = "Enum"
        
        let ace = Rank.Ace
        let aceRawValue = ace.rawValue
        
        print("aceRawValue -- \(aceRawValue)")
        
        
        
        
        // 使用 init?(rawValue:) 初始化构造器在原始值和枚举值之间进行转换
        
        if let convertedRank = Rank(rawValue: 3) {
            let threeDescription = convertedRank.simpleDescription()
            print("threeDescription ==" + threeDescription)
        }
        
        
        
//        let failure = ServerResponse.Failure("Out of cheese.")
        
        
        // condition evaluates to a constant
        /**!
         解决：http://www.jianshu.com/p/39c8366431d6
         */
        
        switch success {
            
        case let .Result(sunrise, sunset):
            let serverResponse = "Sunrise is at \(sunrise) and sunset is at \(sunset)."
            print("serverResponse ---- " + serverResponse)
            
        case let .Failure(message):
            print("Failure...  \(message)")
        }
        
    }
    
    
    
    
}


