//
//  BeritaTableViewController.swift
//  Portal Berita
//
//  Created by Rasyid Respati Wiriaatmaja on 30/01/20.
//  Copyright © 2020 rasyidrw. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class BeritaTableViewController: UITableViewController {
    
    var dataBerita = [[String : String]]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let url = "http://localhost:8080/portal_berita/lihat_berita.php"
        
        let param : [String : String] = ["table" : "tb_berita"]
        
        Alamofire.request(url, method: .get, parameters: param).responseJSON {
            (response) in
            
            let allJSON = JSON(response.result.value as Any)
            
            self.dataBerita = allJSON["data_berita"].arrayObject as! [[String : String]]
            
            if self.dataBerita.count > 0 {
                self.tableView.reloadData()
            }
            
        }
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    
    // MARK: - Table view data source
    
//    override func numberOfSections(in tableView: UITableView) -> Int {
//        // #warning Incomplete implementation, return the number of sections
//        return 0
//    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return dataBerita.count
    }
    
    
     override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
     
     // Configure the cell...
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellBerita", for: indexPath) as! BeritaTableViewCell
        
        let data = dataBerita[indexPath.row]
        let judul = data["judul_berita"]
        let gambar = data["image_berita"]
        
        //tampilkan judul
        cell.cellTitle.text = judul
        
        //tampilkan gambar
        let urlImage = "http://localhost:8080/portal_berita/image/\(gambar!)"
        Alamofire.request(urlImage).responseJSON {(dataGambar) in
            
            let gambar = dataGambar.data
            cell.cellImage.image = UIImage(data: gambar!)
        }
     
     return cell
        
     }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        //ambil data dari json
        let data = dataBerita[indexPath.row]
        let judul = data["judul_berita"]
        let gambar = data["image_berita"]
        let berita = data["isi_berita"]
        let penulis = data["penulis_berita"]
        
        //menyiapkan
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let destination = storyboard.instantiateViewController(withIdentifier: "detail") as! DetailBeritaViewController
        
        //kirim data
        destination.berita = berita
        destination.penulis = penulis
        destination.gambar = gambar
        destination.judul = judul
        
        show(destination, sender: self)
    }
     
    
    /*
     // Override to support conditional editing of the table view.
     override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
     // Return false if you do not want the specified item to be editable.
     return true
     }
     */
    
    /*
     // Override to support editing the table view.
     override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
     if editingStyle == .delete {
     // Delete the row from the data source
     tableView.deleteRows(at: [indexPath], with: .fade)
     } else if editingStyle == .insert {
     // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
     }
     }
     */
    
    /*
     // Override to support rearranging the table view.
     override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
     
     }
     */
    
    /*
     // Override to support conditional rearranging of the table view.
     override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
     // Return false if you do not want the item to be re-orderable.
     return true
     }
     */
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
}
