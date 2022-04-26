import UIKit

class DogsPicturesTableViewCell: UITableViewCell {
    
    let dogImageView = UIImageView()
    
    override func prepareForReuse() {
        super.prepareForReuse()
        dogImageView.image = UIImage(named: "placeholder")
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        prepareViews()
        prepareStyles()
        prepareConstraints()
    }
    
    private func prepareViews() {
        contentView.addSubview(dogImageView)
    }
    
    private func prepareStyles() {
        dogImageView.image = UIImage(named: "placeholder")
    }
    
    private func prepareConstraints() {
        dogImageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            dogImageView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            dogImageView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            dogImageView.heightAnchor.constraint(equalToConstant: 180),
            dogImageView.widthAnchor.constraint(equalToConstant: 180),
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
