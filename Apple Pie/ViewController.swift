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
    var toplamDogru = 0
    var toplamYanlis = 0
    
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
    }
    
    func yeniTur(){
        let yeniKelime = kelimeListesi.removeFirst()
        simdikiOyun = Oyun(kelime: yeniKelime, kalanTahminSayisi: tahminSayisi, harfTahminleri: [])
        arayuzuGuncelle()
        
    }
    
    func arayuzuGuncelle(){
        puanLabel.text = "total dogru : \(toplamDogru) + total yanlis : \(toplamYanlis)"
        
        agacImageView.image = UIImage(named: "Tree \(tahminSayisi)")
        
    }
    
}

