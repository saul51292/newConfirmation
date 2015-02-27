//
//  ViewController.swift
//  newConfirmation
//
//  Created by Saul on 2/26/15.
//  Copyright (c) 2015 Saul. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var fourthCard: cardView!
    
    @IBOutlet var thirdCard: cardView!
    
    @IBOutlet var secondCard: cardView!
    
    @IBOutlet var firstCard: cardView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        setCard(fourthCard, cardName: "Confirmation")
        setCard(thirdCard, cardName: "Shipping")
        setCard(secondCard, cardName: "Return")
        setCard(firstCard, cardName: "Delivery")
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    func setCard(cardType:cardView, cardName:String)
    {
        switch(cardName){
        case "Return":
            cardType.changeContent("14 Days", subContent: "Est. Last Day", mainImage: UIImage(named: "orderImage")!)
            cardType.changeTitle("Return Policy", subTitle: "14 Days", color: cardType.returnColor)
        case "Delivery":
            cardType.changeContent("Aug. 25", subContent: "Before 8PM", mainImage: UIImage(named: "FedExLogo")!)
            cardType.changeTitle("Est. Delivery", subTitle: "Thurs", color: cardType.deliveryColor)
        case "Shipping":
            cardType.changeTitle("Shipping", subTitle: "Change", color: cardType.shippingColor)
            cardType.changeToList("Saul Hamadani", contentTwo: "2216 Homecrest Ave", contentThree: "Brooklyn, NY 11229")
        case "Confirmation":
            cardType.changeTitle("Confirmation", subTitle: "#1234", color: cardType.confirmationColor)
            cardType.changeToList("Saul Hamadani", contentTwo: "Visa ending in 3423", contentThree: "saulhamadani@me.com")
        default:
            println("None")
            
        }
    }
    

}

