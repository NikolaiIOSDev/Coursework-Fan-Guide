//
//  RunViewController.swift
//  My game (FANAT)
//
//  Created by Николай Федоров on 07.01.2022.
//

import UIKit

class RunViewController: UIViewController {
    
    @IBOutlet var myTableView: UITableView!
    
    var allRun:[PeopleSport]=[
        PeopleSport(fullName: "Усэйн Болт",styleSport: "Бег",comanda: "Легкоатлет Ямайки",recordWin: "Мировой рекорд в беге",origin: "Ямайка, Шервуд-Контент",citizenship: "Ямайка",height: "195 см",weight: "94 кг"),
        
        PeopleSport(fullName: "Тайсон Гэй",styleSport: "Бег",comanda: "Легкоатлет США",recordWin: "2-й быстрейший спринтер",origin: "США, Кентукки",citizenship: "США",height: "180 см",weight: "79 кг"),
        
        PeopleSport(fullName: "Йохан Блейк",styleSport: "Бег",comanda: "Легкоатлет Ямайки",recordWin: "2012 олимпийский чепион",origin: "Ямайка, Сент-Джеймс",citizenship: "Ямайка",height: "180 см",weight: "76 кг"),
        
        PeopleSport(fullName: "Асафа Пауэлл",styleSport: "Бег",comanda: "Легкоатлет Ямайки",recordWin: "2016 олимпийский чепион",origin: "Ямайка, Спаниш Таун",citizenship: "Ямайка",height: "190 см",weight: "88 кг"),
        
        PeopleSport(fullName: "Джастин Гэтлин",styleSport: "Бег",comanda: "Легкоатлет США",recordWin: "4-к чемпион мира",origin: "США, Бруклин",citizenship: "США",height: "185 см",weight: "79 кг"),
        
        PeopleSport(fullName: "Кармелита Джетер",styleSport: "Бег",comanda: "Легкоатлет США",recordWin: "3-к чемпионка мира",origin: "США, Лос-Анджелес",citizenship: "США",height: "163 см",weight: "61 кг"),
        
        PeopleSport(fullName: "Майкл Джонсон",styleSport:"Бег",comanda: "Легкоатлет США",recordWin: "8-к чемпоин мира",origin: "США, Даллас",citizenship: "США",height: "185 см",weight: "51 кг")
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
        myTableView.register(UITableViewCell.self, forCellReuseIdentifier: "CellEight")
        navigationItem.title="Бег"
        navigationController?.navigationBar.prefersLargeTitles=true
        
        //Установка SearchController
        searchController.searchResultsUpdater=self
        searchController.obscuresBackgroundDuringPresentation=false
        searchController.searchBar.placeholder="Поиск по спортсменам"
        navigationItem.searchController=searchController
        definesPresentationContext=true
    }
}

extension RunViewController:UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if isFiltering{
            return allFilter.count
        }
        
       return allRun.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell=myTableView.dequeueReusableCell(withIdentifier: "CellEight", for: indexPath)
        
        var player:PeopleSport
        
        if isFiltering{
            player=allFilter[indexPath.row]
        }else{
            player=allRun[indexPath.row]
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
            vc.infoPlayer=allRun[indexPath.row]
        }
        
    
        navigationController?.pushViewController(vc, animated: true)
        myTableView.deselectRow(at: indexPath, animated: true)
    }
}


extension RunViewController:UISearchResultsUpdating{
    func updateSearchResults(for searchController: UISearchController) {
        filterContentForSearchText(searchController.searchBar.text!)
    }
    
    func filterContentForSearchText(_ search:String){
        allFilter=allRun.filter({ (all:PeopleSport) in
            return (all.fullName?.lowercased().contains(search.lowercased()))!
            
        })
        myTableView.reloadData()
    }
    
}
