protocol BreedsListView: AnyObject {
    func displayList(_ list: [BreedsViewModel])
    func displayError()
    func showNextViewController(name: String)
    
    var breedsArray: [BreedsViewModel] { get set }
}
