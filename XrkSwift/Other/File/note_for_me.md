#  block
1. 在B中声明一个block
typealias TestBlock = (String)->()
2. 持有一个block变量
var blo: TestBlock?
3. 调用
self.blo?("It is block test")
4. 在`A`中需要接受值的地方
let b = B()
b.blo = {str in
print("test block---\\(str)")
}
 
