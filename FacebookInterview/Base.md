#Base Interview Questions

###简述OC中内存管理机制
* 内存管理机制:使用引用计数管理,分为`ARC`和`MRC`
* `MRC`需要程序员自己管理内存,`ARC`则不需要.但是并不是所有对象在`ARC`环境下均不需要管理内存,子线程和循环引用并不是这样
* 与`retain`配对使用的是`release`,`retain`代表引用计数+1,`release`代表引用计数-1,当引用计数减为0时,对象则被系统自动销毁.与`alloc`配对使用的是`dealloc`,`alloc`代表为对象开辟内存空间,`dealloc`则代表销毁对象的内存空间

###readwrite,readonly,assign,retain,copy,nonatomic,atomic,strong,weak的作用

