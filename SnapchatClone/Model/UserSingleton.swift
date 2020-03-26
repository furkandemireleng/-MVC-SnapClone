//
//  UserSingleton.swift
//  SnapchatClone
//
//  Created by MacxbookPro on 20.03.2020.
//  Copyright © 2020 MacxbookPro. All rights reserved.
//

import Foundation

class UserSingeton {
    static let sharedUserInfo = UserSingeton()
    
    var email = ""
    var username = ""
    
    
    private  init(){
        
    }
    
}
