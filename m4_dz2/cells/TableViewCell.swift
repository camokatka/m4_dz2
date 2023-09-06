
import UIKit

class TableViewCell: UITableViewCell {
    
    var cellImage : UIImageView = {
        let cellImage = UIImageView()
        cellImage.layer.cornerRadius = 11
        cellImage.contentMode = .scaleAspectFit
        return cellImage
    }()
    
    var nameLabel: UILabel = {
        let nameLabel = UILabel()
        nameLabel.font = .boldSystemFont(ofSize: 24)
        return nameLabel
    }()
    
    var countLabel: UILabel = {
        let nameLabel = UILabel()
        nameLabel.font = .boldSystemFont(ofSize: 15)
        return nameLabel
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        //contentView.backgroundColor = .orange
        //contentView.heightAnchor.constraint(equalToConstant: 300).isActive = true
        contentView.addSubview(cellImage)
        cellImage.translatesAutoresizingMaskIntoConstraints = false
        //cellImage.backgroundColor = .cyan

        NSLayoutConstraint.activate([
            cellImage.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            cellImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            cellImage.heightAnchor.constraint(equalToConstant: 200),
            cellImage.widthAnchor.constraint(equalToConstant: 350)
            //cellImage.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -2)
        ])
        
        contentView.addSubview(nameLabel)
        nameLabel.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            nameLabel.topAnchor.constraint(equalTo: cellImage.bottomAnchor, constant: 8),
            nameLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            //nameLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8)
        ])
        
        contentView.addSubview(countLabel)
        countLabel.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            countLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 8),
            countLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            countLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8)
        ])
    }
    
   func setCellImage(image: UIImage = UIImage(systemName: "star")!) {
       cellImage.image = image
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

}
