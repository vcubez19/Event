//
//  Models.swift
//  Event
//
//  Created by Vincent Cubit on 12/31/21.
//


import Foundation
import UIKit


struct Business {
    
    
    let businessName: String
    let businessAddress: String
    let businessPhoneNumber: String
    let businessCoverPhoto: UIImage?
    let whatThisBusinessDoes: String
    let otherBusinessNotes: String?
    let businessHours: [ Int : Int ]
    let businessRequiresMask: Bool?
    let businessCapacityLimit: Int?
    
    
}

