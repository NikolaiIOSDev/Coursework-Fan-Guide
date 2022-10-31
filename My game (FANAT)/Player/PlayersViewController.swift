//
//  PlayersViewController.swift
//  My game (FANAT)
//
//  Created by Николай Федоров on 05.01.2022.
//

import UIKit

class PlayersViewController: UIViewController{
    
    var players:[Sport]=[]
    @IBOutlet var myTableViewSwift: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title="Спортсмены"
        navigationController?.navigationBar.prefersLargeTitles=true
        myTableViewSwift.register(UITableViewCell.self, forCellReuseIdentifier: "CellTwo")
    }
    
}

extension PlayersViewController:UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        players.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell=myTableViewSwift.dequeueReusableCell(withIdentifier: "CellTwo", for: indexPath)
        let people=players[indexPath.row]
        cell.textLabel?.text=people.namefistNamePeople
        return cell
        
    }
    
    
}
