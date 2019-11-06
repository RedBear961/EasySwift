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

public extension Comparable {
    
    /// Сравнивает себя с другим объектов этого же типа.
    /// Находит какой объект меньше, а какой больше.
    @available(*, deprecated, renamed: "amplitude(with:)")
    func compare(with other: Self) -> (max: Self, min: Self) {
        return self > other ? (self, other) : (other, self)
    }
    
    /// Производит сравнение себя с другим объектом.
    /// Находит минимум и максимум из сравниваемой пары.
    ///
    /// Строит именованный кортеж для пары объектов, находя
    /// минимум из максимум.
    ///
    ///     let one = 3
    ///     let two = 5
    ///     let result = one.amplitude(with: two)
    ///     print(result) // (max: 5, min: 3)
    ///
    /// - Returns: Именованный кортеж минимума и максимума.
    func amplitude(with other: Self) -> (max: Self, min: Self) {
        return self > other ? (self, other) : (other, self)
    }
}
