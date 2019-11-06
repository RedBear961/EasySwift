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

import UIKit

/// Псевдоним, чтобы заглушать предупреждение компилятора.
public typealias WebView = UIWebView

/// Протокол рисуемого объекта.
/// Позволяет сделать из UIView картинку.
public protocol Drawable where Self: UIView {
}

public extension Drawable {
    
    /// Отрисовывает UIView и возвращает
    /// получившуюся картинку.
    func draw(in rect: CGRect, opaque: Bool = false, scale: CGFloat = UIScreen.main.scale) -> UIImage? {
        let origin = bounds
        defer {
            bounds = origin
            UIGraphicsEndImageContext()
        }
        
        bounds = rect
        UIGraphicsBeginImageContextWithOptions(rect.size, opaque, scale)
        layer.render(in: UIGraphicsGetCurrentContext()!)
        return UIGraphicsGetImageFromCurrentImageContext()
    }
}

extension UIView: Drawable {
}

public extension UICollectionViewCell {
    
    /// Идентификатор переиспользования.
    class var reuseIdentifier: String {
        return String(describing: type(of: self))
    }
}

public extension UINib {
    
    /// Создает UINib по имени класса.
    convenience init<V>(for _type: V.Type, bundle: Bundle? = nil) where V: UIView {
        var string = String(describing: type(of: _type))
        if string.contains(".") {
            let substr = string.split(separator: ".").first!
            string = String(substr)
        }
        self.init(nibName: string, bundle: bundle)
    }
}

public extension UIImage {
    
    /// Пытается получить CIImage.
    func ciImage() -> CIImage? {
        if let result = ciImage {
            return result
        }
        
        if let cgImage = cgImage {
            let result = CIImage(cgImage: cgImage)
            return result
        }
        
        return nil
    }
    
    /// Изменяет масштаб изображение одинаково по обеим осям.
    func scaled(by scale: CGFloat) -> UIImage? {
        return scaled(by: scale, y: scale)
    }
    
    /// Изменяет масштаб изображение.
    func scaled(by x: CGFloat, y: CGFloat) -> UIImage? {
        guard let ciImage = ciImage() else {
            return nil
        }
        
        let result = ciImage.transformed(by: CGAffineTransform(scaleX: x, y: y))
        return result.uiImage
    }
    
    /// Выполняет кроп изображение в указанном ректе.
    func cropped(in rect: CGRect) -> UIImage? {
        guard let ciImage = ciImage() else {
            return nil
        }
        
        let ciOrigin = CGPoint(x: 0, y: size.height - rect.height)
        let ciRect = CGRect(origin: ciOrigin, size: rect.size)
        let cropped = ciImage.cropped(to: ciRect)
        return cropped.uiImage
    }
    
    /// Меняет масштаб изображения до указанного размера.
    func scaled(to size: CGSize) -> UIImage? {
        let x = size.width / self.size.width
        let y = size.height / self.size.height
        return scaled(by: x, y: y)
    }
    
    /// Масштабирует изображение по ширине.
    func scaled(toWidth w: CGFloat) -> UIImage? {
        let x = w / size.width
        return scaled(by: x)
    }
    
    /// Масштабирует изображение по высоте.
    func scaled(toHeight h: CGFloat) -> UIImage? {
        let y = h / size.height
        return scaled(by: y)
    }
}

public extension UIScreen {
    
    /// Размер экрана.
    var size: CGSize {
        return bounds.size
    }
}

public extension UIEdgeInsets {
    
    /// Создает экземпляр отступов с одинаковым значением
    /// для всех сторон.
    init(_ value: CGFloat) {
        self.init(
            top: value,
            left: value,
            bottom: value,
            right: value
        )
    }
}

public extension UIDevice {
    
    /// Текущая ориентация бара состояния.
    var statusBarOrientation: UIInterfaceOrientation {
        return UIApplication.shared.statusBarOrientation
    }
}

extension UIView: RectPresentable {
    
    /// Вычисляет отношение высоты и ширины отображени
    /// к высоте и ширине другого отображения.
    func relation(to view: UIView) -> (wRatio: CGFloat, hRatio: CGFloat) {
        return self.relation(to: view.frame)
    }
}

public extension UIView {
    
    /// Радиус углов отображения.
    var cornerRadius: CGFloat {
        get {
            return layer.cornerRadius
        }
        set(value) {
            layer.cornerRadius = value
        }
    }
}

public extension UIView {
    
    /// Анимирует изменение отображения.
    static func animate(
        delay: TimeInterval = 0,
        with duration: TimeInterval,
        options: UIView.AnimationOptions = .curveEaseInOut,
        animations: @escaping () -> Void,
        completion: ((Bool) -> Void)? = nil
    ) {
        UIView.animate(
            withDuration: duration,
            delay: delay,
            options: options,
            animations: animations,
            completion: completion
        )
    }
    
    /// Анимирует изменение отображения с помощью прыгающей анимации.
    static func spring(
        delay: TimeInterval = 0,
        with duration: TimeInterval,
        damping: CGFloat,
        velocity: CGFloat,
        options: UIView.AnimationOptions = .curveEaseInOut,
        animations: @escaping () -> Void,
        completion: ((Bool) -> Void)? = nil
    ) {
        UIView.animate(
            withDuration: duration,
            delay: delay,
            usingSpringWithDamping: damping,
            initialSpringVelocity: velocity,
            options: options,
            animations: animations,
            completion: completion
        )
    }
}

public extension UINavigationController {
    
    /// Корневой контроллер в стеке. Может отсутствовать.
    var root: UIViewController? {
        return viewControllers.first
    }
}

/// Определяет, является ли текущая ориентация портретной.
public func isPortrait() -> Bool {
    return UIDevice.current.statusBarOrientation.isPortrait
}

/// Определяет, является ли текущая ориентация альбомной.
public func isLandscape() -> Bool {
    return UIDevice.current.statusBarOrientation.isLandscape
}

public extension UIView {
    
    /// Скрывает отображение за указанное время.
    func hide(with duration: TimeInterval) {
        UIView.animate(withDuration: duration) { [weak self] in
            self?.alpha = 0
        }
    }
}
