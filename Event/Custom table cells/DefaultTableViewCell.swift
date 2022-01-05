//
//  EventTableViewCell.swift
//  Event
//
//  Created by Vincent Cubit on 12/30/21.
//


import UIKit


class DefaultTableViewCell: UITableViewCell {
    
    
    static let id = "DefaultTableViewCell"

    
    // MARK: UI Elements
    private let accountImage: UIImageView = {
        let imageView = UIImageView()
        imageView.clipsToBounds = true
        imageView.layer.masksToBounds = true
        imageView.contentMode = .scaleAspectFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    
    private let accountOrBusinessFirstInitial: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 18.0)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    
    private let cellTopLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 14.0)
        label.textColor = .systemCyan
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    
    private let cellBottomLabel: UILabel = {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize: 14.0)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    
    // MARK: Other data
    private let colors: [ UIColor ] = [
        .systemRed,
        .systemBlue,
        .systemCyan,
        .systemGray,
        .systemMint,
        .systemPink,
        .systemTeal,
        .systemBrown,
        .systemGreen,
        .systemPurple,
        .systemOrange,
        .systemYellow,
        .systemIndigo,
    ]

    
    
    // MARK: Initialization
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.contentView.addSubview(self.accountImage)
        self.contentView.addSubview(self.cellTopLabel)
        self.contentView.addSubview(self.cellBottomLabel)
        self.accountImage.addSubview(self.accountOrBusinessFirstInitial)
        self.accountOrBusinessFirstInitial.textColor = .white
        
        
        let constraints: [ NSLayoutConstraint ] = [
            self.accountImage.leftAnchor.constraint(equalTo: self.contentView.layoutMarginsGuide.leftAnchor),
            self.accountImage.centerYAnchor.constraint(equalTo: self.contentView.layoutMarginsGuide.centerYAnchor),
            self.accountImage.widthAnchor.constraint(equalToConstant: 44.0),
            self.accountImage.heightAnchor.constraint(equalToConstant: 44.0),
            self.cellTopLabel.topAnchor.constraint(equalTo: self.contentView.layoutMarginsGuide.topAnchor),
            self.cellTopLabel.leftAnchor.constraint(equalTo: self.accountImage.layoutMarginsGuide.rightAnchor, constant: 30.0),
            self.cellBottomLabel.leftAnchor.constraint(equalTo: self.cellTopLabel.leftAnchor),
            self.cellBottomLabel.topAnchor.constraint(equalTo: self.cellTopLabel.bottomAnchor, constant: 13.0),
            self.accountOrBusinessFirstInitial.centerXAnchor.constraint(equalTo: self.accountImage.centerXAnchor),
            self.accountOrBusinessFirstInitial.centerYAnchor.constraint(equalTo: self.accountImage.centerYAnchor),
        ]
        NSLayoutConstraint.activate(constraints)
        
        
        self.accountImage.layer.cornerRadius = 22.0
        
        
    }
    
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    

    public func configureDefaultCell(accountImage: UIImage?, profileOrBusinessFirstInitial: String?, cellTopLabel: String, cellBottomLabel: String, cellTopLabelColor: UIColor, cellBottomLabelColor: UIColor) {
        if let image = accountImage {
            self.accountOrBusinessFirstInitial.removeFromSuperview()
            self.accountImage.image = image
        } else {
            self.accountImage.image = nil
            self.accountImage.backgroundColor = self.colors.randomElement()
            if let initial = profileOrBusinessFirstInitial {
                self.accountOrBusinessFirstInitial.text = initial
            }
        }
        
        
        self.cellTopLabel.text = cellTopLabel
        self.cellBottomLabel.text = cellBottomLabel
        self.cellTopLabel.textColor = cellTopLabelColor
        self.cellBottomLabel.textColor = cellBottomLabelColor
        
    }
    
    
}

