//
//  ViewController.swift
//  Navigation
//
//  Created by stam on 2020/12/13.
//

import UIKit

class ViewController: UIViewController, EditDelegate {
    
    let imgOn = UIImage(named: "lamp-on.png")
    let imgOff = UIImage(named: "lamp-off.png")
    
    var isOn = true
    var isZoom = true

    @IBOutlet var txtMessage: UITextField!
    @IBOutlet var imgView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        imgView.image = imgOn
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let editViewController = segue.destination as! EditViewController
        if segue.identifier == "editButton" {
            editViewController.textWayValue = "segue: use button"
        } else if segue.identifier == "editBarButton" {
            editViewController.textWayValue = "segue: use Bar button"
        }
        editViewController.textMessage = txtMessage.text!
        editViewController.isOn = isOn
        editViewController.isZoom = isZoom
        editViewController.delegate = self
    }
    
    func didMessageEditDone(_ controller: EditViewController, message: String) {
        txtMessage.text = message
    }
    
    func didImageOnOffDone(_ controller: EditViewController, isOn: Bool) {
        if isOn {
            imgView.image = imgOn
        } else {
            imgView.image = imgOff
        }
        self.isOn = isOn
    }
    
    func didImageZoomDone(_ controller: EditViewController, isZoom: Bool) {
        let scale: CGFloat = 2.0
        var newWidth: CGFloat, newHeight: CGFloat
        
        print("###\(self.isZoom), ###\(self.isZoom)")
        
        if self.isZoom {
            if isZoom {
                
            } else {
                newWidth = imgView.frame.width / scale
                newHeight = imgView.frame.height / scale
                imgView.frame.size = CGSize(width: newWidth, height: newHeight)
            }
        } else {
            if isZoom {
                newWidth = imgView.frame.width * scale
                newHeight = imgView.frame.height * scale
                imgView.frame.size = CGSize(width: newWidth, height: newHeight)
            } else {
                
            }
        }
        self.isZoom = isZoom
    }
}

