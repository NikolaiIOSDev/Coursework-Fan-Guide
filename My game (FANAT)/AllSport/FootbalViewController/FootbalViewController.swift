//
//  FootbalViewController.swift
//  My game (FANAT)
//
//  Created by Николай Федоров on 07.01.2022.
//

import UIKit

class FootbalViewController: UIViewController {
    @IBOutlet var myTableView: UITableView! // Делаем аутлет для таблицы, чтобы можно управлять ей в коде
    
    var allFootbal:[PeopleSport]=[
        PeopleSport(fullName: "Криштиану Роналду",styleSport: "Футбол",comanda: "Манчестер Юнайтед",recordWin: "800 голов",origin: "Португалия, Мадейра",citizenship:"Португалия",height: "185 см",weight: "85 кг"),
        
        PeopleSport(fullName: "Лионель Месси",styleSport:"Футбол",comanda: "Барселона",recordWin: "Золотой мяч",origin: "Аргентина, Росарио",citizenship: "Аргентина",height: "169 см",weight: "67 кг"),
        
        PeopleSport(fullName: "Зинедин Зидан",styleSport: "Футбол",comanda: "Реал Мадрид",recordWin: "12 трофеев",origin: "Франция, Марсель",citizenship: "Франция",height: "185 см",weight: "80 кг"),
        
        PeopleSport(fullName: "Игорь Акинфеев",styleSport: "Футбол",comanda: "ЦСКА",recordWin:"7-к обладатель кубка",origin: "Россия, Видное",citizenship: "Россия",height: "185 см",weight: "78 кг"),
        
        PeopleSport(fullName: "Дидье Дрогба",styleSport: "Футбол",comanda: "Челси",recordWin: "Лучший игрок клуба",origin: "Абиджан",citizenship: "Кот-д'Ивуар",height:"188 см",weight: "84 кг"),
        
        PeopleSport(fullName: "Серхио Рамос",styleSport: "Футбол",comanda: "Пари Сен-Жермен",recordWin: "12 голов в сезоне",origin: "Испаиня, Камас",citizenship: "Испания",height: "184 см",weight: "75 кг"),
        
        PeopleSport(fullName: "Артем Дзюба",styleSport: "Футбол",comanda: "Зенит",recordWin:"Лучший бомбардир",origin: "Россия, Москва",citizenship: "Россия",height: "196 см",weight: "97 кг"),
        
        PeopleSport(fullName: "Фернандо Торрес",styleSport: "Футбол",comanda: "Саган Тоусу",recordWin: "Лучший нападающий",origin: "Испания, Мадрид",citizenship: "Испания",height: "186 см",weight: "81 кг"),
        
        PeopleSport(fullName: "Карим Бензема",styleSport: "Футбол",comanda: "Реал Мадрид",recordWin: "400 голов",origin: "Франция, Лион",citizenship: "Франция",height: "185 см",weight: "81 кг")
        
    ] // Создаем переменную с моделью данных спортсменов и их характеристиками
    
   
    
    var allFilter=[PeopleSport]() // Создаем переменную, чтобы через поиск происходила филтрация и они записывались
    let searchController=UISearchController(searchResultsController: nil) // Создаем поисковой контроллер
    var searchBarIsEmpty:Bool //Создаем замыкание с логиков для поиска
    {
        guard let text=searchController.searchBar.text else {
            return false
        }
        return text.isEmpty
    }
    var isFiltering:Bool{
        return searchController.isActive && !searchBarIsEmpty
    }
    
    
    
    
    override func viewDidLoad() // Вызываем функция класса для загрузки всех элементов на экране
    {
        super.viewDidLoad()
        myTableView.register(UITableViewCell.self, forCellReuseIdentifier: "CellOne")
        navigationItem.title="Футбол"
        navigationController?.navigationBar.prefersLargeTitles=true
        
        //Установка SearchController
        searchController.searchResultsUpdater=self
        searchController.obscuresBackgroundDuringPresentation=false
        searchController.searchBar.placeholder="Поиск по спортсменам"
        navigationItem.searchController=searchController
        definesPresentationContext=true
    }
}

extension FootbalViewController:UITableViewDelegate,UITableViewDataSource // Расширяем класс FootbalViewController
{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int // Вызываем обязательный метод протокола UITableViewDataSource, UITableViewDelegate
    {
        if isFiltering{
            return allFilter.count
        }
        
       return allFootbal.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell // Обязательный метод протоколов, который создает ячейку
    {
        let cell=myTableView.dequeueReusableCell(withIdentifier: "CellOne", for: indexPath)
        
        var player:PeopleSport
        
        if isFiltering{
            player=allFilter[indexPath.row]
        }else{
             player=allFootbal[indexPath.row]
        }
        
        
         
        cell.textLabel?.text=player.fullName
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) /* Это навигация, которая передает данные спортсмена на другой экран
     (ViewController), а также этот метода дает выбрать ячейку и перейти на другой экран */
    {
        let stb=UIStoryboard(name: "Main", bundle: .main)
        let vc=stb.instantiateViewController(identifier: "InfoPlayerViewController") as! InfoPlayerViewController
        
        if isFiltering{
            vc.infoPlayer=allFilter[indexPath.row]
            
        }
        else{
            vc.infoPlayer=allFootbal[indexPath.row]
        }
        
        
        
        
        navigationController?.pushViewController(vc, animated: true)
        myTableView.deselectRow(at: indexPath, animated: true)
    }
    
}

extension FootbalViewController:UISearchResultsUpdating // Расширяем класс FootbalViewController и подписываем его на протоколы поиска
{
    func updateSearchResults(for searchController: UISearchController) // Реализуем методы поиска
    {
        filterContentForSearchText(searchController.searchBar.text!)
    }
    
    func filterContentForSearchText(_ search:String){
        allFilter=allFootbal.filter({ (all:PeopleSport) in
            return (all.fullName?.lowercased().contains(search.lowercased()))!
            
        })
        myTableView.reloadData()
    }
    
}
