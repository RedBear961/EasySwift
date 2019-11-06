/*
 * Copyright (c) 2019  WebView, Lab
 *
 * Permission is hereby granted, free of charge, to any person obtaining a copy
 * of this software and associated documentation files (the "Software"), to deal
 * in the Software without restriction, including without limitation the rights
 * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 * copies of the Software, and to permit persons to whom the Software is
 * furnished to do so, subject to the following conditions:
 *
 * The above copyright notice and this permission notice shall be included in
 * all copies or substantial portions of the Software.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
 * THE SOFTWARE.
 */

/// Модель деления с остатком.
public struct Div<T: FixedWidthInteger> {
    
    /// Левый операнд.
    public let left: T
    
    /// Правый операнд.
    public let right: T
    
    /// Целая часть.
    public let quotient: T
    
    /// Остаток.
    public let remainder: T
    
    /// Делит левый операнд на правый операнд.
    public init(lhs: T, rhs: T) {
        guard rhs != 0 else {
            fatalError("Попытка деления на ноль: \(lhs) / \(rhs)")
        }
        self.left = lhs
        self.right = rhs
        self.quotient = lhs / rhs
        self.remainder = lhs - (self.quotient * rhs)
    }
}

public extension Div {
    
    /// Меняет операнды местами и создает новую модель деления с остатком.
    func reversed() -> Div {
        return Div(lhs: right, rhs: left)
    }
}
