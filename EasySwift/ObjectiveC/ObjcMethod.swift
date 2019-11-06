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

import ObjectiveC

/// Высокоуровневая обертка над Obj-C методом.
public struct ObjCMethod {
    
    /// Указатель на Obj-C метод.
    public let pointer: OpaquePointer
    
    /// Стандартный конструктор из Obj-C метода.
    public init(_ pointer: OpaquePointer) {
        self.pointer = pointer
    }
}

extension ObjCMethod {
    
    /// Селектор Obj-C метода.
    /// Является оберткой над строкой и представляет собой
    /// сигнатуру вызова.
    public var name: Selector {
        return method_getName(pointer)
    }
    
    /// Имплементация Obj-C метода.
    public var implementation: IMP {
        return method_getImplementation(pointer)
    }
    
    /// Тип возвращаемого значения метода.
    /// Если метод не возвращает значение, его типом является тип `Void`.
    public var returnType: String {
        let p = method_copyReturnType(pointer)
        return String(cString: p)
    }
    
    /// Возвращает ли метод значение.
    /// Метод не возвращает значение, если его типом является `Void`.
    public var isVoid: Bool {
        return returnType == "v"
    }
    
    /// Количество принимаемых методом аргументов.
    /// - Note: Любой метод принимает минимум 2 аргумента:
    /// указатель на `cmd` и объект, которому этот метод отправлен.
    public var numberOfArguments: Int {
        let c = method_getNumberOfArguments(pointer)
        return Int(c)
    }
    
    /// Определяет тип аргумента по его номеру.
    /// Возвращает тип аргумента или `nil`, если аргумента по этому номеру
    /// не существует.
    public func argumentType(at index: Int) -> String? {
        guard let p = method_copyArgumentType(pointer, UInt32(index)) else {
            return nil
        }
        
        return String(cString: p)
    }
}

extension ObjCMethod: CustomStringConvertible {
    
    /// Описание метода.
    public var description: String {
        return name.description
    }
}
