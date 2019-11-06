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

public extension CGRect {
    
    /// X-координата, описываемого прямоугольника.
    /// Начало координат лежит к левом вверхнем углу.
    var x: CGFloat {
        get {
            return origin.x
        }
        set(value) {
            origin.x = value
        }
    }
    
    /// Y-координата, описываемого прямоугольника.
    /// Начало координат лежит к левом вверхнем углу.
    var y: CGFloat {
        get {
            return origin.y
        }
        set(value) {
            origin.y = value
        }
    }
    
    /// Центр описываемого прямоугольника.
    var center: CGPoint {
        return CGPoint(x: width / 2, y: height / 2)
    }
    
    /// Обнуляет координаты и возвращает новый экземпляр ректа,
    /// сохранив размер.
    var bounds: CGRect {
        return CGRect(origin: .zero, size: size)
    }
    
    /// Определяет координаты внутри `rect`, такие
    /// что `self` находился бы по центру.
    func center(in rect: CGRect) -> CGPoint {
        let center = rect.center
        return CGPoint(
            x: center.x - width / 2,
            y: center.y - height / 2
        )
    }
    
    /// Создает новый рект с отступами по осям X и/или Y.
    func offset(dx: CGFloat = 0, dy: CGFloat = 0) -> CGRect {
        return self.offsetBy(dx: dx, dy: dy)
    }
}
