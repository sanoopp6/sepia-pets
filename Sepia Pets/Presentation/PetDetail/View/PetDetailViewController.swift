//
//  PetDetailViewController.swift
//  Sepia Pets
//
//  Created by Sanoop PM on 30/11/22.
//

import Foundation
import UIKit
import WebKit

class PetDetailViewController: UIViewController, StoryboardInstantiable {
    
    @IBOutlet weak var petNameLabel: UILabel!
    @IBOutlet weak var detailWebView: WKWebView!
    
    var pet: Pet!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initView()
        
    }
    
    func initView() {
        self.petNameLabel.text = pet.title?.uppercased()
        let contentUrl = URL(string: pet.contentUrl!)
        self.detailWebView.load(URLRequest(url: contentUrl!))
    }
    
    static func create(pet: Pet) -> PetDetailViewController {
        let view = PetDetailViewController.instantiateViewController()
        view.pet = pet
        return view
    }
    
}
