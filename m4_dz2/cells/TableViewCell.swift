
import UIKit

class TableViewCell: UITableViewCell {
    
    private var cellImage: UIImageView = {
        let cellImage = UIImageView()
        cellImage.layer.cornerRadius = 11
        cellImage.contentMode = .scaleAspectFit
        return cellImage
    }()
    
    var nameLabel = MakerView.shared.makeLabel(font: .boldSystemFont(ofSize: 24))
    
    
    var countLabel = MakerView.shared.makeLabel(font: .boldSystemFont(ofSize: 15))
    


    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        contentView.addSubview(cellImage)
        cellImage.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            cellImage.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            cellImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            cellImage.heightAnchor.constraint(equalToConstant: 166),
            cellImage.widthAnchor.constraint(equalToConstant: 350)

        ])
        
        contentView.addSubview(nameLabel)
        nameLabel.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            nameLabel.topAnchor.constraint(equalTo: cellImage.bottomAnchor, constant: 8),
            nameLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),

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
