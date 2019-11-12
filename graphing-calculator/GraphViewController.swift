//
//  FirstViewController.swift
//  graphing-calculator
//
//  Created by student on 9/25/19.
//  Copyright © 2019 student. All rights reserved.
//

import UIKit

class GraphViewController: UIViewController {


    @IBOutlet weak var x1TF: UITextField!
    @IBOutlet weak var y1TF: UITextField!
    @IBOutlet weak var x2TF: UITextField!
    @IBOutlet weak var y2TF: UITextField!
    @IBOutlet weak var pointsEquationLBL: UILabel!
    
    @IBOutlet weak var yinterceptTF: UITextField!
    @IBOutlet weak var slopeTF: UITextField!
    
    @IBOutlet weak var aTF: UITextField!
    @IBOutlet weak var bTF: UITextField!
    @IBOutlet weak var cTF: UITextField!
    
    @IBOutlet weak var graphView: GraphView!
    
    @IBOutlet weak var getHashValue: UISlider!
    @IBOutlet weak var hashNumberLBL: UILabel!
    
    @IBAction func clearGraph(_ sender: UIButton) {
        x1TF.text = nil
        y1TF.text = nil
        x2TF.text = nil
        y2TF.text = nil
        pointsEquationLBL.text = "y = mx + b"
        yinterceptTF.text = nil
        graphView.yIntercept = Double(yinterceptTF.text!)
        slopeTF.text = nil
        graphView.slope = Double(slopeTF.text!)
        aTF.text = nil
        graphView.quadAvalue = Double(aTF.text!)
        bTF.text = nil
        graphView.quadBvalue = Double(bTF.text!)
        cTF.text = nil
        graphView.quadCvalue = Double(cTF.text!)
        graphView.setNeedsDisplay()
    }
    
    @IBAction func graphPointsEquation(_ sender: UIButton) {
    }
    
    @IBAction func graphStandardEquation(_ sender: UIButton) {
        let slope = Double(slopeTF.text!)
        if slopeTF.text!.contains("/") {
            graphView.slope = graphView.solveFraction(fractionInput: slopeTF.text!)
        } else {
            graphView.slope = slope
        }
            
        let yIntercept = Double(yinterceptTF.text!)
        if yinterceptTF.text!.contains("/") {
            graphView.yIntercept = graphView.solveFraction(fractionInput: yinterceptTF.text!)
        } else {
            graphView.yIntercept = yIntercept
        }
        
        graphView.setNeedsDisplay()
    }
    
    @IBAction func graphQuadraticEquation(_ sender: UIButton) {
        let aVal = Double(aTF.text!)
        if aTF.text!.contains("/") {
            graphView.quadAvalue = graphView.solveFraction(fractionInput: aTF.text!)
        } else {
            graphView.quadAvalue = aVal
        }
        
        let bVal = Double(slopeTF.text!)
        if bTF.text!.contains("/") {
            graphView.quadBvalue = graphView.solveFraction(fractionInput: bTF.text!)
        } else {
            graphView.quadBvalue = bVal
        }
        
        let cVal = Double(cTF.text!)
        if cTF.text!.contains("/") {
            graphView.quadCvalue = graphView.solveFraction(fractionInput: cTF.text!)
        } else {
            graphView.quadCvalue = cVal
        }
        
        graphView.setNeedsDisplay()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        getHashValue.addTarget(self, action: #selector(GraphViewController.slideValueChanged(_:)), for: .valueChanged)
        
        graphView.getHashValue = Double(getHashValue.value)
        hashNumberLBL.text = String(getHashValue.value)
        pointsEquationLBL.text = "y = mx + b"
    }
    
    @objc func slideValueChanged(_ send: UISlider!) {
        let roundedValue = roundf(send.value)
        send.value = roundedValue
        graphView.getHashValue = Double(getHashValue.value)
        hashNumberLBL.text = String(getHashValue.value)
        graphView.setNeedsDisplay()
    }

}

