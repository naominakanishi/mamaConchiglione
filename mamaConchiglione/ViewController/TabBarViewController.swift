import UIKit

class TabBarViewController: UITabBarController {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tabBar.barTintColor = .white
        tabBar.isTranslucent = true
        tabBar.tintColor = UIColor(named: "DarkGreen")
        
        let home = HomeViewController()
        home.tabBarItem = UITabBarItem(title: "Home", image: UIImage(systemName: "house"), selectedImage: UIImage(systemName: "house.fill"))
        
        let capture = HomeViewController()
        capture.tabBarItem = UITabBarItem(title: "Capture", image: UIImage(systemName: "camera"), selectedImage: UIImage(systemName: "camera.fill"))
        
        let search = NearRestaurantsViewController()
        search.tabBarItem = UITabBarItem(title: "Explorar", image: UIImage(systemName: "magnifyingglass"), selectedImage: UIImage(systemName: "magnifyingglass"))
        
        let profile = YourRestaurantsViewController()
        profile.tabBarItem = UITabBarItem(title: "Meus Restaurantes", image: UIImage (systemName: "person"), selectedImage: UIImage(systemName: "person.fill"))
        
        self.viewControllers = [home, capture, search, profile]
    }
    
   
}
