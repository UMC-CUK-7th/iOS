//
//  SavedCell.swift
//  iKREAM
//
//  Created by 김윤진 on 10/19/24.
//

import UIKit
import SnapKit

class SavedCell: UITableViewCell {
    
    static let identifier = "SavedCell"

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.setViews()
        self.setConstraints()
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        self.savedImageView.image = nil
        self.savedName.text = nil
        self.savedDescription.text = nil  
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private lazy var savedImageView: UIImageView = {
        let imageView = UIImageView()
        return imageView
    }()
    
    private lazy var savedName: UILabel = {
        let name = UILabel()
        name.font = UIFont.systemFont(ofSize: 12)
        name.numberOfLines = 0
        name.textAlignment = .left
        name.textColor = UIColor.black
        return name
    }()
    
    private lazy var savedDescription: UILabel = {
        let description = UILabel()
        description.font = UIFont.systemFont(ofSize: 12)
        description.textColor = UIColor.gray
        description.numberOfLines = 2
        return description
    }()
    
    private lazy var savedKeep: UIImageView = {
        let imageView = UIImageView()
        return imageView
    }()
    
    private lazy var savedPrice: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14)
        label.numberOfLines = 0
        label.textAlignment = .right
        label.textColor = UIColor.darkGray
        return label
    }()
    
    private func setViews() {
        self.addSubview(savedImageView)
        self.addSubview(savedName)
        self.addSubview(savedDescription)
        self.addSubview(savedKeep)
        self.addSubview(savedPrice)
    }
    
    private func setConstraints() {
        savedImageView.snp.makeConstraints {
            $0.top.equalToSuperview().offset(13)
            $0.left.equalToSuperview().offset(13)
            $0.bottom.equalToSuperview().offset(-14)
            $0.width.height.equalTo(72)
        }
        
        savedName.snp.makeConstraints {
            $0.top.equalToSuperview().offset(13)
            $0.left.equalTo(savedImageView.snp.right).offset(13)
            $0.right.equalToSuperview().offset(-122)
        }

        savedDescription.snp.makeConstraints {
            $0.top.equalToSuperview().offset(32)
            $0.left.equalTo(savedImageView.snp.right).offset(13)
            $0.width.equalTo(153)
            $0.height.equalTo(33)
        }
        
        savedKeep.snp.makeConstraints {
            $0.top.equalToSuperview().offset(18)
            $0.left.equalTo(savedImageView.snp.right).offset(267)
            $0.width.height.equalTo(18)
        }
        
        savedPrice.snp.makeConstraints {
            $0.top.equalToSuperview().offset(67)
            $0.right.equalToSuperview().offset(-16)
        }
    }
    
    public func configure(model: SavedModel) {
        self.savedImageView.image = UIImage(named: model.savedImage)
        self.savedName.text = model.savedName
        self.savedDescription.text = model.savedDescription
        self.savedKeep.image = UIImage(named: model.savedKeep)
        self.savedPrice.text = model.savedPrice
    }
}
