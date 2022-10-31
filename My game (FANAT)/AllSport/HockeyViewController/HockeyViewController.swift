//
//  HockeyViewController.swift
//  My game (FANAT)
//
//  Created by Николай Федоров on 07.01.2022.
//

import UIKit

class HockeyViewController: UIViewController {
    
    @IBOutlet var myTableView: UITableView!
    var allHockey:[PeopleSport]=[
        PeopleSport(fullName: "Александр Овечкн",styleSport:"Хоккей",comanda: "Вашингтон Капиталз",recordWin: "Кубок Стэнли 2018",origin: "Россия, Москва",citizenship: "Россия",height: "190 см ",weight: "104 кг"),
        
        PeopleSport(fullName: "Евгений Малкин",styleSport:"Хоккей",comanda: "Питтсбург Пингвинз",recordWin: "2-к чемпион мира",origin: "Россия, Магнитогорск",citizenship: "Россия",height: "191 см",weight: "85 кг"),
        
        PeopleSport(fullName: "Павел Дацюк",styleSport: "Хоккей",comanda: "Автомобилист",recordWin: "2012 чемпион мира",origin: "Россия, Екатеринбург",citizenship: "Россия",height: "182 см",weight: "86 кг"),
        
        PeopleSport(fullName: "Илья Ковальчук",styleSport: "Хоккей",comanda: "Спартак",recordWin:"50 очков за 38 матчей",origin: "Россия, Тверь",citizenship: "Россия",height: "191 см",weight: "104 кг"),
        
        PeopleSport(fullName: "Артемий Панарин",styleSport: "Хоккей",comanda: "Нью-Йорк Рейнджерс",recordWin: "61 очко за 43 матча",origin: "Россия, Коркино",citizenship: "Россия",height: "178 см",weight: "76 кг"),
        
        PeopleSport(fullName: "Владимир Тарасенко",styleSport: "Хоккей",comanda: "Сент-Луис Блюз",recordWin: "2019 Кубок Стэнли",origin: "Россия, Ярославль",citizenship: "Россия",height: "183 см",weight: "102 кг"),
        
        PeopleSport(fullName: "Сергей Бобровский",styleSport: "Хоккей",comanda: "Флорида Пантерз",recordWin: "2014 чемпион мира",origin: "Россия, Новокузнецк",citizenship: "Россия",height: "188 см",weight: "86 кг"),
    
    
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
        
        navigationItem.title="Хоккей"
        navigationController?.navigationBar.prefersLargeTitles=true
        myTableView.register(UITableViewCell.self, forCellReuseIdentifier: "CellThree")
        
        //Установка SearchController
        searchController.searchResultsUpdater=self
        searchController.obscuresBackgroundDuringPresentation=false
        searchController.searchBar.placeholder="Поиск по спортсменам"
        navigationItem.searchController=searchController
        definesPresentationContext=true
    }
    
}

extension HockeyViewController:UITableViewDelegate,UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            
            if isFiltering{
                return allFilter.count
            }
            
           return allHockey.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell=myTableView.dequeueReusableCell(withIdentifier: "CellThree", for: indexPath)
        
        var player:PeopleSport
        
        if isFiltering{
            player=allFilter[indexPath.row]
        }else{
            player=allHockey[indexPath.row]
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
            vc.infoPlayer=allHockey[indexPath.row]
        }
        
        
        
        
        navigationController?.pushViewController(vc, animated: true)
        myTableView.deselectRow(at: indexPath, animated: true)
    }
}

extension HockeyViewController:UISearchResultsUpdating{
    func updateSearchResults(for searchController: UISearchController) {
        filterContentForSearchText(searchController.searchBar.text!)
    }
    
    func filterContentForSearchText(_ search:String){
        allFilter=allHockey.filter({ (all:PeopleSport) in
            return (all.fullName?.lowercased().contains(search.lowercased()))!
            
        })
        myTableView.reloadData()
    }
    
}
