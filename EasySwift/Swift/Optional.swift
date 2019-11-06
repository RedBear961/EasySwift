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

public extension Optional {
    
    /// Проверяет опционал на нуль.
    ///
    ///     let number: Int? = 42
    ///     print(number.isNone) // false
    ///
    /// Используйте это рассчитываемое свойство для построения условий
    /// вместо сравнение с нулем для более явного и красивого кода.
    ///
    /// - Returns: Истину, если опционал содержит нуль.
    var isNone: Bool {
        return self == nil
    }
    
    /// Проверяет опционал на отличие от нуля.
    ///
    ///     let number: Int? = 42
    ///     print(number.isSome) // true
    ///
    /// Используйте это рассчитываемое свойство в условиях вместо
    /// сравнение с нулем для более явного и красивого кода.
    ///
    /// - Returns: Истину, если опционал отличен от нуля.
    var isSome: Bool {
        return self != nil
    }
}
