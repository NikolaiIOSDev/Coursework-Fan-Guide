//
//  MainViewController.swift
//  My game (FANAT)
//
//  Created by Николай Федоров on 06.01.2022.
//

import UIKit

class MainViewController: UIViewController {
    
    @IBOutlet var myButton: UIButton!
    
    @IBOutlet var myButtonTwo: UIButton!
    @IBOutlet var myButtonThree: UIButton!
    @IBOutlet var myButtonFour: UIButton!
    
    @IBOutlet var myLabel: UILabel!
    
    @IBOutlet var myButtonSix: UIButton!
    @IBOutlet var myButtonSeven: UIButton!
    @IBOutlet var myButtonEight: UIButton!
    @IBOutlet var myButtonNine: UIButton!
    @IBOutlet var myButtonFive: UIButton!
    @IBOutlet var myButtonTen: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        myLabelContent()
        myButtons()
        
        navigationItem.title="Виды спорта"
    
    }
    
    func myLabelContent(){
        myLabel.font = UIFont(name: "Arial", size: myLabel.font.pointSize)
        myLabel.text="Just do it."
    }
    
    func myButtons(){
        myButton.layer.cornerRadius=8
        myButtonTwo.layer.cornerRadius=8
        myButtonThree.layer.cornerRadius=8
        myButtonFour.layer.cornerRadius=8
        myButtonFive.layer.cornerRadius=8
        myButtonSix.layer.cornerRadius=8
        myButtonSeven.layer.cornerRadius=8
        myButtonEight.layer.cornerRadius=8
        myButtonNine.layer.cornerRadius=8
        myButtonTen.layer.cornerRadius=8
    }
    

}
