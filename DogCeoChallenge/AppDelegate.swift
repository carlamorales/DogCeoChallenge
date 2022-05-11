import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.makeKeyAndVisible()
        window?.backgroundColor = .systemBackground
        
        let presenter = BreedsListPresenter(
            getBreedsListUseCase: DogCeoServiceLocator().getBreedsListUseCase
        )
        
        let breedsListViewController = BreedsListViewController(
            viewDataSource: BreedsListViewDataSource(),
            viewDelegate: BreedsListViewDelegate(),
            presenter: presenter
        )
        
        presenter.view = breedsListViewController
        
        let navigationController = UINavigationController(rootViewController: breedsListViewController)
        window?.rootViewController = navigationController
        
        return true
        
    }
    
}
