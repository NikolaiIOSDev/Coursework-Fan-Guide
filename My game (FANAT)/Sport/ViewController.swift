//
//  ViewController.swift
//  My game (FANAT)
//
//  Created by Николай Федоров on 04.01.2022.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var myTableView: UITableView!
    
    
    var allSport=[
        Sport(namefistNamePeople: "Флойд Майвейзер"),
        Sport(namefistNamePeople: "Криштиано Рональдо"),
        Sport(namefistNamePeople: "Леброн Джеймс"),
        Sport(namefistNamePeople: "Майкл Фелпс"),
        Sport(namefistNamePeople: "Йохан Сундштайн")
    ]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title="Вид спорта"
        navigationController?.navigationBar.prefersLargeTitles=true
        myTableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
    }


}

extension ViewController:UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        allSport.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell=tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        let sport=allSport[indexPath.row]
        cell.textLabel?.text=sport.namefistNamePeople
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyBoard=UIStoryboard(name: "Main", bundle: .main)
        let viewController=storyBoard.instantiateViewController(identifier: "people")
        
        
        
        
        myTableView.deselectRow(at: indexPath, animated: true)
        navigationController?.pushViewController(viewController, animated: true)
    }
}
