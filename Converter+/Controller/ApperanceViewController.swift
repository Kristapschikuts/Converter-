//
//  ApperanceViewController.swift
//  Converter+
//
//  Created by Arkadijs Makarenko on 10/02/2021.
//

import UIKit

class ApperanceViewController: UIViewController {

    @IBOutlet weak var modeLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setLabelText()
        // Do any additional setup after loading the view.
    }
    @IBAction func closeButtonTapped(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func openSettingsTapped(_ sender: Any) {
        openSettings()
    }
    
    
    func setLabelText(){
        var text = "Unable to specify UI Style"
        if self.traitCollection.userInterfaceStyle == .dark {
            text = "Dark Mode is on. \n Go to settings if you would like \nto cahnge to Light Mode"
        }else{
            text = "Light Mode is on. \n Go to settings if you would like \nto cahnge to Dark Mode"
        }
        
        modeLabel.text = text
    }
    
    func openSettings(){
        guard let settingsURL = URL(string: UIApplication.openSettingsURLString) else {
            return
        }
        
        if UIApplication.shared.canOpenURL(settingsURL){
            UIApplication.shared.open(settingsURL, options: [:]) { (success) in
                print("open: ", success)
            }
        }
    }

}//end

extension ApperanceViewController {
    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        setLabelText()
    }
}
