//
//  Quote.swift
//  PensamentosApp
//
//  Created by Caio Cardozo on 30/06/18.
//  Copyright © 2018 Caio Cardozo. All rights reserved.
//

import Foundation

struct Quote : Codable{
    
    let quote: String
    let author: String
    let image: String
    
    var quoteFormatted: String{
        return " ❝" + quote + "❞ "
    }
    
    var authorFormatted: String{
        return "- " + author + " -"
    }
}
