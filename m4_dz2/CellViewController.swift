

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
    //private let likeImage = UIImageView(image: UIImage(named: "like"))
    
    private let likeButton: UIButton = {
        let bt = UIButton()
        bt.setBackgroundImage(UIImage(named: "like"), for: .normal)
        return bt
    }()
    
    private let nameLabel: UILabel = {
        let nl = UILabel()
        nl.font = .boldSystemFont(ofSize: 22)
        return nl
    }()
    
    private let priceLabel: UILabel = {
        let nl = UILabel()
        nl.font = .boldSystemFont(ofSize: 20)
        nl.textColor = .systemBlue
        return nl
    }()
    
    private let detailLabel: UILabel = {
        let nl = UILabel()
        nl.font = .systemFont(ofSize: 20)
        nl.text = "Product Details"
        return nl
    }()
    
    private let nameTextView: UITextView = {
        let nt = UITextView()
        nt.font = .systemFont(ofSize: 15)
        //nt.attributedText = NSAttributedString(NSParagraphStyle)
        nt.text = "Room Type  Color  Material  Dimentions  Weight"
        nt.textColor = .systemGray2
        return nt
    }()
    
    private let detailsTextView: UITextView = {
        let nt = UITextView()
        nt.font = .systemFont(ofSize: 15)
        //nt.attributedText = NSAttributedString(NSParagraphStyle)
        return nt
    }()
    
    private let buyButton: UIButton = {
        let bt = UIButton()
        bt.titleLabel?.font = .systemFont(ofSize: 17)
        bt.setTitle("Buy", for: .normal)
        bt.backgroundColor = .systemBlue
        bt.layer.cornerRadius = 12
        return bt
    }()
    
    private let minusButton: UIButton = {
        let bt = UIButton()
        bt.setBackgroundImage(UIImage(named: "minus"), for: .normal)
        return bt
    }()
    
    private let plusButton: UIButton = {
        let bt = UIButton()
        bt.setBackgroundImage(UIImage(named: "plus"), for: .normal)
        return bt
    }()
    
    private let countLabel: UILabel = {
        let nl = UILabel()
        nl.font = .boldSystemFont(ofSize: 15)
        nl.text = ""
        return nl
    }()
    
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
        
        mainImage.addSubview(likeButton)
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
            nameLabel.topAnchor.constraint(equalTo: mainImage.bottomAnchor, constant: 20)
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
        
        view.addSubview(nameTextView)
        nameTextView.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            nameTextView.heightAnchor.constraint(equalToConstant: 100),
            nameTextView.widthAnchor.constraint(equalToConstant: 100),
            nameTextView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            nameTextView.topAnchor.constraint(equalTo: detailLabel.bottomAnchor, constant: 10)
        ])
        
        detailsTextView.text = "\(item!.info.roomType)  \(item!.info.color)  \(item!.info.material)  \(item!.info.dimentions)  \(item!.info.weight)"
        view.addSubview(detailsTextView)
        detailsTextView.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            detailsTextView.heightAnchor.constraint(equalToConstant: 100),
            detailsTextView.widthAnchor.constraint(equalToConstant: 100),
            detailsTextView.leadingAnchor.constraint(equalTo: nameTextView.trailingAnchor, constant: 40),
            detailsTextView.topAnchor.constraint(equalTo: nameTextView.topAnchor)
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
            //countLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
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
