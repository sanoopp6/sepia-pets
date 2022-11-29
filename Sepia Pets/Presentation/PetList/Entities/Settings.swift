//
//  Settings.swift
//  Sepia Pets
//
//  Created by Sanoop PM on 30/11/22.
//

import Foundation

struct Config: Decodable {
    var settings: Settings
}

struct Settings: Decodable {
    var workHours: String?
}

