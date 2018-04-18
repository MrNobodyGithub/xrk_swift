
自整理
/**
* 整理  自定义view
A 满足 自定义view 的 xib 调用 以及 init 调用
B 步骤如下
1 创建 view.swift  view.xib
2 view.xib 注意 class 添加在 file's Owner  而不是 view  (oc 可以)
3 view.swift  初始化 xib eg:
let v = Bundle.main.loadNibNamed("ZTestView", owner: self, options: nil)?.last as! UIView
v.frame = bounds
self.addSubview(v)
4 控制器 init 初始化 调用 ok
*/
