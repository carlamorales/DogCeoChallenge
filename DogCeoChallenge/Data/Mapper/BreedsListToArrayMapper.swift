class BreedsListToArrayMapper: Mapper<BreedsList, [String]> {
    override func reverseMap(value: [String]) -> BreedsList {
        return BreedsList(message: value)
    }
}
