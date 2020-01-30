//
//  ViewController.swift
//  Portal Berita
//
//  Created by Rasyid Respati Wiriaatmaja on 30/01/20.
//  Copyright © 2020 rasyidrw. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let url = "http://localhost:8080/portal_berita/lihat_berita.php"
        
        let param : [String : String] = ["table" : "tb_berita"]
        
        Alamofire.request(url, method: .get, parameters: param).responseJSON {
            (response) in
            
            //ambil semua json
            let json = JSON(response.result.value as Any)
            
            //ambil data json tertentu
            let status = json["status"].stringValue
            print(status)
            
            //ambil data json dari json array dengan index tertentu
            let dataBerita = json["data_berita"].array
            let object = dataBerita![0]
            let judulBerita = object["judul_berita"].stringValue
            print(judulBerita)
            
            //ambil semua data dari json array
            for data in dataBerita!{
                let judulBerita = data["judul_berita"].stringValue
                print(judulBerita)
                
            }
        }
        // Do any additional setup after loading the view.
    }


}

