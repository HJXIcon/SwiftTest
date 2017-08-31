//
//  Protocol.swift
//  swiftTest
//
//  Created by 晓梦影 on 2017/8/31.
//  Copyright © 2017年 黄金星. All rights reserved.
//


//  MARK: - <协议和扩展>
/**! 类、枚举和结构体都可以实现协议。  */
protocol ExampleProtocol {
    // 使用 mutating 关键字修饰方法是为了能在该方法中修改 struct 或是 enum 的变量，在设计接口的时候，也要考虑到使用者程序的扩展性。所以要多考虑使用mutating来修饰方法。
    var simpleDescription: String { get }
    mutating func adjust()
    
}

//  MARK: - 类
class SimpleClass: ExampleProtocol {
    var simpleDescription: String = "A very simple class."
    var anotherProperty: Int = 69105
    func adjust() {
        simpleDescription += "  Now 100% adjusted."
    }
}

//  MARK: - 结构体
struct SimpleStructure: ExampleProtocol {
    var simpleDescription: String = "A simple structure"
    mutating func adjust() {
        simpleDescription += " (adjusted)"
    }
}

//  MARK: - <扩展>
/**!
 使用 extension 来为现有的类型添加功能，比如新的方法和计算属性。你可以使用扩展在别处修改定义，甚至是 从外部库或者框架引入的一个类型，使得这个类型遵循某个协议。
 */
extension Int: ExampleProtocol {
    var simpleDescription: String {
        return "The number \(self)"
    }
    mutating func adjust() {
        self += 42
} }



//  MARK: - <错误处理>
/**! 使用采用 Error 协议的类型来表示错误。  */
enum PrinterError: Error {
    case OutOfPaper
    case NoToner
    case OnFire
}

// 使用 throw 来抛出一个错误并使用 throws 来表示一个可以抛出错误的函数。如果在函数中抛出一个错误，这个函 数会立刻返回并且调用该函数的代码会进行错误处理。
func send(job: Int, toPrinter printerName: String) throws -> String {
    if printerName == "Never Has Toner" {
        throw PrinterError.NoToner
    }
    return "Job sent"
}



import UIKit

class Protocol: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // ************************
        deferFunc()
        
        //  MARK: - *******************************
        let a = SimpleClass()
        a.adjust()
        let aDescription = a.simpleDescription
        print("aDescription -- " + aDescription)
        
        //  *******************************
        var b = SimpleStructure()
        b.adjust()
        let bDescription = b.simpleDescription
        print("bDescription -- " + bDescription)
        
        //  *******************************
        print(7.simpleDescription)
        
        
        //  *******************************
        // 你可以像使用其他命名类型一样使用协议名——例如，创建一个有不同类型但是都实现一个协议的对象 合。当你处理类型是协议的值时，协议外定义的方法不可用。
        let protocolValue: ExampleProtocol = a
        print(protocolValue.simpleDescription)
        // print(protocolValue.anotherProperty) // 去掉注释可以看到错误
        
        // 即使 protocolValue 变量运行时的类型是 simpleClass ，编译器会把它的类型当做 ExampleProtocol 。这表示你不 能调用类在它实现的协议之外实现的方法或者属性。
        
        
        //  *******************************
        // 有多种方式可以用来进行错误处理。一种方式是使用 do-catch 。在 do 代码块中，使用 try 来标记可以抛出错误 的代码。在 catch 代码块中，除非你另外命名，否则错误会自动命名为 error 。
        do {
            let printerResponse = try send(job: 1040, toPrinter: "Bi Sheng")
            print(printerResponse)
        } catch {
            print(error)
        }
        
        
         // 可以使用多个 catch 块来处理特定的错误。参照 switch 中的 case 风格来写 catch 。
        do {
            let printerResponse = try send(job: 1440, toPrinter: "Never Has Toner")
            print(printerResponse)
        } catch PrinterError.OnFire {
            print("I'll just put this over here, with the rest of the fire.")
        } catch let printerError as PrinterError {
            print("Printer error: \(printerError).")
        } catch {
            print(error)
        }
        
        
        // 另一种处理错误的方式使用 try? 将结果转换为可选的。如果函数抛出错误，该错误会被抛弃并且结果为 ni l 。否则的话，结果会是一个包含函数返回值的可选值。
        
        let printerSuccess = try? send(job: 1884, toPrinter: "Mergenthaler")
        guard let success = printerSuccess else {
            return
        }
        print("printerSuccess --- " + success)
        
        let printerFailure = try? send(job: 1885, toPrinter: "Never Has Toner")
        guard let failure = printerFailure else {
            return
        }
        print("printerFailure --- " + failure)
        
        
        
    }

}


//  MARK: - <defer>
/**!
 使用 defer 代码块来表示在函数返回前，函数中最后执行的代码。无论函数是否会抛出错误，这段代码都将执 行。使用 defer ，可以把函数调用之初就要执行的代码和函数调用结束时的扫尾代码写在一起，虽然这两者的执行时机截然不同。
 */

extension Protocol{
    func deferFunc() {
        
        var fridgeIsOpen = false
        let fridgeContent = ["milk", "eggs", "leftovers"]
        func fridgeContains(_ food: String) -> Bool {
            fridgeIsOpen = true
            print("before defer ----- ")
            defer {
                fridgeIsOpen = false
                print("defer ----- ")
            }
            print("after defer ----- ")
            let result = fridgeContent.contains(food)
            return result
        }
        
        let _ = fridgeContains("banana")
        print(fridgeIsOpen)
        
    }
}
