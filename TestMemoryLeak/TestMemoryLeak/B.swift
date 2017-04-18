//
//  B.swift
//  TestMemoryLeak
//
//  Created by Admin on 3/26/17.
//  Copyright © 2017 Admin. All rights reserved.
//

import Foundation
class B {
    var a : A!
    init() {
        print(" B : INIT")
    }
    deinit {
        print("Class B ,DeInit")
    }
}
