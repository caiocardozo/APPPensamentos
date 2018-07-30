//
//  ConfigViewController.swift
//  PensamentosApp
//
//  Created by Caio Cardozo on 30/06/18.
//  Copyright © 2018 Caio Cardozo. All rights reserved.
//

import UIKit

class ConfigViewController: UIViewController {

    @IBOutlet weak var swAutoRefresh: UISwitch!
    @IBOutlet weak var slTimerInterval: UISlider!
    @IBOutlet weak var scColorScheme: UISegmentedControl!
    @IBOutlet weak var lbTimerInterval: UILabel!
    
    let config = Configuration.shared
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        formatView()
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        NotificationCenter.default.addObserver(forName: NSNotification.Name(rawValue: "Refresh"), object: nil, queue: nil) { (notification) in
            self.formatView()
        }
    }
    
    func formatView() {
        swAutoRefresh.setOn(config.autoRefresh, animated: false)
        slTimerInterval.setValue(Float(config.timeInterval), animated: false )
        scColorScheme.selectedSegmentIndex = config.colorScheme
        changeTimerIntervalLabel(with: Int(config.timeInterval))
    }
    
    func changeTimerIntervalLabel(with value: Int) {
        lbTimerInterval.text = "Mudar após \(Int(value)) segundos"
    }
    

    @IBAction func changeAutoRefresh(_ sender: UISwitch) {
        config.autoRefresh = sender.isOn
    }
    
    @IBAction func changeTimerInterval(_ sender: UISlider) {
        let valor = Double(round(sender.value))
        changeTimerIntervalLabel(with: Int(valor))
        config.timeInterval = valor
    }
    
    @IBAction func changeColorScheme(_ sender: UISegmentedControl) {
        config.colorScheme = sender.selectedSegmentIndex
    }
    
}
