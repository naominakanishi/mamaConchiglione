//
//  NearRestaurantsViewController.swift
//  mamaConchiglione
//
//  Created by Naomi Nakanishi on 30/09/21.
//

import UIKit

class NearRestaurantsViewController: UIViewController {
    
    let separatorView = UIView()
    let nearRestaurantsTitle = UILabel()
    
    let vSpacing: CGFloat = 20
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(named: "Beige")
        
        addSubviews()
        displaySeparatorView()
        displayNearRestaurantsTitle()
        setupNearRestaurantsTitle()
        displayTableView()

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
    
    lazy var nearRestaurantsTableView: UITableView = {
        let tableView = UITableView()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(RestaurantTableViewCell.self, forCellReuseIdentifier: "RestaurantTableViewCell")
        tableView.tableFooterView = UIView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    
    
    
    private func addSubviews() {
        separatorView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(separatorView)
        
        nearRestaurantsTitle.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(nearRestaurantsTitle)
        
        nearRestaurantsTableView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(nearRestaurantsTableView)
        
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
    
    private func displayNearRestaurantsTitle() {
        NSLayoutConstraint.activate([
            nearRestaurantsTitle.topAnchor.constraint(equalTo: separatorView.bottomAnchor, constant: vSpacing),
            nearRestaurantsTitle.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.7),
            nearRestaurantsTitle.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20)

        ])
        nearRestaurantsTitle.numberOfLines = 0
    }
    
    private func setupNearRestaurantsTitle() {
        nearRestaurantsTitle.text = "Restaurantes Perto de Você"
        nearRestaurantsTitle.font = UIFont.boldSystemFont(ofSize: 34)
        nearRestaurantsTitle.textColor = UIColor(named: "Gray")
        nearRestaurantsTitle.textAlignment = .left
    }
    
    private func displayTableView() {
        NSLayoutConstraint.activate([
            nearRestaurantsTableView.topAnchor.constraint(equalTo: nearRestaurantsTitle.bottomAnchor, constant: vSpacing),
            nearRestaurantsTableView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.9),
            nearRestaurantsTableView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            nearRestaurantsTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -20)
        ])
        
        nearRestaurantsTableView.backgroundColor = .clear
    }
    
   
}

extension NearRestaurantsViewController: UITableViewDelegate, UITableViewDataSource {
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return restaurantNames.count
    }
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "RestaurantTableViewCell") as! RestaurantTableViewCell
        let restaurantName = restaurantNames[indexPath.row]
        cell.restaurantName.text = restaurantName
        return cell
    }
}
