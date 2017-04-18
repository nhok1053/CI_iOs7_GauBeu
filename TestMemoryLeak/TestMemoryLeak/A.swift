//
//  A.swift
//  TestMemoryLeak
//
//  Created by Admin on 3/26/17.
//  Copyright © 2017 Admin. All rights reserved.
//

import Foundation
class A {
    var b : B!
    init() {
        print("INIT")
    }
    deinit {
        print("Class A ,DeInit")
    }
}
