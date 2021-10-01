import UIKit

class RestaurantViewCell: UICollectionViewCell {
    
    let restaurantPhoto = UIImageView()
    let restaurantName = UILabel()
    let dateVisited = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.layer.cornerRadius = 15
        contentView.backgroundColor = .white
        addSubviews()
        setupRestaurantPhoto()
        displayRestaurantPhoto()
        setupRestaurantName()
        displayRestaurantName()
        setupDateVisited()
        displayDateVisited()
    }

    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addSubviews(){
        restaurantPhoto.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(restaurantPhoto)
        
        restaurantName.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(restaurantName)
        
        dateVisited.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(dateVisited)
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
            restaurantPhoto.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20),
            restaurantPhoto.widthAnchor.constraint(equalToConstant: 116),
            restaurantPhoto.heightAnchor.constraint(equalTo: restaurantPhoto.widthAnchor),
            restaurantPhoto.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            restaurantPhoto.leadingAnchor.constraint(
                equalTo: contentView.leadingAnchor,
                constant: 25),
            restaurantPhoto.trailingAnchor	.constraint(
                equalTo: contentView.trailingAnchor	,
                constant: -25)
        ])
    }
    
    private func setupRestaurantName() {
        restaurantName.font = UIFont.boldSystemFont(ofSize: 20)
        restaurantName.textColor = UIColor(named: "Gray")
        restaurantName.textAlignment = .center
        restaurantName.numberOfLines = 0
    }
    
    private func displayRestaurantName() {
        NSLayoutConstraint.activate([
            restaurantName.topAnchor.constraint(equalTo: restaurantPhoto.bottomAnchor, constant: 20),
            restaurantName.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 0.8),
            restaurantName.centerXAnchor.constraint(equalTo: contentView.centerXAnchor)
        ])
    }
    
    private func setupDateVisited() {
        dateVisited.font = UIFont.boldSystemFont(ofSize: 16)
        dateVisited.textColor = UIColor(named: "Gray")
        dateVisited.textAlignment = .center
        dateVisited.text = "21/09/2021"
    }
    
    private func displayDateVisited() {
        NSLayoutConstraint.activate([
            dateVisited.topAnchor.constraint(equalTo: restaurantName.bottomAnchor, constant: 20),
            dateVisited.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            dateVisited.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            dateVisited.bottomAnchor.constraint(
                equalTo: contentView.bottomAnchor,
                constant: -20)
        ])
    }
}
