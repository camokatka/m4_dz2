
import UIKit

class TableViewCell: UITableViewCell {
    
    var cellImage = UIImageView()
    
    var nameLabel: UILabel = {
        let nameLabel = UILabel()
        nameLabel.font = .boldSystemFont(ofSize: 24)
        return nameLabel
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        //contentView.backgroundColor = .orange
        //contentView.heightAnchor.constraint(equalToConstant: 300).isActive = true
        contentView.addSubview(cellImage)
        cellImage.translatesAutoresizingMaskIntoConstraints = false
        cellImage.backgroundColor = .cyan

        NSLayoutConstraint.activate([
            cellImage.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 2),
            cellImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 2),
            //cellImage.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -2),
            //cellImage.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -2)
        ])
        
        contentView.addSubview(nameLabel)
        nameLabel.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            nameLabel.topAnchor.constraint(equalTo: cellImage.topAnchor, constant: 0),
            nameLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 2)
        ])
    }
    
   func setCellImage(image: UIImage = UIImage(systemName: "star")!) {
       cellImage.image = image
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

}
