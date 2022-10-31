//
//  FireViewController.swift
//  My game (FANAT)
//
//  Created by Николай Федоров on 07.01.2022.
//

import UIKit

class FireViewController: UIViewController {

    @IBOutlet var myTableView: UITableView!
    
    var allFire:[PeopleSport]=[
        PeopleSport(fullName: "Виталина Бацарашкина",styleSport: "Стрельба",comanda: "Спортсменка России",recordWin: "2018 чемпионка мира",origin: "Россия, Омск",citizenship: "Россия",height: "162 см",weight: "58 кг"),
        
        PeopleSport(fullName: "Марина Логвиененко",styleSport: "Стрельба",comanda: "Спортсменка России",recordWin: "Чемпионка мира",origin: "Россия, Шахты",citizenship: "Россия",height: "154 см",weight: "63 кг"),
        
        PeopleSport(fullName: "Анатолий Богданов",styleSport: "Стрельба",comanda: "Спортсмен СССР",recordWin: "1954 чемпион мира",origin: "СССР, Ленинград",citizenship: "Россия",height: "Информация отсутствует",weight: "Информация отсутствует"),
        
        PeopleSport(fullName: "Василий Борисов",styleSport: "Стрельба",comanda: "Спортсмен России",recordWin: "Чемпион мира",origin: "СССР, Ленинград",citizenship: "Россия",height: "Информация отсутствует",weight: "Информация отсутствует"),
        
        PeopleSport(fullName: "Александр Газов",styleSport: "Стрельба",comanda: "Спортсмен России",recordWin: "Чемпион мира",origin: "СССР, Брыково",citizenship: "Россия",height: "182 см",weight: "84 кг"),
        
        PeopleSport(fullName: "Афанасий Кузьмин",styleSport: "Стрельба",comanda: "Спортсмен  России",recordWin: "1988 олимпийское золото",origin: "Латвия",citizenship: "Латвия",height: "178 см",weight: "89 кг")
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
        myTableView.register(UITableViewCell.self, forCellReuseIdentifier: "CellSix")
        navigationItem.title="Стрельба"
        navigationController?.navigationBar.prefersLargeTitles=true
        
        //Установка SearchController
        searchController.searchResultsUpdater=self
        searchController.obscuresBackgroundDuringPresentation=false
        searchController.searchBar.placeholder="Поиск по спортсменам"
        navigationItem.searchController=searchController
        definesPresentationContext=true
        
    }
}

extension FireViewController:UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if isFiltering{
            return allFilter.count
        }
        
       return allFire.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell=myTableView.dequeueReusableCell(withIdentifier: "CellSix", for: indexPath)
        
        var player:PeopleSport
        
        if isFiltering{
            player=allFilter[indexPath.row]
        }else{
            player=allFire[indexPath.row]
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
            vc.infoPlayer=allFire[indexPath.row]
        }
        navigationController?.pushViewController(vc, animated: true)
        myTableView.deselectRow(at: indexPath, animated: true)
    }
    
}

extension FireViewController:UISearchResultsUpdating{
    func updateSearchResults(for searchController: UISearchController) {
        filterContentForSearchText(searchController.searchBar.text!)
    }
    
    func filterContentForSearchText(_ search:String){
        allFilter=allFire.filter({ (all:PeopleSport) in
            return (all.fullName?.lowercased().contains(search.lowercased()))!
            
        })
        myTableView.reloadData()
    }
    
}
