//
//  Oyun.swift
//  Apple Pie
//
//  Created by Ayça Işık on 28.11.2022.
//

import Foundation
struct Oyun{
    var kelime : String
    var kalanTahminSayisi : Int
    var harfTahminleri : [Character]
    
    mutating func tahminYapildi(char : Character){
        
        harfTahminleri.append(char)
        if !kelime.contains(char){
             kalanTahminSayisi-=1
        }
        
    }
    
}
