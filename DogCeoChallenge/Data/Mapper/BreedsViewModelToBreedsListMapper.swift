class BreedsViewModelToBreedsListMapper: Mapper<[BreedsViewModel], BreedsList> {
    override func reverseMap(value: BreedsList) -> [BreedsViewModel] {
        //return value.message.map { BreedsViewModel(name: $0)}
        var newValues = [BreedsViewModel]()
        for breed in value.message {
            newValues.append(BreedsViewModel(name: breed))
        }
        return newValues
    }
}
