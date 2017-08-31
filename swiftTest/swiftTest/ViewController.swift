//
//  ViewController.swift
//  swiftTest
//
//  Created by 晓梦影 on 2017/8/30.
//  Copyright © 2017年 黄金星. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {
    
    
    fileprivate lazy var datas:[String] = {
       
        return ["Enum", "Struct","Protocol"];
    }()
    
    fileprivate var numbers = [20, 19, 17, 12]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "Swift练习"
        
        let shape = Shape(sideLength: 2.0, name: "shape")
        
        print("beforeSet -- \(shape.sideLength) === \(shape.perimeter)")
        
        shape.perimeter = 9.9
        print("afterSet -- \(shape.sideLength)  === \(shape.perimeter)")
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    


    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
//        let increment = makeIncrementer()
//        let y = increment(7)
        
        
//        let y = returnFifteen()
        
        
        
        let y = hasAnyMatches(list: numbers, condition: lessThanTen)
        
        let mappedNumbers = numbers.map({ number in 3 * number })
        print(mappedNumbers)
        
        print(y)
    }
}



//  MARK: - <对象和类>
class Shape{
    
     var sideLength: Double = 0.0
     var name: String?
    
    var perimeter: Double {
        get {
             return 3.0 * sideLength
        }
        // 在 perimeter 的 setter 中，新值的名字是 newValue 。你可以在 set 之后显式的设置一个名字
        set{
            sideLength = newValue / 3.0
        }
    }
    
    // 如果你不需要计算属性，但是仍然需要在设置一个新值之前或者之后运行代码，使用 willSet 和 didSet 。
    var sideWidth: Double{
        
        willSet{
            // 但是仍然需要在设置一个新值之前或者之后运行代码
        }
        
        didSet{
            // 但是仍然需要在设置一个新值之前或者之后运行代码
        }
    }
    
    
    init(sideLength: Double, name: String?) {
        self.sideLength = sideLength
        self.name = name
        self.sideWidth = 0.0
    }
    
}

//MARK: - <sort排序>
extension ViewController{
    
    // 1. 使用sort方法和闭包对数组进行排序
    func sortFunc() -> Void {
        var array: [Int] = [3, 6, 1, 7, 2, 4, 9, 5, 8]
        
        // 从大到小对数组排序
        func xx(num1: Int, num2: Int) -> Bool {
            return num1 > num2
        }
        
        array.sort(by: xx)
        
//        array.sort(by: {(num1: Int, num2: Int) -> Bool in return num1 > num2 })
        
        print("sort ---- \(array)")
        
        
    }
    
    // 2.可以不用指定参数类型，编译器会帮我们判断
    func sortFunc1() -> Void {
        
        var array: Array<Int> = [3, 6, 1, 7, 2, 4, 9, 5, 8]
        array.sort(by: {(num1, num2) in
            return num1 > num2
        })
        
        print("sort ---- \(array)")
        
    }
    
    // 3. 可以省略参数名，直接根据数字来引用参数
    func sortFunc2() -> Void {
        
        var array: Array<Int> = [3, 6, 1, 7, 2, 4, 9, 5, 8]
        array.sort(by: {
            return $0 > $1
        })
        print("sort ---- \(array)")

    }
    
    // 4. 如果闭包只有一行代码，可以省略return
    func sortFunc3() -> Void {
        var array: Array<Int> = [3, 6, 1, 7, 2, 4, 9, 5, 8]
        array.sort(by: {
            $0 > $1
        })
    }
    
    // 5. 如果闭包是函数调用的最后一个参数，可以将闭包放到括号外面，提高代码的可读性
    func sortFunc4() -> Void {
        var array: Array<Int> = [3, 6, 1, 7, 2, 4, 9, 5, 8]
        array.sort(){
            $0 > $1
        }
    }
    
}


//MARK: - <闭包>
extension ViewController{
    
    
    func bibao() -> Void {
        // 1.可以使用 {} 来创建 一个匿名闭包
       let bibao1 = numbers.map({
            (number: Int) -> Int in
            let result = 3 * number
            return result
        })
        
        print("bibao1 ---- \(bibao1)")
        
        
        // 有很多种创建更简洁的闭包的方法。如果一个闭包的类型已知，比如作为一个回调函数，你可以忽略参数的类型和返回值。单个语句闭包会把它语句的值当做结果返回。
        let mappedNumbers = numbers.map({ number in 3 * number })
        print("mappedNumbers ---- \(mappedNumbers)")
        
    }
    
    
    
    
}


//MARK: - <函数>
extension ViewController{
    /// 函数嵌套
    func returnFifteen() -> Int {
        
        var y = 10
        func add(){
            y += 5
        }
        add()
        return y
    }
    
    // 函数作为返回值
    func makeIncrementer() -> ((Int) -> Int) {
        
        func addOne(number: Int) -> Int {
            return 1 + number
        }
        return addOne
    }
    
    // 函数作为参数
    func hasAnyMatches(list:[Int],condition:(Int) -> Bool) -> Bool {
        for item in list {
            if condition(item) {
                return true
            } }
        return false
    }
    
    func lessThanTen(number: Int) -> Bool {
        return number < 10
    }
    
    
    
    
}


//MARK: - <高阶函数map、flatMap、filter、reduce>
extension ViewController{
    /**!
     1 map：可以对数组中的每一个元素做一次处理
     */
    func mapFunc() {
        
        // 计算字符串的长度
        let stringArray = ["Objective-C", "Swift", "HTML", "CSS", "JavaScript"]
        func stringCount(string: String) -> Int {
            return string.characters.count
        }
        
        //        let result = stringArray.map(stringCount)
        
        // 你可以使用 {} 来创建 一个匿名闭包
        //        let result = stringArray.map({string -> Int in
        //            return string.characters.count
        //        })
        
        // $0代表数组中的每一个元素
        let result = stringArray.map{
            return $0.characters.count
        }
        print(result)
    }
    
    /**!
     2 flatMap与map不同之处：
     （1）flatMap返回后的数组中不存在nil，同时它会把Optional解包
     （2）flatMap还能把数组中存有数组的数组（二维数组、N维数组）一同打开变成一个新的数组
     （3）flatMap也能把两个不同的数组合并成一个数组，这个合并的数组元素个数是前面两个数组元素个数的乘积
     */
    
    func flatMapFunc() {
        let fruits = ["Apple", "Orange", "Puple"]
        let counts = [2, 3, 5]
        
        let array = counts.flatMap { count in
            fruits.map ({ fruit in
                return fruit + "  \(count)"
            })
        }
        
        print(array)
        // ["Apple  2", "Orange  2", "Puple  2", "Apple  3", "Orange  3", "Puple  3", "Apple  5", "Orange  5", "Puple  5"]

    }
    
    
    /**!
     3 filter：过滤，可以对数组中的元素按照某种规则进行一次过滤
     */
    func filerFunc()  {
        // 筛选出字符串的长度小于10的字符串
        let stringArray = ["Objective-C", "Swift", "HTML", "CSS", "JavaScript"]
        
        func stringCountLess10(string: String) -> Bool {
            return string.characters.count < 10
        }
        
       let _ = stringArray.filter(stringCountLess10)
        
       let _ = stringArray.filter({string -> Bool in
            return string.characters.count < 10
        })
        
        // $0表示数组中的每一个元素
        let result = stringArray.filter{
            return $0.characters.count < 10
        }
        
        print(result)
    }
    
    
    /**!
     4 reduce：计算，可以对数组的元素进行计算
     */
    
    func reduceFunc()  {
        // 将数组中的每个字符串用‘、’拼接
        let stringArray = ["Objective-C", "Swift", "HTML", "CSS", "JavaScript"]
        
        func appendString(string1: String, string2: String) -> String {
            return string1 == "" ? string2 : string1 + "、" + string2
        }
        
        // reduce方法中的第一个参数是初始值
        let _ = stringArray.reduce("", appendString)
        
        let _ = stringArray.reduce("", {(string1, string2) -> String in
            return string1 == "" ? string2 : string1 + "、" + string2
        })
        
        // $0表示计算后的结果, $1表示数组中的每一个元素
        let result = stringArray.reduce("", {
            return $0 == "" ? $1 : $0 + "、" + $1
        })
        
        print(result)
    }
}



//  MARK: - 代理
extension ViewController{
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return datas.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = UITableViewCell()
        cell.textLabel?.text = "\(indexPath.row)" + "-----" + datas[indexPath.row]
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        var vc : BaseViewController?
        
        switch indexPath.row {
        case 0:
            vc = Enum()
            
        case 1:
            vc = Struct()
            
        case 2:
            vc = Protocol()
            
        default:
            break
        }
        
        navigationController?.pushViewController(vc!, animated: true)
        
    }
}




