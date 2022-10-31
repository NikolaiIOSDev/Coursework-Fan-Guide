//
//  MyDataViewController.swift
//  My game (FANAT)
//
//  Created by Николай Федоров on 15.01.2022.
//

import UIKit
import CoreData // Подключаем фреймворки

class MyDataViewController: UIViewController,UITableViewDataSource,UITableViewDelegate /* Подписываем на протоколы табличного представления
 */ {
    

    @IBOutlet var myTableView: UITableView! /* Из графического редактора переносим табличное представление,
     чтобы с ним можно было работать в коде
    */
    var people: [NSManagedObject] = [] // Создаем массив обьекта базы данных
    
    override func viewDidLoad() //Реализуем загрузочную функцию всех элементов
    {
        super.viewDidLoad()
        title = "Мои фавориты"
        navigationController?.navigationBar.prefersLargeTitles=true
        myTableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell") // Регистрируем нашу ячейку таблицы
      }
        
    
    override func viewWillAppear(_ animated: Bool)
    {
      super.viewWillAppear(animated)

      guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
        return
      }

      let managedContext = appDelegate.persistentContainer.viewContext
      let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "Person")

      do {
        people = try managedContext.fetch(fetchRequest)
      } catch let error as NSError {
        print("Could not fetch. \(error), \(error.userInfo)")
      }
    }


 
    
        @IBAction func addName(_ sender: Any) // Добавляем действие кнопки "+"
        {
            let alert = UIAlertController(title: "Введите имя и фамилию спортсмена" ,message: "Добавить", preferredStyle: .alert)

            let saveAction = UIAlertAction(title: "Сохранить", style: .default) { [unowned self] action in

              guard let textField = alert.textFields?.first,
                let nameToSave = textField.text else {
                  return
              }

                self.save(name: nameToSave)
              self.myTableView.reloadData()
            }

            let cancelAction = UIAlertAction(title: "Закрыть", style: .cancel)
            alert.addTextField()
            alert.addAction(saveAction)
            alert.addAction(cancelAction)

                present(alert, animated: true)
            

            
          }

          func save(name: String) // Реализуем функцию сохранения записей в базу данных
          {
            guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
              return
            }

            let managedContext = appDelegate.persistentContainer.viewContext
            let entity = NSEntityDescription.entity(forEntityName: "Person", in: managedContext)!
            let person = NSManagedObject(entity: entity, insertInto: managedContext)
            person.setValue(name, forKeyPath: "fullName")

            do {
              try managedContext.save()
              people.append(person)
            } catch let error as NSError {
              print("Could not save. \(error), \(error.userInfo)")
            }
          }
    
    @IBAction func deleteName(_ sender: Any) // Реализуем функцию удаление записей из базы данных
    {
        let appDelegate=UIApplication.shared.delegate as! AppDelegate
        let context=appDelegate.persistentContainer.viewContext
        
        let fetchRequest:NSFetchRequest<Person>=Person.fetchRequest()
        
        if let full=try? context.fetch(fetchRequest){
            for full in people{
                context.delete(full)
            }
        }
        do {
            try context.save()
        } catch let error as NSError{
            print(error.localizedDescription)
        }
        myTableView.reloadData() // Обновляем таблицу
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) /* Добавляем обязательные функции протокола
     TableViewDataSource, TableViewDelegate
     */
    {
        myTableView.deselectRow(at: indexPath, animated: true)
    }
    
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
          return people.count
        }

        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell // Создаем ячейку
        {

          let person = people[indexPath.row]
          let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
          cell.textLabel?.text = person.value(forKeyPath: "fullName") as? String
          return cell
        }
    }

