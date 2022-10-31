//
//  InfoPlayerViewController.swift
//  My game (FANAT)
//
//  Created by Николай Федоров on 07.01.2022.
//

import UIKit

class InfoPlayerViewController: UIViewController {

    var infoPlayer:PeopleSport?
    
    // Делаем аутлет элементов, чтобы работать с ними в коде
    @IBOutlet var labelStyleSport: UILabel!
    @IBOutlet var labelComanda: UILabel!
    @IBOutlet var labelRecordWin: UILabel!
    @IBOutlet var labelOrigin: UILabel!
    @IBOutlet var labelCitizenship: UILabel!
    @IBOutlet var labelHeight: UILabel!
    @IBOutlet var labelWeight: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.title=infoPlayer?.fullName
        navigationController?.navigationBar.prefersLargeTitles=true
        
        // Передаем информацию лэйблам
        labelStyleSport.text=infoPlayer?.styleSport
        labelComanda.text=infoPlayer?.comanda
        labelRecordWin.text=infoPlayer?.recordWin
        labelOrigin.text=infoPlayer?.origin
        labelCitizenship.text=infoPlayer?.citizenship
        labelHeight.text=infoPlayer?.height
        labelWeight.text=infoPlayer?.weight
        
    }
}
