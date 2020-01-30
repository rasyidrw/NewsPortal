//
//  DetailBeritaViewController.swift
//  Portal Berita
//
//  Created by Rasyid Respati Wiriaatmaja on 30/01/20.
//  Copyright © 2020 rasyidrw. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class DetailBeritaViewController: UIViewController {

    @IBOutlet weak var detailGambar: UIImageView!
    @IBOutlet weak var detailPenulis: UILabel!
    @IBOutlet weak var detailJudul: UILabel!
    @IBOutlet weak var detailBerita: UITextView!
    
    var gambar : String?
    var judul : String?
    var berita : String?
    var penulis : String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let urlImage = "http://localhost:8080/portal_berita/image/\(gambar!)"
        Alamofire.request(urlImage).responseJSON {(dataGambar) in
            
            let gambar = dataGambar.data
            self.detailGambar.image = UIImage(data: gambar!)
        }

        detailJudul.text = judul
        detailPenulis.text = penulis
        detailBerita.text = berita
        detailBerita.textAlignment = NSTextAlignment.justified
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
