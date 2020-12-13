//
//  EditViewController.swift
//  Navigation
//
//  Created by stam on 2020/12/13.
//

import UIKit

protocol EditDelegate {
    func didMessageEditDone(_ controller: EditViewController, message: String)
    func didImageOnOffDone(_ controller: EditViewController, isOn: Bool)
    func didImageZoomDone(_ controller: EditViewController, isZoom: Bool)
}

class EditViewController: UIViewController {
    
    @IBOutlet var swIsOn: UISwitch!
    @IBOutlet var btnMagnify: UIButton!
    
    var textWayValue: String = ""
    var textMessage: String = ""
    var delegate: EditDelegate?
    var isOn = false
    var isZoom = false
    
    @IBOutlet var txtMessage: UITextField!
    @IBOutlet var lblWay: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        lblWay.text = textWayValue
        txtMessage.text = textMessage
        swIsOn.isOn = isOn
        if isZoom {
            btnMagnify.setTitle("확대", for: .normal)
        } else {
            btnMagnify.setTitle("축소", for: .normal)
        }
    }
    
    @IBAction func btnDone(_ sender: UIButton) {
        if delegate != nil {
            delegate?.didMessageEditDone(self, message: txtMessage.text!)
            delegate?.didImageOnOffDone(self, isOn: self.isOn)
            delegate?.didImageZoomDone(self, isZoom: self.isZoom)
        }
        _ = navigationController?.popViewController(animated: true)
    }
    
    @IBAction func swImageOnOff(_ sender: UISwitch) {
        if sender.isOn {
            self.isOn = true
        } else {
            self.isOn = false
        }
    }
    
    @IBAction func btnMagnify(_ sender: UIButton) {
        if self.isZoom {
            btnMagnify.setTitle("축소", for: .normal)
            self.isZoom = false
        } else {
            btnMagnify.setTitle("확대", for: .normal)
            self.isZoom = true
        }
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
