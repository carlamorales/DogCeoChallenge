import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.makeKeyAndVisible()
        window?.backgroundColor = .systemBackground
        
        let restApiCall = APICall()
        let breedsMapper = BreedsListToArrayMapper()
        let picturesMapper = PicturesListToArrayMapper()
        let repository = DogApiRepository(restApi: restApiCall, breedsMapper: breedsMapper, picturesMapper: picturesMapper)
        let breedsListViewController = BreedsListViewController()
        breedsListViewController.dogRepository = repository
        
        let navigationController = UINavigationController(rootViewController: breedsListViewController)
        window?.rootViewController = navigationController
        
        return true
        
    }
    
}
