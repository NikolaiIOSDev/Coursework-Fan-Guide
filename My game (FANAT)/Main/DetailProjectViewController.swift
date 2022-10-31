//
//  DetailProjectViewController.swift
//  My game (FANAT)
//
//  Created by Николай Федоров on 11.01.2022.
//

import UIKit

class DetailProjectViewController: UIViewController // Создаем класс документации
{
  
    
    @IBOutlet var myTextView: UITextView! // Делаем аутлет для таблицы, чтобы можно управлять ей в коде
    
    @IBOutlet var myButtonDetail: UIButton! // Делаем аутлет для кнопки, чтобы можно управлять ей в коде и добавлять экшены (действия)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemTeal
        myTextView.backgroundColor = .systemTeal
        myTextView.isEditable=false
        myButtonDetail.layer.cornerRadius=8
    }
    

    
    @IBAction func myButton(_ sender: Any) // Создана функция, которая добавляет экшены, функция напрямую связана с Interface Builder через IBAction
    {
       let allert=UIAlertController(title: "Контактная информация", message: "Создатель                                         Федоров Николай Анатольевич          fedorov.na@alidi.info", preferredStyle: .alert)
        
        let allertAction=UIAlertAction(title: "OK", style: .cancel, handler: nil)
        
        allert.addAction(allertAction)
        present(allert, animated: true, completion: nil)
        
    }
}
