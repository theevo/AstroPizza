//
//  MainViewController.swift
//  AstroPizza
//
//  Created by Theo Vora on 7/6/22.
//

import UIKit

class MainViewController: UIViewController {
    
    // MARK: - Outlets
    
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var pizzaCountLabel: UILabel!
    
    // MARK: - Properties
    
    let pizzas = PizzaData().pizzas
    var pizzaCount: Int = 0
    

    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.dataSource = self
        collectionView.delegate = self
    }
}

extension MainViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        pizzas.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "pizzaCell", for: indexPath) as? PizzaCollectionViewCell else { return UICollectionViewCell() }
        cell.pizzaNameLabel.text = pizzas[indexPath.row].name
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // identifier
        // destination
        guard let destinationVC = segue.destination as? DetailViewController,
              let cell = sender as? PizzaCollectionViewCell,
              let indexPath = collectionView.indexPath(for: cell)
        else { return }
        // what to send
        let pizzaToSend = pizzas[indexPath.row]
        // receiver
        destinationVC.pizza = pizzaToSend
        destinationVC.addPizzaProtocolDelegate = self
    }
}

extension MainViewController: AddPizzaProtocol {
    func addPizzaToCart() {
        DispatchQueue.main.async {
            self.pizzaCount += 1
            self.pizzaCountLabel.text = "Pizza count: \(self.pizzaCount)"
        }
    }
}
