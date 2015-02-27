//
//  ViewController.swift
//  newConfirmation
//
//  Created by Saul on 2/26/15.
//  Copyright (c) 2015 Saul. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UIScrollViewDelegate {

    @IBOutlet var fourthCard: cardView!
    
    @IBOutlet var thirdCard: cardView!
    
    @IBOutlet var secondCard: cardView!
    
    @IBOutlet var firstCard: cardView!
    
    @IBOutlet var scrollView: UIScrollView!
    @IBOutlet var backImage: UIImageView!
    
    
    @IBOutlet var companyLabel: UILabel!
    @IBOutlet var descriptionLabel: UILabel!
    
    @IBOutlet var orderImage: UIImageView!
    
    @IBOutlet var orderView: UIView!
    
    let springDamp:CGFloat = 0.7
    let initSpring:CGFloat = 0.8
    let delay:NSTimeInterval = 0.0
    let yOffSet:CGFloat = -200
    let option: UIViewAnimationOptions = UIViewAnimationOptions.CurveEaseInOut
    var isExpanded = false
    var keepScrollFrame = CGRect()
    var gradient: CAGradientLayer = CAGradientLayer()


    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        scrollView.delegate = self
        keepScrollFrame = scrollView.frame
        addTapRecognizer()

        setCard(fourthCard, cardName: "Confirmation")
        setCard(thirdCard, cardName: "Shipping")
        setCard(secondCard, cardName: "Return")
        setCard(firstCard, cardName: "Delivery")
        
    }
    
    func addTapRecognizer() {
        var allCards = [firstCard,secondCard,thirdCard,fourthCard]
        for card in allCards
        {
            card.tapRec.addTarget(self, action: "tappedView")       }
    }
    

    
    func createGradient()
    {
        
        gradient.colors = [UIColor.darkGrayColor().colorWithAlphaComponent(0.8).CGColor, UIColor.darkGrayColor().colorWithAlphaComponent(0.4).CGColor, UIColor.clearColor()]
        gradient.locations = [0.0 , 0.4]
        gradient.startPoint = CGPoint(x: 0.0, y: 0.0)
        gradient.endPoint = CGPoint(x: 0.0, y: 0.4)
        gradient.frame = CGRect(x: 0.0, y: 0.0, width: self.view.frame.size.width, height: self.view.frame.size.height)
        
        self.view.layer.insertSublayer(gradient, atIndex: 2)
    }
    
    
    func tappedView()
    {
       if(!isExpanded)
       {
            setScrollSize()
            changeTop()
            moveView()
            isExpanded = true
        }
       else{
            changeBack()
            isExpanded = false
        }
    }
    
    func changeBack()
    {
        putTopBack()
        moveBack()
    }
    
    override func viewWillAppear(animated: Bool) {
        animateViewsSpringingUp(fourthCard,thirdCard,secondCard,firstCard)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    func setScrollSize()
    {
        var cardHeight = firstCard.frame.size.height
        var scrollViewHeight = CGFloat(0)
        
        for view in 1...6
        {
            scrollViewHeight += cardHeight
        }
        
        scrollView.contentSize = CGSizeMake(320, scrollViewHeight)
    }
    
    func moveView()
    {
        
        
        UIView.animateWithDuration(1,
            delay: 0,
            options: .CurveEaseInOut,
            animations: {
                self.firstCard.transform = CGAffineTransformMakeTranslation(0, 0)
                self.secondCard.transform = CGAffineTransformMakeTranslation(0, 220)
                self.thirdCard.transform = CGAffineTransformMakeTranslation(0, 440)
                self.fourthCard.transform = CGAffineTransformMakeTranslation(0, 660)
                self.scrollView.frame = CGRectMake(0, 0, self.scrollView.frame.width, self.view.bounds.height)
                self.createGradient()
                self.gradient.hidden = false
            }, completion:nil)
    }
    
    func moveBack()
    {
        
        
        UIView.animateWithDuration(1,
            delay: 0,
            options: .CurveEaseInOut,
            animations: {
                var identity = CGAffineTransformIdentity
                self.firstCard.transform = identity
                self.secondCard.transform = identity
                self.thirdCard.transform = identity
                self.fourthCard.transform = identity
                self.scrollView.frame = self.keepScrollFrame
                self.gradient.hidden = true

                
            }, completion:nil)
    }
    
    func putTopBack()
    {
        UIView.animateWithDuration(1,
            delay: 0,
            options: .CurveEaseInOut,
            animations: {
                self.descriptionLabel.hidden = false
                self.companyLabel.hidden = false
                self.orderImage.transform = CGAffineTransformIdentity
               

                
                
            }, completion:nil)
        
    }
    
    
    func changeTop()
    {
        UIView.animateWithDuration(1,
            delay: 0,
            options: .CurveEaseInOut,
            animations: {
                self.descriptionLabel.hidden = true
                self.companyLabel.hidden = true
                var scaleButton = CGAffineTransformMakeScale(0.7, 0.7)
                var centerButton = CGAffineTransformMakeTranslation(self.view.bounds.width/6, -45)
                self.orderImage.transform = CGAffineTransformConcat(scaleButton, centerButton)
                
            }, completion:nil)

    }
    
    
    func scrollViewDidScroll(scrollView: UIScrollView) {
        
       
        }
    
    func animateViewsSpringingUp(views: UIView...){
        var time = Double(1.0/Double(views.count))
        
        for view in views{
            UIView.animateWithDuration(time, delay: 0.0,
                usingSpringWithDamping: 0.7,
                initialSpringVelocity: 0.8,
                options: .CurveEaseInOut,
                animations:  {
                    view.frame.offset(dx: 0, dy: self.yOffSet)
                }, completion: nil)
            time += Double(1.0/Double(views.count))
            
        }
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

