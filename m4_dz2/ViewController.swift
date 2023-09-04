
import UIKit

class ViewController: UIViewController {

    private let tableView: UITableView = {
        let tableView = UITableView()
        return tableView
        
    }()

   public var items: [Item] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.register(TableViewCell.self, forCellReuseIdentifier: "cellId")
        InitUI()
        
        items = [Item(name: "Earplugs", count: 20, image: UIImageView(image: UIImage(named: "earplugs")), info: Info(roomType: "Cabinet", color: "Black", material: "material", dimentions: "dimentions", weight: "weight")),
                 
                    Item(name: "Kitchen", count: 2, image: UIImageView(image: UIImage(named: "kitchen")), info: Info(roomType: "Kitchen", color: "White", material: "material", dimentions: "dimentions", weight: "weight")),
                 
                    Item(name: "Sofa", count: 14, image: UIImageView(image: UIImage(named: "sofa")), info: Info(roomType: "Living Room", color: "Gray", material: "material", dimentions: "dimentions", weight: "weight")),
                 
                    Item(name: "Chair", count: 43, image: UIImageView(image: UIImage(named: "chair")), info: Info(roomType: "Living Room", color: "Yellow", material: "material", dimentions: "dimentions", weight: "weight"))]
    }
    
    private func InitUI() {
        
        view.backgroundColor = .white
        //tableView.rowHeight = UITableView.automaticDimension
        view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            tableView.topAnchor.constraint(equalTo: view.topAnchor, constant: 10),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -10)
        ])
        
    }

}

extension ViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellId", for: indexPath) as! TableViewCell
        
        cell.setCellImage(image: items[indexPath.row].image.image!)
        cell.nameLabel.text = items[indexPath.row].name
        
        return cell
    }

}

