//
//  HomeViewController.swift
//  mamaConchiglione
//
//  Created by Naomi Nakanishi on 28/09/21.
//

import Foundation

import UIKit

class HomeViewController: UIViewController {
    
    let separatorView = UIView()
    let homeTitle = UILabel()
    let placeholderImage = UIImageView()
    let chooseForMeButton = UIButton()
    let exploreRegionButton = UIButton()
    
    let vSpacing: CGFloat = 20
    
    let buttonFontSize: CGFloat = 18
    
    
    init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(named: "Beige")
        
        addSubviews()
        displaySeparatorView()
        displayHomeTitle()
        setupHomeTitle()
        displayPlaceholderImage()
        displayChooseForMeButton()
        setupChooseForMeButton()
        setupExploreRegionButton()
        displayExploreRegionButton()
        
        navigationController?.setNavigationBarHidden(true, animated: false)
        
    }
    
    private func addSubviews() {
        separatorView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(separatorView)
        
        homeTitle.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(homeTitle)
        
        placeholderImage.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(placeholderImage)
        
        chooseForMeButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(chooseForMeButton)
        
        exploreRegionButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(exploreRegionButton)
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
    
    private func displayHomeTitle() {
        NSLayoutConstraint.activate([
            homeTitle.topAnchor.constraint(equalTo: separatorView.bottomAnchor, constant: vSpacing),
            homeTitle.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.7),
            homeTitle.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20)
//            homeTitle.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        homeTitle.numberOfLines = 0
    }
    
    private func setupHomeTitle() {
        homeTitle.text = "O que você quer comer hoje?"
        homeTitle.font = UIFont.boldSystemFont(ofSize: 34)
        homeTitle.textColor = UIColor(named: "Gray")
        homeTitle.textAlignment = .left
    }
    
    private func displayPlaceholderImage() {
        NSLayoutConstraint.activate([
            placeholderImage.topAnchor.constraint(equalTo: homeTitle.bottomAnchor, constant: vSpacing),
            placeholderImage.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.6),
            placeholderImage.heightAnchor.constraint(equalTo: placeholderImage.widthAnchor, multiplier: 446/293),
            placeholderImage.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        placeholderImage.image = UIImage(named: "placeholder")
    }
        
    private func setupChooseForMeButton() {
        chooseForMeButton.backgroundColor = UIColor(named: "DarkLavender")
        chooseForMeButton.setTitle("Escolha por mim", for: .normal)
        chooseForMeButton.titleLabel?.tintColor = .white
        chooseForMeButton.titleLabel?.font = UIFont.systemFont(ofSize: buttonFontSize, weight: .medium)
        chooseForMeButton.titleLabel?.textAlignment = .center
        chooseForMeButton.layer.cornerRadius = 30
        
        chooseForMeButton.addTarget(self, action: #selector(chooseForMeButtonAction), for: .touchUpInside)
       
    }
    
    private func displayChooseForMeButton() {
        NSLayoutConstraint.activate([
            chooseForMeButton.topAnchor.constraint(equalTo: placeholderImage.bottomAnchor, constant: vSpacing),
            chooseForMeButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.8),
            chooseForMeButton.heightAnchor.constraint(equalToConstant: 65),
            chooseForMeButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),

        ])

    }
    
    private func setupExploreRegionButton() {
        exploreRegionButton.backgroundColor = UIColor(named: "DarkLavender")
        exploreRegionButton.setTitle("Explorar região", for: .normal)
        exploreRegionButton.titleLabel?.tintColor = .white
        exploreRegionButton.titleLabel?.font = UIFont.systemFont(ofSize: buttonFontSize, weight: .medium)
        exploreRegionButton.titleLabel?.textAlignment = .center
        exploreRegionButton.layer.cornerRadius = 30
        
    }
    
    private func displayExploreRegionButton() {
        NSLayoutConstraint.activate([
            exploreRegionButton.topAnchor.constraint(equalTo: chooseForMeButton.bottomAnchor, constant: vSpacing/2),
            exploreRegionButton.widthAnchor.constraint(equalTo: chooseForMeButton.widthAnchor),
            exploreRegionButton.heightAnchor.constraint(equalTo: chooseForMeButton.heightAnchor),
            exploreRegionButton.centerXAnchor.constraint(equalTo: chooseForMeButton.centerXAnchor),

        ])
    }
    
    @objc func chooseForMeButtonAction() {
        let chooseForMeAction = YourRestaurantsViewController()
        navigationController?.pushViewController(chooseForMeAction, animated: true)
    }
}
