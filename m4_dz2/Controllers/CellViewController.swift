

import UIKit

class CellViewController: UIViewController {

    var item: Item?
    var counter = 1
    
    private var mainImage: UIImageView = {
        let mainImage = UIImageView()
        mainImage.contentMode = .scaleAspectFit
        return mainImage
    }()
    
    
    private let closeImage = UIImageView(image: UIImage(named: "close"))
    private let downloadImage = UIImageView(image: UIImage(named: "download"))
    
    private let likeButton: UIButton = {
        let bt = UIButton()
        bt.setBackgroundImage(UIImage(named: "like"), for: .normal)
        return bt
    }()
    
    private let nameLabel = MakerView.shared.makeLabel(font: .boldSystemFont(ofSize: 22))
    private let priceLabel = MakerView.shared.makeLabel(textColor: .systemBlue,
                                                        font: .boldSystemFont(ofSize: 20))
    
    private let detailLabel = MakerView.shared.makeLabel(text: "Product Details",
                                                        font: .boldSystemFont(ofSize: 20))
    
    private let roomTypelLabel = MakerView.shared.makeLabel(text: "Room Type",
                                                            textColor: .systemGray)
    
    private let colorLabel = MakerView.shared.makeLabel(text: "Color",
                                                         textColor: .systemGray)
    
    private let materialLabel = MakerView.shared.makeLabel(text: "Material",
                                                         textColor: .systemGray)
    
    private let dimentionslLabel = MakerView.shared.makeLabel(text: "Dimentions",
                                                         textColor: .systemGray)
    
    private let weightLabel = MakerView.shared.makeLabel(text: "Weight",
                                                         textColor: .systemGray)
    
    private let roomTypelLabel_ = MakerView.shared.makeLabel()
    
    private let colorLabel_ = MakerView.shared.makeLabel()
    
    private let materialLabel_ = MakerView.shared.makeLabel()
    
    private let dimentionslLabel_ = MakerView.shared.makeLabel()
    
    private let weightLabel_ = MakerView.shared.makeLabel()
    
    
    private let buyButton = MakerView.shared.makeButton(title: "Buy",
                                                        backgroundColor: .systemBlue)
    
    
    private let minusButton = MakerView.shared.makeButton(image: UIImage(named: "minus")!)
    
    private let plusButton = MakerView.shared.makeButton(image: UIImage(named: "plus")!)

    
    private let countLabel = MakerView.shared.makeLabel(font: .boldSystemFont(ofSize: 15))
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initUI()
        initButtons()
        initDetails()
        initButton()
        initCounter()
    }
    
    private func initUI() {
        
        view.backgroundColor = .white
        
        mainImage.image = item!.image.image
        view.addSubview(mainImage)
        mainImage.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            mainImage.heightAnchor.constraint(equalToConstant: 375),
            mainImage.widthAnchor.constraint(equalToConstant: view.bounds.width),
            mainImage.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            mainImage.topAnchor.constraint(equalTo: view.topAnchor, constant: 100)
        ])
        
    }
    
    private func initButtons() {
        
        mainImage.addSubview(closeImage)
        closeImage.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            closeImage.leadingAnchor.constraint(equalTo: mainImage.leadingAnchor, constant: 16),
            closeImage.topAnchor.constraint(equalTo: mainImage.topAnchor, constant: 10)
        ])
        
        view.addSubview(likeButton)
        likeButton.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            likeButton.trailingAnchor.constraint(equalTo: mainImage.trailingAnchor, constant: -16),
            likeButton.topAnchor.constraint(equalTo: closeImage.topAnchor)
        ])
        
        likeButton.addTarget(self, action: #selector(like), for: .touchUpInside)
        

        mainImage.addSubview(downloadImage)
        downloadImage.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            downloadImage.trailingAnchor.constraint(equalTo: likeButton.leadingAnchor, constant: -4),
            downloadImage.topAnchor.constraint(equalTo: likeButton.topAnchor, constant: 0)
        ])
    }

    private func initDetails() {
        
        nameLabel.text = item!.name
        view.addSubview(nameLabel)
        nameLabel.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            nameLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            nameLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 16),
            nameLabel.topAnchor.constraint(equalTo: mainImage.bottomAnchor, constant: 10)
        ])
        
        priceLabel.text = item!.price
        view.addSubview(priceLabel)
        priceLabel.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            priceLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            priceLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 20)
        ])
        
        view.addSubview(detailLabel)
        detailLabel.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            detailLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            detailLabel.topAnchor.constraint(equalTo: priceLabel.bottomAnchor, constant: 20)
        ])
        
        view.addSubview(roomTypelLabel)
        roomTypelLabel.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            roomTypelLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            roomTypelLabel.topAnchor.constraint(equalTo: detailLabel.bottomAnchor, constant: 10)
        ])
        
        view.addSubview(colorLabel)
        colorLabel.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            colorLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            colorLabel.topAnchor.constraint(equalTo: roomTypelLabel.bottomAnchor, constant: 5)
        ])
        
        view.addSubview(materialLabel)
        materialLabel.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            materialLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            materialLabel.topAnchor.constraint(equalTo: colorLabel.bottomAnchor, constant: 5)
        ])
        
        view.addSubview(dimentionslLabel)
        dimentionslLabel.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            dimentionslLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            dimentionslLabel.topAnchor.constraint(equalTo: materialLabel.bottomAnchor, constant: 5)
        ])
        
        view.addSubview(weightLabel)
        weightLabel.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            weightLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            weightLabel.topAnchor.constraint(equalTo: dimentionslLabel.bottomAnchor, constant: 5)
        ])
        
        
        view.addSubview(roomTypelLabel_)
        roomTypelLabel_.text = item!.info.roomType
        roomTypelLabel_.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            roomTypelLabel_.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 126),
            roomTypelLabel_.topAnchor.constraint(equalTo: roomTypelLabel.topAnchor)
        ])
        
        view.addSubview(colorLabel_)
        colorLabel_.text = item!.info.color
        colorLabel_.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            colorLabel_.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 126),
            colorLabel_.topAnchor.constraint(equalTo: colorLabel.topAnchor)
        ])
        
        view.addSubview(materialLabel_)
        materialLabel_.text = item!.info.material
        materialLabel_.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            materialLabel_.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 126),
            materialLabel_.topAnchor.constraint(equalTo: materialLabel.topAnchor)
        ])
        
        view.addSubview(dimentionslLabel_)
        dimentionslLabel_.text = item!.info.dimentions
        dimentionslLabel_.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            dimentionslLabel_.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 126),
            dimentionslLabel_.topAnchor.constraint(equalTo: dimentionslLabel.topAnchor)
        ])
        
        view.addSubview(weightLabel_)
        weightLabel_.text = item!.info.weight
        weightLabel_.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            weightLabel_.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 126),
            weightLabel_.topAnchor.constraint(equalTo: weightLabel.topAnchor)
        ])
        
    }
    
    private func initButton() {
       
        view.addSubview(buyButton)
        buyButton.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            buyButton.heightAnchor.constraint(equalToConstant: 50),
            buyButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            buyButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            buyButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -50)
        ])
        
    }
    
    private func initCounter() {
        
        view.addSubview(plusButton)
        plusButton.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            plusButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            plusButton.topAnchor.constraint(equalTo: priceLabel.topAnchor)
        ])
        
        plusButton.addTarget(self, action: #selector(plus), for: .touchUpInside)
       
        countLabel.text = "\(counter)"
        view.addSubview(countLabel)
        countLabel.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            countLabel.trailingAnchor.constraint(equalTo: plusButton.leadingAnchor, constant: -10),
            countLabel.topAnchor.constraint(equalTo: plusButton.topAnchor, constant: 7)
        ])
        
        view.addSubview(minusButton)
        minusButton.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            minusButton.trailingAnchor.constraint(equalTo: countLabel.leadingAnchor, constant: -10),
            minusButton.topAnchor.constraint(equalTo: priceLabel.topAnchor)
        ])
        
        minusButton.addTarget(self, action: #selector(minus), for: .touchUpInside)
    }
    
    @objc func plus() {
        if counter < item!.count {
            counter += 1
            countLabel.text = "\(counter)"
        }
    }
    
    @objc func minus() {
        if counter > 0 {
            counter -= 1
            countLabel.text = "\(counter)"
        }
    }
    
    @objc func like() {
        if likeButton.currentBackgroundImage == UIImage(named: "like") {
            likeButton.setBackgroundImage(UIImage(named: "filledlike"), for: .normal)
        } else {
            likeButton.setBackgroundImage(UIImage(named: "like"), for: .normal)
        }
    }
    
}
