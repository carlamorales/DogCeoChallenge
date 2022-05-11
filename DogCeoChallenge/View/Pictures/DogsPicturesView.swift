protocol DogsPicturesView: AnyObject {
    func displayList(_ list: [PicturesViewModel])
    func displayError()
}
