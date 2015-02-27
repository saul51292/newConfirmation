//
//  cardView.swift
//  newConfirmation
//
//  Created by Saul on 2/26/15.
//  Copyright (c) 2015 Saul. All rights reserved.
//

import UIKit

class cardView: UIView {

    @IBOutlet var mainImageView: UIImageView!
    @IBOutlet var smallMainLabel: UILabel!
    @IBOutlet var mainLabel: UILabel!
    @IBOutlet var mainTitleLabel: UILabel!
    @IBOutlet var subTitleLabel: UILabel!
    @IBOutlet var topView: UIView!
    @IBOutlet var contentView: UIView!
    
    @IBOutlet var tapRec: UITapGestureRecognizer!
    var returnColor = UIColor(red: 41/255, green: 128/255, blue: 185/255, alpha: 1.0)
    var  deliveryColor   = UIColor(red: 192/255, green: 57/255, blue: 43/255, alpha: 1.0)
    var  shippingColor   = UIColor(red: 211/255, green: 84/255, blue: 0/255, alpha: 1.0)
    var  confirmationColor   = UIColor(red: 39/255, green: 174/255, blue: 96/255, alpha: 1.0)

    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        xibSetup()
    }
    
    private func xibSetup() {
        contentView = loadViewFromNib("cardView") as UIView
        contentView.layer.cornerRadius = 5
        contentView.frame = bounds
        createMask()
        self.addSubview(contentView)
    }

    
    func changeTitle(mainTitle:String,subTitle:String,color:UIColor)
    {
        mainTitleLabel.text = mainTitle
        subTitleLabel.text = subTitle
        topView.backgroundColor = color
    }
    
    func changeContent(mainContent:String, subContent:String, mainImage:UIImage)
    {
        mainLabel.text = mainContent
        smallMainLabel.text = subContent
        mainImageView.image = mainImage
    }
    
    func changeToList(contentOne:String, contentTwo:String, contentThree:String)
    {
        mainImageView.hidden = true
        mainLabel.hidden = true
        smallMainLabel.hidden = true
        
        var lineOne = UILabel()
        var lineTwo = UILabel()
        var lineThree = UILabel()
        
        styleLine(lineThree, content: contentThree, height: 0)
        styleLine(lineTwo, content: contentTwo, height: 25)
        styleLine(lineOne, content: contentOne, height: 50)

        
    }
    
    func styleLine(label:UILabel, content:String, height:CGFloat)
    {
        label.font = UIFont(name: "Montserrat", size: 15)
        label.text = content
        label.textColor = UIColor.darkGrayColor()
        label.frame = CGRectMake(self.bounds.width/31, smallMainLabel.frame.origin.y - height, 200, smallMainLabel.frame.height)
        
        self.addSubview(label)
    }
    
    
    func createMask()
    {
        var maskPath = UIBezierPath(roundedRect: topView.frame, byRoundingCorners: .TopRight | .TopLeft, cornerRadii: CGSizeMake(5, 5))
        var maskLayer = CAShapeLayer()
        maskLayer.frame = topView.bounds
        maskLayer.path = maskPath.CGPath
        topView.layer.mask = maskLayer
    }
    
    func loadViewFromNib(nibName: String) -> UIView {
        let bundle = NSBundle(forClass: self.dynamicType)
        let nib = UINib(nibName: nibName, bundle: bundle)
        
        // Assumes UIView is top level and only object in CustomView.xib file
        let view = nib.instantiateWithOwner(self, options: nil)[0] as! UIView
        return view
    }
    
    
    
    /*
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        // Drawing code
    }
    */

}
