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

/// Стандартное битовое поле.
/// Обеспечивает битовые операции подобно опциям Objective-C.
public protocol BitField: OptionSet {
}

public extension BitField where RawValue: FixedWidthInteger {
    
    /// Побитовая конъюнкция.
    static func | (lhs: Self, rhs: Self) -> Self {
        return .init(rawValue: lhs.rawValue | rhs.rawValue)
    }
    
    /// Побитовая дизъюнкция.
    static func & (lhs: Self, rhs: Self) -> Self {
        return .init(rawValue: lhs.rawValue & rhs.rawValue)
    }
    
    /// Побитовая инверсия.
    static prefix func ~ (rhs: Self) -> Self {
        return .init(rawValue: ~rhs.rawValue)
    }
    
    /// Побитовая конъюнкция c самим собой.
    static func |= (lhs: inout Self, rhs: Self) {
        lhs = lhs | rhs
    }
    
    /// Побитовая дизъюнкция c самим собой.
    static func &= (lhs: inout Self, rhs: Self) {
        lhs = lhs & rhs
    }
}
