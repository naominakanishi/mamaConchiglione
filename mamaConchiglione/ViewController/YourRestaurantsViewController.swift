//
//  YourRestaurantsViewController.swift
//  mamaConchiglione
//
//  Created by Naomi Nakanishi on 28/09/21.
//

import Foundation

import UIKit

class YourRestaurantsViewController: UIViewController {
    
    let separatorView = UIView()
    let yourRestaurantsTitle = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(named: "Beige")
    
        // funcs here
        addSubviews()
        displaySeparatorView()
        displayYourRestaurantsTitle()
        setupYourRestaurantsTitle()
        displayCollectionView()
        
        navigationController?.setNavigationBarHidden(true, animated: false)
        
    }
    
    var restaurantNames: [String] = ["Restaurante 1",
                                    "Restaurante 2",
                                    "Restaurante 3",
                                    "Restaurante 4",
                                    "Restaurante 5",
                                    "Restaurante 6",
                                    "Restaurante 7"
                                    ]
    
    
    lazy var restaurantsCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.estimatedItemSize = UICollectionViewFlowLayout.automaticSize
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.register(RestaurantViewCell.self, forCellWithReuseIdentifier: "RestaurantViewCell")
        collectionView.backgroundColor = .white
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
    }()

    let vSpacing: CGFloat = 20

    
//    init() {
//        super.init(nibName: nil, bundle: nil)
//    }
//
//    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
//
   
    
    private func addSubviews() {
        separatorView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(separatorView)
        
        yourRestaurantsTitle.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(yourRestaurantsTitle)
        
        restaurantsCollectionView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(restaurantsCollectionView)
    }
    
    private func displaySeparatorView() {
        NSLayoutConstraint.activate([
            separatorView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            separatorView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.9),
            separatorView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            separatorView.heightAnchor.constraint(equalToConstant: 2)
        ])
        
        separatorView.backgroundColor = UIColor(named: "Gray")
    }
    
    private func displayYourRestaurantsTitle() {
        NSLayoutConstraint.activate([
            yourRestaurantsTitle.topAnchor.constraint(equalTo: separatorView.bottomAnchor, constant: vSpacing),
            yourRestaurantsTitle.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.7),
            yourRestaurantsTitle.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20)

        ])
        yourRestaurantsTitle.numberOfLines = 0
    }
    
    private func setupYourRestaurantsTitle() {
        yourRestaurantsTitle.text = "Seus Restaurantes"
        yourRestaurantsTitle.font = UIFont.boldSystemFont(ofSize: 34)
        yourRestaurantsTitle.textColor = UIColor(named: "Gray")
        yourRestaurantsTitle.textAlignment = .left
    }
    
    private func displayCollectionView() {
        
        NSLayoutConstraint.activate([
            restaurantsCollectionView.topAnchor.constraint(equalTo: yourRestaurantsTitle.bottomAnchor, constant: 20),
            restaurantsCollectionView.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 0.9),
            restaurantsCollectionView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            restaurantsCollectionView.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor)
            
        ])
        
        restaurantsCollectionView.backgroundColor = .clear
    }
    
   
}

extension YourRestaurantsViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return restaurantNames.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "RestaurantViewCell", for: indexPath) as! RestaurantViewCell
        let restaurantName = restaurantNames[indexPath.item]
        cell.restaurantName.text = restaurantName
        return cell
    }
}
