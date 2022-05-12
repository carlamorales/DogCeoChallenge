class PicturesViewModelToPicturesListMapper: Mapper<[PicturesViewModel], PicturesList> {
    override func reverseMap(value: PicturesList) -> [PicturesViewModel] {
        //return value.message.map { PicturesViewModel(name: $0)}
        var newValues = [PicturesViewModel]()
        for picture in value.message {
            newValues.append(PicturesViewModel(name: picture))
        }
        return newValues
    }
}
