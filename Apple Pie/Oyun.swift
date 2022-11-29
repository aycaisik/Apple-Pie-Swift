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
    var formatlanmisKelime : String {
        var kelimeTahmini :String = ""
        for char in kelime{
            if harfTahminleri.contains(char){
                var newchar = String(char)
                kelimeTahmini.append(newchar)
            }else{
                kelimeTahmini.append("_")
            }
        }
        return kelimeTahmini
    }
    
    mutating func tahminYapildi(char : Character){
        
        harfTahminleri.append(char)
        if !kelime.contains(char){
             kalanTahminSayisi-=1
        }
        
    }
    
}
