title: C++程序设计学习篇
tags:
  - C++
urlname: LearnC++ByMyselfAndMooc
categories:
  - C++
author: WuGenQiang
date: 2019-06-22 21:06:57
updated: 2019-06-22 21:06:57
---

-----

# 前言
程序是练会的，而不是听会和看会的，不能满足于纸上谈兵!

-----
<!--more-->

# 安装开发工具
*  [C++开发之Visual Studio 2017 安装与使用](https://blog.csdn.net/pshiping2014/article/details/81562696)

* [C++开发工具CLion安装并破解至2100年（windows10)](https://blog.csdn.net/wugenqiang/article/details/87860056)

# C++基本语法
C++ 程序可以定义为对象的集合，这些对象通过调用彼此的方法进行交互。现在让我们简要地看一下什么是类、对象，方法、即时变量。

* 对象 - 对象具有状态和行为。例如：一只狗的状态 - 颜色、名称、品种，行为 - 摇动、叫唤、吃。对象是类的实例。
* 类 - 类可以定义为描述对象行为/状态的模板/蓝图。
* 方法 - 从基本上说，一个方法表示一种行为。一个类可以包含多个方法。可以在方法中写入逻辑、操作数据以及执行所有的动作。
* 即时变量 - 每个对象都有其独特的即时变量。对象的状态是由这些即时变量的值创建的。

## 01 Hello World

![](https://raw.githubusercontent.com/wugenqiang/PictureBed/master/pictures/20190827203204.png)

接下来我们讲解一下上面这段程序：

C++ 语言定义了一些头文件，这些`头文件`包含了程序中必需的或有用的信息。上面这段程序中，包含了头文件 <iostream>。
下一行 `using namespace std;` 告诉编译器使用 std 命名空间。`命名空间`是 C++ 中一个相对新的概念。
下一行 `int main()` 是主函数，程序从这里开始执行。
下一行 `cout << "Hello World"; `会在屏幕上显示消息 "Hello World"。
下一行 `return 0;` 终止 main( )函数，并向调用进程返回值 0。



## 02 分号 & 语句块
在 C++ 中，分号是语句结束符。也就是说，每个语句必须以分号结束。它表明一个逻辑实体的结束。
```c++
x = y;
y = y+1;
add(x, y);
```
语句块是一组使用大括号括起来的按逻辑连接的语句。例如：
```c++
{
   cout << "Hello World"; // 输出 Hello World
   return 0;
}
```
## 03 标识符

C++ 标识符是用来标识变量、函数、类、模块，或任何其他用户自定义项目的名称。一个标识符以字母 A-Z 或 a-z 或下划线 _ 开始，后跟零个或多个字母、下划线和数字（0-9）。

C++ 标识符内不允许出现标点字符，比如 @、& 和 %。C++ 是区分大小写的编程语言。因此，在 C++ 中，Manpower 和 manpower 是两个不同的标识符。

下面列出几个有效的标识符：

1 | 2 | 3 | 4 | 5 
-----|-----|-----|-----|-----
mohd   |    zara  |  abc |  move_name |  a_123
myname50 |  _temp |   j   |  a23b9   |   retVal

## 04 关键字

下表列出了 C++ 中的保留字。这些保留字不能作为常量名、变量名或其他标识符名称。

1 | 2 | 3 | 4
-----|-----|-----|-----
asm |	else |	new	 | this
auto |	enum	| operator |	throw
bool |	explicit |	private |	true
break |	export |	protected |	try
case |	extern |	public |	typedef
catch |	false |	register |	typeid
char |	float |	reinterpret_cast |	typename
class	| for |	return |	union
const |	friend |	short |	unsigned
const_cast	| goto |	signed |	using
continue |	if	| sizeof |	virtual
default v	inline |	static |	void
delete |	int |	static_cast |	volatile
do	| long	| struct |	wchar_t
double |	mutable |	switch |	while
dynamic_cast |	namespace |	template |

## 05 数据类型（基本内置类型）
C++ 为程序员提供了种类丰富的内置数据类型和用户自定义的数据类型。下表列出了七种基本的 C++ 数据类型：

类型	| 关键字
---|---
布尔型 |	bool
字符型 |	char
整型 |	int
浮点型 |	float
双浮点型 |	double
无类型 |	void
宽字符型	| wchar_t

其实 wchar_t 是这样来的：

typedef short int wchar_t;
所以 wchar_t 实际上的空间是和 short int 一样。

-----