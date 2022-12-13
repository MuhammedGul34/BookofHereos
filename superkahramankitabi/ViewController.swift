//
//  ViewController.swift
//  superkahramankitabi
//
//  Created by Muhammed Gül on 12.10.2022.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource  {

    @IBOutlet weak var tebleView: UITableView!
    var superKahramanIsimleri = [String]()
    var superKahramanGorselIsimleri = [String]()
    var secilenIsim = ""
    var secilenGorsel = ""
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view
        tebleView.delegate = self
        tebleView.dataSource = self
        
        
        
        superKahramanIsimleri.append("Spiderman")
        superKahramanIsimleri.append("Superman")
        superKahramanIsimleri.append("Batman")
        superKahramanIsimleri.append("Ironman")
        superKahramanIsimleri.append("Captain America")
        
      //  var superKahramanGorselIsimleri = [UIImage]()
      //  superKahramanGorselIsimleri.append(UIImage(named: "batman")!)
        
        
        superKahramanGorselIsimleri.append("spiderman")
        superKahramanGorselIsimleri.append("superman")
        superKahramanGorselIsimleri.append("batman")
        superKahramanGorselIsimleri.append("ironman")
        superKahramanGorselIsimleri.append("captainamerica")
        
        
    }
//numberOfRowsInSection -> kac tane row olacak
//cellForRow atIndexPath -> hicrenin içerisinde neler gösterilecek

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return superKahramanIsimleri.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = superKahramanIsimleri[indexPath.row]
        return cell
    }
    
//    func tableView(_ tableView: UITableView, commit editingStyle indexPath: UITableViewCell.EditingStyle, forRawAt indexPath: IndexPath) {
//        if editingStyle == .delete {
//            superKahramanIsimleri.remove(at: indexPath.row)
//            superKahramanGorselIsimleri.remove(at: indexPath.row)
//            tebleView.deleteRows(at: [indexPath], with: UITableView.RowAnimation.fade)
//        }
//    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
         secilenIsim = superKahramanIsimleri[indexPath.row]
         secilenGorsel = superKahramanGorselIsimleri[indexPath.row]
        performSegue(withIdentifier: "toDetailVC", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDetailVC" {
            let destinationVC = segue.destination as! DetailsViewController
            destinationVC.secilenKahramanIsmi = secilenIsim
            destinationVC.secilenKahramanGorselIsmi = secilenGorsel
        }
    }
}

