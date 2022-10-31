//
//  SwimingViewController.swift
//  My game (FANAT)
//
//  Created by Николай Федоров on 07.01.2022.
//

import UIKit

class SwimingViewController: UIViewController {
    
    @IBOutlet var myTableView: UITableView!
    
    var allSwiming:[PeopleSport]=[
        PeopleSport(fullName: "Майкл Фелпс",styleSport:"Плавание",comanda: "Пловец США",recordWin: "23-к олимпийский чемп",origin: "США, Балтимор",citizenship: "США",height: "193 см",weight: "90 кг"),
        
        PeopleSport(fullName: "Иан Торп",styleSport: "Плавание",comanda: "Пловец Австралийский",recordWin: "5-к олимпиский чемп",origin: "Австралия, Сидней",citizenship: "Сидней",height: "196 см",weight: "104 кг"),
        
        PeopleSport(fullName: "Аарон Пирсол",styleSport: "Плавание",comanda: "Пловец США",recordWin: "3-к олимпиский чемп",origin: "США, Калифорния",citizenship: "США",height: "193 см",weight: "91 кг"),
        
        PeopleSport(fullName: "Лариса Ильченко",styleSport: "Плавание",comanda: "Пловчиха России",recordWin: "8-к чемпионка мира",origin: "Россия, Волгоград",citizenship: "Россия",height: "171 см",weight: "60 кг"),
        
        PeopleSport(fullName: "Кэти Ледеки",styleSport: "Плавание",comanda: "Пловчиха США",recordWin: "7-к олимпиская чемп",origin: "США, Вашингтон",citizenship: "США",height: "183 см",weight: "65 кг"),
    
    ]
    
    var allFilter=[PeopleSport]()
    let searchController=UISearchController(searchResultsController: nil)
    var searchBarIsEmpty:Bool{
        guard let text=searchController.searchBar.text else {
            return false
        }
        return text.isEmpty
    }
    var isFiltering:Bool{
        return searchController.isActive && !searchBarIsEmpty
    }
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        myTableView.register(UITableViewCell.self, forCellReuseIdentifier: "CellFive")
        navigationItem.title="Плавание"
        navigationController?.navigationBar.prefersLargeTitles=true
        
        //Установка SearchController
        searchController.searchResultsUpdater=self
        searchController.obscuresBackgroundDuringPresentation=false
        searchController.searchBar.placeholder="Поиск по спортсменам"
        navigationItem.searchController=searchController
        definesPresentationContext=true
        
    }
}

extension SwimingViewController:UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if isFiltering{
            return allFilter.count
        }
        
       return allSwiming.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell=myTableView.dequeueReusableCell(withIdentifier: "CellFive", for: indexPath)
        
        var player:PeopleSport
        
        if isFiltering{
            player=allFilter[indexPath.row]
        }else{
            player=allSwiming[indexPath.row]
        }
        
        cell.textLabel?.text=player.fullName
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let stb=UIStoryboard(name: "Main", bundle: .main)
        let vc=stb.instantiateViewController(identifier: "InfoPlayerViewController") as! InfoPlayerViewController
        
        if isFiltering{
            vc.infoPlayer=allFilter[indexPath.row]
            
        }
        else{
            vc.infoPlayer=allSwiming[indexPath.row]
        }
        
    
        navigationController?.pushViewController(vc, animated: true)
        myTableView.deselectRow(at: indexPath, animated: true)
    }
    
}

extension SwimingViewController:UISearchResultsUpdating{
    func updateSearchResults(for searchController: UISearchController) {
        filterContentForSearchText(searchController.searchBar.text!)
    }
    
    func filterContentForSearchText(_ search:String){
        allFilter=allSwiming.filter({ (all:PeopleSport) in
            return (all.fullName?.lowercased().contains(search.lowercased()))!
            
        })
        myTableView.reloadData()
    }
    
}
