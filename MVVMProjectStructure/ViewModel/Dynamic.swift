//
//  Dynamic.swift
//  MVVMProjectStructure
//
//  Created by GLB-254 on 8/29/19.
//  Copyright © 2019 GLB-254. All rights reserved.
//

import Foundation

class Dynamic<T>{
    typealias Listener = (T) -> ()
    
    var listener:Listener?
    
    var value:T{
        didSet{
            listener?(value)
        }
    }
    
    init(_ v:T) {
        value = v
    }
    
    func bind(_ listener:Listener?){
        self.listener = listener
    }
    
    func bindAndFire(_ listener:Listener?){
        self.listener = listener
        listener?(value)
    }
    
}
