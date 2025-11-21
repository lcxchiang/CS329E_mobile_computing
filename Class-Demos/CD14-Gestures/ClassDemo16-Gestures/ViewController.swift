//
//  ViewController.swift
//  ClassDemo16-Gestures
//
//  Created by bulko on 10/24/16.
//  Copyright © 2016 bulko. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var viewBox: UIView!
    @IBOutlet weak var boxLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let swipeRecognizer = UISwipeGestureRecognizer(target: self, action: #selector(recognizeSwipeGesture(recognizer:)))
        swipeRecognizer.direction = UISwipeGestureRecognizerDirection.right
        self.view.addGestureRecognizer(swipeRecognizer)
        
        let edgePanRecognizer = UIScreenEdgePanGestureRecognizer(target: self, action: #selector(recognizeEdgePanGesture(recognizer:)))
        edgePanRecognizer.edges = UIRectEdge.left
        self.view.addGestureRecognizer(edgePanRecognizer)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func recognizeTapGesture(recognizer: UITapGestureRecognizer)
    {
        boxLabel.text = "Tap"
        let colorRed = CGFloat.random(in: 0 ..< 1)
        let colorGreen = CGFloat.random(in: 0 ..< 1)
        let colorBlue = CGFloat.random(in: 0 ..< 1)
        viewBox.backgroundColor = UIColor(red: colorRed, green: colorGreen, blue: colorBlue, alpha: 1)
    }

    @IBAction func recognizeLongPressedGesture (recognizer: UILongPressGestureRecognizer)
    {
        boxLabel.text = "Long Press"
        viewBox.backgroundColor = UIColor.black
    }
    
    @IBAction func recognizeRotateGesture(recognizer: UIRotationGestureRecognizer)
    {
        boxLabel.text = "Rotate"
        recognizer.view!.transform = recognizer.view!.transform.rotated(by: recognizer.rotation)
        recognizer.rotation = 0
    }
    
    @IBAction func recognizePinchGesture(recognizer: UIPinchGestureRecognizer)
    {
        boxLabel.text = "Resize"
        recognizer.view!.transform = recognizer.view!.transform.scaledBy(x: recognizer.scale, y: recognizer.scale)
        recognizer.scale = 1
    }
    
    @IBAction func recognizePanGesture(recognizer: UIPanGestureRecognizer)
    {
        boxLabel.text = "Drag"
        let translate = recognizer.translation(in: self.view)
        recognizer.view!.center = CGPoint(x:recognizer.view!.center.x + translate.x,
                                      y:recognizer.view!.center.y + translate.y)
        recognizer.setTranslation(.zero, in: self.view)
    }
    
    @IBAction func recognizeSwipeGesture(recognizer: UISwipeGestureRecognizer)
    {
        if recognizer.state == .ended {
            boxLabel.text = "Swipe"
            
            //this method allows property changes to an IB-created object with constraints
            viewBox.translatesAutoresizingMaskIntoConstraints = true
            
            //I think it looks nicer without centering first
            //viewBox.center.x = view.center.x
            
            UIView.animate (withDuration: 1.0, animations: {
                self.viewBox.center.x += self.view.bounds.width
            }, completion: { finished in
                self.viewBox.center.x = self.view.center.x - self.view.bounds.width
                UIView.animate (withDuration: 1.0, animations: {
                    self.viewBox.center.x += self.view.bounds.width
                })
            })
        }
    }

    
    @IBAction func recognizeEdgePanGesture(recognizer: UIScreenEdgePanGestureRecognizer)
    {
        boxLabel.text = "Edge Pan"
        
        UIView.animate (withDuration: 1.0,
                                    animations: {
                                        // 180 degree rotation
                                        self.viewBox.transform = self.viewBox.transform.rotated(by: CGFloat(Double.pi))
                                    })

    }
    
}

