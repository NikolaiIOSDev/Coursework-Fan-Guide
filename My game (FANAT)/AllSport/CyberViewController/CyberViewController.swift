//
//  CyberViewController.swift
//  My game (FANAT)
//
//  Created by Николай Федоров on 07.01.2022.


import UIKit

class CyberViewController: UIViewController {
    
    @IBOutlet var myTableView: UITableView!
    
    var allCyber:[PeopleSport]=[
        PeopleSport(fullName: "Александр Костылев",styleSport: "Киберспорт",comanda: "NaVi",recordWin: "2021 MVP PGL",origin: "Украина, Киев",citizenship: "Украина",height: "184 см",weight: "83 кг"),
        
        PeopleSport(fullName: "Иоанн Сухарев",styleSport: "Киберспорт",comanda: "NaVi",recordWin: "EPL S14",origin: "Украина, Харьков",citizenship: "Украина",height: "179 см",weight: "78 кг"),
        
        PeopleSport(fullName: "Денис Шарипов",styleSport: "Киберспорт",comanda: "NaVi",recordWin: "2020 IEM Katowice",origin: "Россия, Казань",citizenship: "Россия",height: "170 см",weight: "68 кг"),
        
        PeopleSport(fullName: "Николай Ридс",styleSport: "Киберспорт",comanda: "Ninjas",recordWin: "Лучший в CS:GO",origin: "Дания, Вайле",citizenship: "Дания",height: "183 см",weight: "58 кг"),
        
        PeopleSport(fullName: "Кристофер Алесунд",styleSport: "Киберспорт",comanda: "Giants",recordWin: "Фраги в проф матчах",origin: "Швеция, Спанга",citizenship: "Швеция",height: "178 см",weight: "72 см"),
        
        PeopleSport(fullName: "Матье Эрбо",styleSport: "Киберспорт",comanda: "Team Vitality",recordWin: "2019 лучший игрок",origin: "Франция, Ланс",citizenship: "Франция",height: "170 см",weight: "102 кг"),
        
        PeopleSport(fullName: "Кенни Шраб",styleSport: "Киберспорт",comanda: "G2 Esports",recordWin: "Лучший игрок AWP",origin: "Франция, Прованс",citizenship:"Франция",height: "187 см",weight: "76 кг"),
     
        
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
        myTableView.register(UITableViewCell.self, forCellReuseIdentifier: "CellFour")
        navigationItem.title="Киберспорт"
        navigationController?.navigationBar.prefersLargeTitles=true
        
        //Установка SearchController
        searchController.searchResultsUpdater=self
        searchController.obscuresBackgroundDuringPresentation=false
        searchController.searchBar.placeholder="Поиск по спортсменам"
        navigationItem.searchController=searchController
        definesPresentationContext=true
        
    }
}

extension CyberViewController:UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if isFiltering{
            return allFilter.count
        }
        
       return allCyber.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell=myTableView.dequeueReusableCell(withIdentifier: "CellFour", for: indexPath)
        
        var player:PeopleSport
        
        if isFiltering{
            player=allFilter[indexPath.row]
        }else{
            player=allCyber[indexPath.row]
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
            vc.infoPlayer=allCyber[indexPath.row]
        }
        
    
        navigationController?.pushViewController(vc, animated: true)
        myTableView.deselectRow(at: indexPath, animated: true)
    }
    
}

extension CyberViewController:UISearchResultsUpdating{
    func updateSearchResults(for searchController: UISearchController) {
        filterContentForSearchText(searchController.searchBar.text!)
    }
    
    func filterContentForSearchText(_ search:String){
        allFilter=allCyber.filter({ (all:PeopleSport) in
            return (all.fullName?.lowercased().contains(search.lowercased()))!
            
        })
        myTableView.reloadData()
    }
    
}
