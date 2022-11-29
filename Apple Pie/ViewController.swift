//
//  ViewController.swift
//  Apple Pie
//
//  Created by Ayça Işık on 28.11.2022.
//

import UIKit

class ViewController: UIViewController {
    
    var kelimeListesi = ["elma", "kuş", "büyüleyici", "parlak", "böcek",
    "kodlama"]
    let tahminSayisi = 7
    var toplamDogru : Int = 0
    var toplamYanlis : Int = 0
        
    
  
    
    var simdikiOyun : Oyun!
    @IBOutlet weak var agacImageView: UIImageView!
    
    @IBOutlet weak var cozumLabel: UILabel!
    
    @IBOutlet weak var puanLabel: UILabel!
    
    @IBOutlet var harfButonlari: [UIButton]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        yeniTur()
    }

    @IBAction func butonTiklandi(_ sender: UIButton) {
        sender.isEnabled = false
        let harfString = sender.title(for: .normal)!
        let harf = Character(harfString.lowercased())
        simdikiOyun.tahminYapildi(char: harf)
        arayuzuGuncelle()
        oyunuGuncelle()
    }
    
    func yeniTur(){
        
        if !kelimeListesi.isEmpty{
            let yeniKelime = kelimeListesi.removeFirst()
            simdikiOyun = Oyun(kelime: yeniKelime, kalanTahminSayisi: tahminSayisi, harfTahminleri: [])
            arayuzuGuncelle()
            harfButonlariniAktiflestir((harfButonlari != nil))
        
        
        }
        else{
            harfButonlariniAktiflestir((harfButonlari != nil))
        }
        
    }
    
    func arayuzuGuncelle(){
        var harfler = [String]()
        puanLabel.text = "total dogru : \(toplamDogru) + total yanlis : \(toplamYanlis)"
        
        agacImageView.image = UIImage(named: "Tree \(tahminSayisi)")
        
        cozumLabel.text = simdikiOyun.formatlanmisKelime
    
        
        for char in simdikiOyun.formatlanmisKelime{
            var newcharım = String(char)
            harfler.append(newcharım)
            
        }
        var boslukluKelime = harfler.joined(separator: " ")
        
        cozumLabel.text = boslukluKelime
        
    }
    func oyunuGuncelle(){
        if simdikiOyun.kalanTahminSayisi==0 {
            toplamYanlis+=1
            
            yeniTur()
        };if simdikiOyun.kelime == simdikiOyun.formatlanmisKelime{
            toplamDogru+=1
            yeniTur()
            
        }else{
            arayuzuGuncelle()
        }
        
    }
    func harfButonlariniAktiflestir(_ aktif: Bool) {
      for buton in harfButonlari {
        buton.isEnabled = aktif
      }
    }
}

