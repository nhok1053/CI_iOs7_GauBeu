//
//  ViewController.swift
//  Lesson1-UITest
//
//  Created by Admin on 4/16/17.
//  Copyright © 2017 Admin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var total : Double = 0
    var a : Double = 0
    var b : Double = 0
    var opera : Int = 0
    
    @IBOutlet var lblTotal: UILabel!
    // / = -1 ; x = -2 ; - = -3 ; + = -4 ; = = -5
    @IBAction func btnClear(_ sender: UIButton) {
        total = 0
        lblTotal.text = "0"
    }
    
    @IBAction func btnCalculator(_ sender: UIButton) {
        if(opera != 0){
            print(a)
            //total = calculation(sender: sender, total: total, a: a )
            
            if(opera == -4){
                total += a
                print("Total : \(total)" )
                opera = 0
            }
            if(opera == -3){
                total -= a
                print("Total : \(total)" )
                opera = 0
            }
            if(opera == -2){
                total *= a
                print("Total : \(total)" )
                opera = 0
            }
            if(opera == -1){
                total /= a
                print("Total : \(total)" )
                opera = 0
            }
            if( opera == -5){
                lblTotal.text = ""
                lblTotal.text = "\(total)"
            }
            
        lblTotal.text = "\(total)"
            
        }else{
            if( total != 0 ){
                lblTotal.text = ""
                opera = sender.tag
            }
        }

        if(total == 0 ){
            total = Double(lblTotal.text!)!
            opera = sender.tag
            lblTotal.text = ""
        }
        
      
        print(total)
    }
    func calculation(sender : UIButton, total : Double , a : Double) -> Double{
        var totalCalcu : Double = 0
        if(sender.tag == -1){
            totalCalcu = total / a
        }else if(sender.tag == -2){
            totalCalcu = total * a
        }else if(sender.tag == -3){
            totalCalcu = total - a
        }else if(sender.tag == -4){
            totalCalcu = total + a
        }
        return totalCalcu
    }
    
    func number(sender : UIButton) -> Void {
        if sender.tag == 0{
            lblTotal.text! += "\(sender.tag)"
        }
        if sender.tag == 1{
            lblTotal.text! += "\(sender.tag)"
        }
        if sender.tag == 2{
            lblTotal.text! += "\(sender.tag)"
        }
        if sender.tag == 3{
            lblTotal.text! += "\(sender.tag)"
        }
        if sender.tag == 4{
            lblTotal.text! += "\(sender.tag)"
        }
        if sender.tag == 5{
            lblTotal.text! += "\(sender.tag)"
        }
        if sender.tag == 6{
            lblTotal.text! += "\(sender.tag)"
        }
        if sender.tag == 7{
            lblTotal.text! += "\(sender.tag)"
        }
        if sender.tag == 8{
            lblTotal.text! += "\(sender.tag)"
        }
        if sender.tag == 9{
            lblTotal.text! += "\(sender.tag)"
        }
        if sender.tag == 10 {
            lblTotal.text! += "\(sender.tag)"
        }
        
    }
    @IBAction func btNumberDidTouch(_ sender: UIButton) {
        
        if lblTotal.text! == "0"{
            lblTotal.text! = ""
            number(sender: sender)
        }else{
            number(sender: sender)
        }
        if( total != 0){
            a = Double(lblTotal.text!)!
            print(a)
        }
    }
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

