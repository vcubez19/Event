//
//  ProfileViewController.swift
//  Event
//
//  Created by Vincent Cubit on 12/31/21.
//


import UIKit


class ProfileViewController: UIViewController {

    
    
    @IBOutlet weak var addBusinessBarButton: UIBarButtonItem!
    
    
    // MARK: UI Elements
    private let table: UITableView = {
        let table = UITableView(frame: .zero, style: .insetGrouped)
        table.register(DefaultTableViewCell.self, forCellReuseIdentifier: DefaultTableViewCell.id)
        table.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        return table
    }()
    
        
    
    // MARK: Data
    private let businesses: [ Business ] = [  ]
        
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Profile"
        self.navigationController?.navigationBar.prefersLargeTitles = true
        self.view.addSubview(self.table)
        self.table.delegate = self
        self.table.dataSource = self
        self.table.contentInset = UIEdgeInsets(top: 30.0, left: 0.0, bottom: 0.0, right: 0.0)
        
        
    }
    
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        self.table.frame = self.view.bounds
    }
    
    
    // MARK: Custom methods

    

}


extension ProfileViewController: UITableViewDelegate, UITableViewDataSource {
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return 1
        default:
            return self.businesses.count
        }
    }
    
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section {
        case 1:
            return "My businesses"
        default:
            return nil
        }
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 75.0
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        switch indexPath.section {
        case 0:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: DefaultTableViewCell.id,
                                                           for: indexPath) as? DefaultTableViewCell else { return UITableViewCell() }
            
            
            var businessesText = ""
            if self.businesses.count == 1 {
                businessesText = "\(self.businesses.count) business"
            } else {
                businessesText = "\(self.businesses.count) businesses"
            }
            
            
            cell.configureDefaultCell(accountImage: nil,
                                      profileOrBusinessFirstInitial: "J",
                                      cellTopLabel: "Test name",
                                      cellBottomLabel: businessesText,
                                      cellTopLabelColor: .label,
                                      cellBottomLabelColor: .systemCyan)
            return cell
        default:
                
                guard let cell = tableView.dequeueReusableCell(withIdentifier: DefaultTableViewCell.id,
                                                               for: indexPath) as? DefaultTableViewCell else { return UITableViewCell() }
                
                
                cell.configureDefaultCell(accountImage: nil,
                                          profileOrBusinessFirstInitial: "J",
                                          cellTopLabel: "Test business",
                                          cellBottomLabel: "Location",
                                          cellTopLabelColor: .label,
                                          cellBottomLabelColor: .systemCyan)
                return cell
                
                
            
            
        }

        
    }
    
    
}

