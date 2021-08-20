//
//  Device.swift
//  SmartStuff
//
//  Created by Григорий Виняр on 18.08.2021.
//

import UIKit

struct DeviceData: Codable {
    
    let data: [Device]
}

struct Device: Codable, Equatable {
    
    let id: Int
    let name: String
    let icon: String
    let isOnline: Bool
    let type: Int
    let status: String
    let lastWorkTime: Int
    
}
