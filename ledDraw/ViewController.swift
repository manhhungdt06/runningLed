//
//  ViewController.swift
//  ledDraw
//
//  Created by techmaster on 10/26/16.
//  Copyright © 2016 techmaster. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tf_num: UITextField!
    var _margin: CGFloat = 50
    var n : Int = 0
    var lastOn = -1
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func runAction(_ sender: AnyObject) {
        Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(runSpiral), userInfo: nil, repeats: true);
    }
    
//    func runningLed() {
//        n = Int(tf_num.text!)!
//        if (lastOn != -1) {
//            turnOff()
//        }
//        if (lastOn != n-1) {
//            lastOn = lastOn + 1
//        } else {
//            lastOn = 0
//        }
//        turnOn()
//    }
    
    func runSpiral() {
        n = Int(tf_num.text!)!
        var matrix:[[Int]] = [[Int]](repeating:[Int](repeating:0, count: n), count:n)
        var k = 0; var l = 0
        while (k < n && l < n)
        {
            /* Print the first row from the remaining rows */
            for i in 0..<n
            {
                print("matrix[\(k)][\(i)] = \(matrix[k][i])")
                turnOff()
            }
            k += 1
            
            /* Print the last column from the remaining columns */
            for i in k..<n
            {
                print("matrix[\(i)][\(n-1)] = \(matrix[i][n-1])")
                turnOff()
            }
            n-=1
            
            /* Print the last row from the remaining rows */
            if ( k < n) {
                for i in (0 ..< n-1).reversed() {
                    print("matrix[\(n-1)][\(i)] = \(matrix[n-1][i])")
                    turnOff()
                }
                n-=1
            }
            
            /* Print the first column from the remaining columns */
            if (l < n) {
                for i in (k ..< n-1).reversed() {
                    print("matrix[\(i)][\(l)] = \(matrix[i][l])")
                    // turnOff()
                }
                l+=1;
            }
        }
        // turnOn()
    }
    
    func turnOn() {
        if let point = self.view.viewWithTag(100+lastOn)
            as? UIImageView {
            point.image = UIImage(named: "Image")
        }
    }
    
    func turnOff() {
        if let point = self.view.viewWithTag(100+lastOn)
            as? UIImageView {
            point.image = UIImage(named: "ImageOff")
        }
    }
    
    @IBAction func drawClick(_ sender: AnyObject) {
        for v in view.subviews{
            if v is UIImageView{
                v.removeFromSuperview()
            }
        }
        print("text = \((tf_num.text!))")
        n = Int(tf_num.text!)!
        for rowIndex in 0..<n {
            for colIndex in 0..<n {
                let image = UIImage(named: "Image")
                let point = UIImageView(image: image)
                point.center = CGPoint(x: _margin + CGFloat(rowIndex) * spaceBetween(num: n), y: 2*_margin + CGFloat(colIndex) * spaceBetween(num: n))
                point.tag = rowIndex + 100
                self.view.addSubview(point)
            }
        }
    }
    func spaceBetween(num: Int) -> CGFloat {
        let space = (self.view.bounds.size.width - 2*_margin)/CGFloat(num-1)
        return space
    }
}
