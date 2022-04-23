//
//  BreedsListTableViewCell.swift
//  DogCeoChallenge
//
//  Created by Mobdev on 23-04-22.
//

import UIKit

class BreedsListTableViewCell: UITableViewCell {
    
    let breedLabel = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.addSubview(breedLabel)
        
        breedLabel.font = UIFont.systemFont(ofSize: 20)
        
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
