//
//  DebugTools.swift
//  Pancake
//
//  Created by mxa on 04.09.2017.
//  Copyright © 2017 0bmxa. All rights reserved.
//

// String from 4 char error code
extension String {
    init(fourCharCode: FourCharCode) {
        var mutable4CC = fourCharCode.bigEndian
        let cString = withUnsafePointer(to: &mutable4CC) {
            return $0.withMemoryRebound(to: CChar.self, capacity: 4) {
                return $0
            }
        }
        self = String(cString: cString)
    }
}

func print(_ items: Any..., separator: String = " ", terminator: String = "\n") {
    #if DEBUG
        let message = items.reduce("[PANCAKE]") { $0 + " " + String(describing: $1) }
        Swift.print(message, separator: separator, terminator: terminator)
        //NSLog("%@", message)
    #endif
}
