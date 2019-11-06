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

open class ESAppDelegate: UIResponder, UIApplicationDelegate {
    
    /// Возвращает конфигурацию создания и использования новой сцены.
    @available(iOS 13.0, *)
    open func application(
        _ application: UIApplication,
        configurationForConnecting scene: UISceneSession,
        options: UIScene.ConnectionOptions
    ) -> UISceneConfiguration {
        return self.application(application, didConnect: scene)
    }
    
    /// Возвращает конфигурацию создания и использования новой сцены.
    @available(iOS 13.0, *)
    open func application(
        _ application: UIApplication,
        didConnect session: UISceneSession
    ) -> UISceneConfiguration {
        return UISceneConfiguration.default(role: session.role)
    }
}

@available(iOS 13.0, *)
open class ESSceneDelegate: UIResponder, UIWindowSceneDelegate {
    
    /// Сообщает делегату о добавлении сцены в приложение.
    open func scene(
        _ scene: UIScene,
        willConnectTo session: UISceneSession,
        options connectionOptions: UIScene.ConnectionOptions
    ) {
        if let windowScene = scene as? UIWindowScene {
            windowSceneWillConnect(windowScene)
        }
    }
    
    /// Сообщает делегату о добавлении оконной сцены в приложение.
    open func windowSceneWillConnect(_ scene: UIWindowScene) {}
}

@available(iOS 13.0, *)
public extension UISceneConfiguration {
    
    /// Возвращает конфигурацию сцены для указанной роли с именем `Default Configuration`.
    static func `default`(role: UISceneSession.Role) -> Self {
        return self.init(name: "Default Configuration", sessionRole: role)
    }
}
