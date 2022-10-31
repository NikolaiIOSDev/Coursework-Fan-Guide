//
//  AtleticViewController.swift
//  My game (FANAT)
//
//  Created by Николай Федоров on 07.01.2022.
//

import UIKit

class AtleticViewController: UIViewController {

    @IBOutlet var myTableView: UITableView!
    
    var allAtletic:[PeopleSport]=[
        PeopleSport(fullName: "Аркадий Воробьев",styleSport: "Атлетика",comanda: "Атлет СССР",recordWin: "Рекордсмен мира",origin: "СССР, Тетюши",citizenship: "Россия",height: "169 см",weight: "90 кг"),
        
        PeopleSport(fullName: "Василий Алексеев",styleSport: "Атлетика",comanda: "Атлет СССР",recordWin: "8-к чемпион мира",origin: "СССР, Покрово-Шишкино",citizenship: "СССР",height: "188 см",weight: "162 кг"),
        
        PeopleSport(fullName: "Леонид Жаботинский",styleSport: "Атлетика",comanda: "Атлет СССР",recordWin: "2-к олимпийский чемпион",origin: "СССР, Успенка",citizenship: "Украина",height: "194 см",weight: "163 кг"),
        
        PeopleSport(fullName: "Александр Курлович",styleSport: "Атлетика",comanda: "Атлет СССР",recordWin: "12-к рекордсмен мира",origin: "СССР, Гродно",citizenship: "Беларусь",height: "185 см",weight: "134 кг"),
        
        PeopleSport(fullName: "Исраел Милотосян",styleSport: "Атлетика",comanda: "Атлет СССР",recordWin: "Чемпион мира",origin: "СССР, Гюмри",citizenship: "Армения",height: "165 см",weight: "70 кг"),
        
        PeopleSport(fullName: "Яан Тальтс",styleSport: "Атлетика",comanda: "Атлет СССР",recordWin: "Олимпийский чемпион",origin: "СССР, Массиару",citizenship: "Эстония",height: "174 см",weight: "100 кг"),
        
        PeopleSport(fullName: "Виктор Куренцов",styleSport: "Атлетика",comanda: "Атлет СССР",recordWin: "5-к чемпион мира",origin: "СССР, Тухинка",citizenship: "Россия",height: "164 см",weight: "75 кг"),
        
        PeopleSport(fullName: "Юрий Власов",styleSport: "Атлетика",comanda: "Атлет СССР",recordWin: "Олимпийский чемпион",origin: "СССР, Макеевка",citizenship: "Россия",height: "185 см",weight: "136 кг"),
        
        PeopleSport(fullName: "Евгений Минаев",styleSport: "Атлетика",comanda: "Атлет СССР",recordWin: "2-к чемпион мира",origin: "СССР, Клин",citizenship: "Россия",height: "156 см",weight: "60 кг"),
        
        PeopleSport(fullName: "Трофим Ломакин",styleSport: "Атлетика",comanda: "Атлет СССР",recordWin: "4-к чемпион мира",origin: "СССР, Алтайский край",citizenship: "СССР",height: "167 см",weight: "89 кг"),
        
        PeopleSport(fullName: "Леонид Тараненко",styleSport: "Атлетика",comanda: "Атлет СССР",recordWin: "Рекорды в книге Гиннесса",origin: "СССР, Малорита",citizenship: "Беларусь",height: "183 см",weight: "118 кг")
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
        myTableView.register(UITableViewCell.self, forCellReuseIdentifier: "CellNine")
        navigationItem.title="Атлетика"
        navigationController?.navigationBar.prefersLargeTitles=true
        
        //Установка SearchController
        searchController.searchResultsUpdater=self
        searchController.obscuresBackgroundDuringPresentation=false
        searchController.searchBar.placeholder="Поиск по спортсменам"
        navigationItem.searchController=searchController
        definesPresentationContext=true
    }
}


extension AtleticViewController:UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if isFiltering{
            return allFilter.count
        }
        
       return allAtletic.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell=myTableView.dequeueReusableCell(withIdentifier: "CellNine", for: indexPath)
        
        var player:PeopleSport
        
        if isFiltering{
            player=allFilter[indexPath.row]
        }else{
            player=allAtletic[indexPath.row]
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
            vc.infoPlayer=allAtletic[indexPath.row]
        }
        
    
        navigationController?.pushViewController(vc, animated: true)
        myTableView.deselectRow(at: indexPath, animated: true)
    }
    
}

extension AtleticViewController:UISearchResultsUpdating{
    func updateSearchResults(for searchController: UISearchController) {
        filterContentForSearchText(searchController.searchBar.text!)
    }
    
    func filterContentForSearchText(_ search:String){
        allFilter=allAtletic.filter({ (all:PeopleSport) in
            return (all.fullName?.lowercased().contains(search.lowercased()))!
            
        })
        myTableView.reloadData()
    }
    
}
