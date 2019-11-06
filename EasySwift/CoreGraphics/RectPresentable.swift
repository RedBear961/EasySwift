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

/// Протокол объекта, описывающего прямоугольник.
public protocol RectPresentable {
    
    /// Описываемый прямоугуольник.
    var frame: CGRect { get set }
}

public extension RectPresentable {
    
    /// Начало координат фрейма.
    var origin: CGPoint {
        get {
            return frame.origin
        }
        set(value) {
            frame.origin = value
        }
    }
    
    /// X-координата прямоугольника.
    var x: CGFloat {
        get {
            return frame.x
        }
        set(value) {
            frame.x = value
        }
    }
    
    /// Y-координата прямоугольника.
    var y: CGFloat {
        get {
            return frame.y
        }
        set(value) {
            frame.y = value
        }
    }
    
    /// Начальный размер.
    var size: CGSize {
        get {
            return frame.size
        }
        set(value) {
            frame.size = value
        }
    }
    
    /// Ширина прямоугольника.
    var width: CGFloat {
       get {
            return frame.width
        }
        set(value) {
            frame.size.width = value
        }
    }
    
    /// Высота прямоугольника.
    var height: CGFloat {
        get {
            return frame.height
        }
        set(value) {
            frame.size.height = value
        }
    }
}

public extension RectPresentable {
    
    /// Вычисляет отношение высоты и ширины ректа
    /// к высоте и ширине другого ректа..
    func relation(to rect: CGRect) -> (wRatio: CGFloat, hRatio: CGFloat) {
        let wRatio = self.width / rect.width
        let hRatio = self.height / rect.height
        return (wRatio, hRatio)
    }
}
