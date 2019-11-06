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

import CoreGraphics

public extension CGSize {
    
    /// Меняет местами ширину и высоту.
    var swaped: CGSize {
        return CGSize(width: height, height: width)
    }
    
    /// Новый экземпляр размера с округленными значенияям .
    var rounded: CGSize {
        var size = self
        size.round()
        return size
    }
    
    /// Вычисляет площадь, описываемую свойства ширины и высоты.
    /// Возвращает площадь, полученную из умножения ширины на высоту.
    var area: CGFloat {
        return width * height
    }
    
    /// Вычисляет оотношение ширины к высоте.
    /// Вернет `nil`, если ширина или высота равны нулю.
    var ratio: CGFloat? {
        if width.isZero || height.isZero {
            return nil
        }
        return width / height
    }
    
    /// Создает рект для текущего размера с нулевыми координатами.
    var toBounds: CGRect {
        return CGRect(origin: .zero, size: self)
    }
    
    /// Центр описываемого прямоугольника.
    var center: CGPoint {
        return CGPoint(x: width / 2, y: height / 2)
    }
    
    /// Конструктор `CGSize` с равными шириной и высотой.
    /// Принимает на вход значение `value`,  которому будут равны
    /// свойства `width` и `height`.
    init(value: CGFloat) {
        self.init(width: value, height: value)
    }
    
    /// Округляет высоту и ширину до целых чисел.
    mutating func round() {
        width = Darwin.round(width)
        height = Darwin.round(height)
    }
    
    /// Масштабирует размер по ширине и высоте равноверно.
    func scaledBy(_ value: CGFloat) -> CGSize {
        return CGSize(
            width: width * value,
            height: height * value
        )
    }
    
    /// Масштабирует размер по ширине и высоте.
    func scaledBy(dWidth: CGFloat = 1, dHeight: CGFloat = 1) -> CGSize {
        return CGSize(
            width: width * dWidth,
            height: height * dHeight
        )
    }
    
    /// Рассчитывает отношение к другому размеру.
    func relation(to size: CGSize) -> (width: CGFloat, height: CGFloat) {
        return (
            width: width / size.width,
            height: height / size.height
        )
    }
}
