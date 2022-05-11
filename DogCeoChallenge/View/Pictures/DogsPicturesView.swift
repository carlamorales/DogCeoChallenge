protocol DogPicturesView: AnyObject {
    func displayList(_ list: [PicturesViewModel])
    func displayError()
}
