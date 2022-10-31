//
//  TaLoveViewController.swift
//  My game (FANAT)
//
//  Created by Николай Федоров on 12.01.2022.
//

import UIKit

class TaLoveViewController: UIViewController {

    @IBOutlet var myTa: UITableView!
    
    var ta:[String]=["Я люблю тебя, Танюшечка !","Я люблю тебя, Танюшечка !","Я люблю тебя, Танюшечка !","Я люблю тебя, Танюшечка !","Я люблю тебя, Танюшечка !","Я люблю тебя, Танюшечка !","Я люблю тебя, Танюшечка !","Я люблю тебя, Танюшечка !","","Я люблю тебя, Танюшечка !","Я люблю тебя, Танюшечка !","Я люблю тебя, Танюшечка !","Я люблю тебя, Танюшечка !","Я люблю тебя, Танюшечка !","Я люблю тебя, Танюшечка !","Я люблю тебя, Танюшечка !","Я люблю тебя, Танюшечка !","Я люблю тебя, Танюшечка !","Я люблю тебя, Танюшечка !","Я люблю тебя, Танюшечка !","Я люблю тебя, Танюшечка !","Я люблю тебя, Танюшечка !","Я люблю тебя, Танюшечка !","Я люблю тебя, Танюшечка !","Я люблю тебя, Танюшечка !","Я люблю тебя, Танюшечка !","Я люблю тебя, Танюшечка !","Я люблю тебя, Танюшечка !","Я люблю тебя, Танюшечка !"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title="Моя Танечка :)"
        navigationController?.navigationBar.prefersLargeTitles=true
        myTa.register(UITableViewCell.self, forCellReuseIdentifier: "Ta")
        myTa.dataSource=self
        myTa.delegate=self
    }
    

}

extension TaLoveViewController:UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        ta.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell=myTa.dequeueReusableCell(withIdentifier: "Ta", for: indexPath)
        
        cell.textLabel?.text=ta[indexPath.row]
        return cell
    }
    
    
}
