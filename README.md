<p align="center">
    <img src="https://github.com/mpangburn/Expressions/blob/master/Images/Banner.png?raw=true" width="480" max-width="90%" alt="Expressions"/>
</p>

<p align="center">
    <img src="https://img.shields.io/badge/Swift-4.0-orange.svg"/>
    <img src="https://img.shields.io/packagist/l/doctrine/orm.svg"/>
    <a href="https://twitter.com/pangburnout">
        <img src="https://img.shields.io/badge/contact-@pangburnout-blue.svg?style=flat" alt="Twitter: @pangburnout" />
    </a>
</p>

Arithmetic and logical expressions elegantly modeled and visualized using protocol-oriented binary trees with value semantics.

## Features
- [x] Model arithmetic and logical expressions using binary trees.
- [x] Write expressions in code in the same manner as they would be written for evaluation, i.e. making full use of literals and both unary and binary operators.
- [x] Visualize expressions by rendering image representations, which can be easily seen using the Xcode Playground QuickLook feature.
- [x] Animate the evaluation of expressions using `UIView`s, and observe these animations using the Xcode Playground Live View feature.
- [x] Demonstrate the power of protocol-oriented programming by creating other simple tree structures, such as binary search trees, which gain QuickLook visualization for free.

## Contents
The principal focus of this project is to demonstrate the structure and evaluation of arithmetic and logical expressions in an elegant, expressive way. Thanks to Swift's powerful `ExpressibleBy*Literal` protocols and operator overloading, we can write code like this:

```swift
let expression: ArithmeticExpression<Int> = 2*(1+3)-8/4
```

and in doing so create the full tree representing this expression, which in turn can be visualized in an Xcode Playground via QuickLook:

<img src="https://github.com/mpangburn/Expressions/blob/master/Images/ArithmeticExpression.png?raw=true" width="248">

Furthermore, we can animate the evaluation of this expression by calling `animateEvaluation(of:)` in a Playground page. We can observe this animation in the Playground's Live View:

<img src="https://github.com/mpangburn/Expressions/blob/master/Images/ArithmeticExpression%20Evaluation.gif?raw=true" width="248">

In addition to arithmetic expressions, logical expressions can be similarly created, viewed, and animated.

```swift
let expression: LogicalExpression = !(true || false) && false || !true
```

<img src="https://github.com/mpangburn/Expressions/blob/master/Images/LogicalExpression%20Evaluation.gif?raw=true" width="248">

As a simple demonstration of the power of protocol-oriented programming, I've also implemented a couple of other tree structures, including a traditional binary search tree and a red-black tree, which can be visualized with QuickLook.

## Getting Started
While a brief outline of the project's contents is provided in the section above, this is a Playground-based project and ultimately better demonstrated than explained:

1. Clone the project.
2. Open **Expression.xcworkspace**.
3. Build the project.
4. Within the Expression Playground, navigate to the ArithmeticExpression page to begin.
5. See the magic through Xcode Playground's QuickLook and Live View features. Each Playground Page demonstrates a type of expression or other tree-based structure.

## License
Expressions is released under the MIT license. See [LICENSE](https://github.com/mpangburn/Expressions/blob/master/LICENSE) for details.

If you find this project to be a useful tool in learning or teaching expressions or binary trees, please reach out to me [on Twitter](https://twitter.com/pangburnout)--I'd love to hear from you.

