//
//  DetailViewController.swift
//  AstroPizza
//
//  Created by Theo Vora on 7/6/22.
//

import UIKit

protocol AddPizzaProtocol {
    func addPizzaToCart()
}

class DetailViewController: UIViewController {
    
    // MARK: - Outlets
    
    @IBOutlet weak var pizzaNameLabel: UILabel!
    @IBOutlet weak var addToCartButton: UIButton!
    
    // MARK: - Properties
    
    var pizza: Pizza?
    var addPizzaProtocolDelegate: AddPizzaProtocol?
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        setupView()
    }
    
    func setupView() {
        guard let pizza = pizza else { return }
        
        pizzaNameLabel.text = pizza.name
    }
    
    // MARK: - action
    
    @IBAction func tappedAddToCartButton(_ sender: Any) {
        addPizzaProtocolDelegate?.addPizzaToCart()
    }
}
