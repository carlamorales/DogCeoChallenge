protocol BreedsListView: AnyObject {
    func displayList(_ list: [BreedsViewModel])
    func displayError()
}
