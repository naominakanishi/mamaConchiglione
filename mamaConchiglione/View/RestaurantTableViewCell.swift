import UIKit

class RestaurantTableViewCell: UITableViewCell {
    
    let restaurantPhoto = UIImageView()
    let restaurantName = UILabel()
    let restaurantDistance = UILabel()
    let foodType = UILabel()
    
    let photoMargin: CGFloat = 20
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.layer.cornerRadius = 15
        contentView.backgroundColor = .white
        contentView.translatesAutoresizingMaskIntoConstraints = false
        addSubviews()
        setupFoodType()
        setupRestaurantPhoto()
        displayRestaurantPhoto()
        setupRestaurantName()
        displayRestaurantName()
        setupRestaurantDistance()
        displayRestaurantDistance()
        setupFoodType()
        displayFoodType()
    }
        
        required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
    }
    
    
    private func addSubviews() {
        restaurantPhoto.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(restaurantPhoto)
        
        restaurantName.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(restaurantName)
        
        restaurantDistance.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(restaurantDistance)
        
        foodType.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(foodType)
    }
    
    private func setupRestaurantPhoto() {
        let sourceImage = UIImage(named: "placeholder")!
        
        // shortest side:
        let sideLength = min(
                            sourceImage.size.width,
                            sourceImage.size.height
        )
        
        // determines the x and y coordinates of sideLength by sideLength square
        
        let sourceSize = sourceImage.size
        let xOffset = (sourceSize.width - sideLength) / 2.0
        let yOffset = (sourceSize.height - sideLength) / 2.0
        
        let cropRect = CGRect(
            x: xOffset,
            y: yOffset,
            width: sideLength,
            height: sideLength
        ).integral
        
        let sourceCGImage = sourceImage.cgImage!
        let croppedCGImage = sourceCGImage.cropping(to: cropRect)
        
        let croppedImage = UIImage(cgImage: croppedCGImage!,                                   scale: sourceImage.imageRendererFormat.scale,
                                   orientation: sourceImage.imageOrientation)
        
        restaurantPhoto.image = croppedImage
        restaurantPhoto.layer.cornerRadius = 15
    }
    
    private func displayRestaurantPhoto() {
        NSLayoutConstraint.activate([
            restaurantPhoto.topAnchor.constraint(equalTo: contentView.topAnchor, constant: photoMargin),
            restaurantPhoto.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -photoMargin),
            restaurantPhoto.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: photoMargin),
            restaurantPhoto.widthAnchor.constraint(equalToConstant: 60),
            restaurantPhoto.heightAnchor.constraint(equalToConstant: 60)
            
        ])
    }
    
    private func setupRestaurantName() {
        restaurantName.font = UIFont.boldSystemFont(ofSize: 20)
        restaurantName.textColor = UIColor(named: "Gray")
        restaurantName.textAlignment = .left
        
    }
    
    private func displayRestaurantName() {
        NSLayoutConstraint.activate([
            restaurantName.topAnchor.constraint(equalTo: restaurantPhoto.topAnchor),
            restaurantName.leadingAnchor.constraint(equalTo: restaurantPhoto.trailingAnchor, constant: photoMargin),
            restaurantName.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -photoMargin)
        ])
    }
    
    private func setupRestaurantDistance(){
        restaurantDistance.font = UIFont.systemFont(ofSize: 16)
        restaurantDistance.textColor = UIColor(named: "Gray")
        restaurantDistance.textAlignment = .left
    }
    
    private func displayRestaurantDistance() {
        NSLayoutConstraint.activate([
            restaurantDistance.topAnchor.constraint(equalTo: restaurantName.bottomAnchor),
            restaurantDistance.leadingAnchor.constraint(equalTo: restaurantName.leadingAnchor),
            restaurantDistance.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -photoMargin)
        ])
    }
    
    private func setupFoodType() {
        foodType.font = UIFont.systemFont(ofSize: 16)
        foodType.textColor = UIColor(named: "Gray")
        foodType.textAlignment = .left
    }
    
    private func displayFoodType() {
        NSLayoutConstraint.activate([
            foodType.topAnchor.constraint(equalTo: restaurantDistance.topAnchor),
            foodType.leadingAnchor.constraint(equalTo: restaurantDistance.trailingAnchor, constant: 10),
            foodType.bottomAnchor.constraint(equalTo: restaurantDistance.bottomAnchor)
        ])
    }
}
