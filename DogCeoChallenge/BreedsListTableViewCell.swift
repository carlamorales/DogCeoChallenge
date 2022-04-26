import UIKit

class BreedsListTableViewCell: UITableViewCell {
    
    let breedLabel = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        prepareViews()
        prepareStyles()
        prepareConstraints()
    }
    
    private func prepareViews() {
        contentView.addSubview(breedLabel)
    }
    
    private func prepareStyles() {
        breedLabel.font = UIFont.systemFont(ofSize: 18)
    }
    
    private func prepareConstraints() {
        breedLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            breedLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 15),
            breedLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 15),
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
