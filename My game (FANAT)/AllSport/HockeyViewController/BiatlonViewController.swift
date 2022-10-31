//
//  BiatlonViewController.swift
//  My game (FANAT)
//
//  Created by Николай Федоров on 07.01.2022.
//

import UIKit

class BiatlonViewController: UIViewController {
    
    @IBOutlet var myTableView: UITableView!
    
    var allBiatlon:[PeopleSport]=[
        PeopleSport(fullName: "Александр Логинов",styleSport: "Биатлон",comanda: "Биатлонист России",recordWin: "4-к чемпион Европы",origin: "Россия, Саратов",citizenship: "Россия",height: "177 см",weight: "68 кг"),
        
        PeopleSport(fullName: "Эмильен Жаклен",styleSport: "Биатлон",comanda: "Биатлонист Франции",recordWin: "3-к чемпион мира",origin: "Франция, Гренобль",citizenship: "Франция",height: "186 см",weight: " 79 кг"),
        
        PeopleSport(fullName: "Йоханнес Кюн",styleSport: "Биатлон",comanda: "Биатлонист Германии",recordWin: "Кубок мира Хохфильцене",origin: "Германия, Пассау",citizenship: "Германия",height: "187 см",weight: "80 кг"),
        
        PeopleSport(fullName: "Ханна Эберг",styleSport: "Биатлон",comanda: "Биалонистка Швеции",recordWin: "2019 чемпионка Европы",origin: "Швеция, Кируна",citizenship: "Швеция",height: "178 см",weight: "65 кг"),
        
        PeopleSport(fullName: "Флоран Клод",styleSport: "Биатлон",comanda: "Биатлонист Франции",recordWin: "2009 чемпион мира",origin: "Франция, Ремирон",citizenship: "Франция",height: "185 см",weight: "84 кг"),
        
        PeopleSport(fullName: "Томас Бормолини",styleSport: "Биатлон",comanda: "Биатлонист Италии",recordWin: "Дебют кубка IBU",origin: "Италия Сондало",citizenship: "Италия",height: "173 см",weight: "68 кг")
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
        myTableView.register(UITableViewCell.self, forCellReuseIdentifier: "CellSeven")
        navigationItem.title="Биатлон"
        navigationController?.navigationBar.prefersLargeTitles=true
        
        //Установка SearchController
        searchController.searchResultsUpdater=self
        searchController.obscuresBackgroundDuringPresentation=false
        searchController.searchBar.placeholder="Поиск по спортсменам"
        navigationItem.searchController=searchController
        definesPresentationContext=true
        
        
    }
}


extension BiatlonViewController:UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if isFiltering{
            return allFilter.count
        }
        
       return allBiatlon.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell=myTableView.dequeueReusableCell(withIdentifier: "CellSeven", for: indexPath)
        
        var player:PeopleSport
        
        if isFiltering{
            player=allFilter[indexPath.row]
        }else{
            player=allBiatlon[indexPath.row]
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
            vc.infoPlayer=allBiatlon[indexPath.row]
        }
        
    
        navigationController?.pushViewController(vc, animated: true)
        myTableView.deselectRow(at: indexPath, animated: true)
    }
    
}

extension BiatlonViewController:UISearchResultsUpdating{
    func updateSearchResults(for searchController: UISearchController) {
        filterContentForSearchText(searchController.searchBar.text!)
    }
    
    func filterContentForSearchText(_ search:String){
        allFilter=allBiatlon.filter({ (all:PeopleSport) in
            return (all.fullName?.lowercased().contains(search.lowercased()))!
            
        })
        myTableView.reloadData()
    }
    
}
