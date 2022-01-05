//
//  ViewController.swift
//  Event
//
//  Created by Vincent Cubit on 12/30/21.
//


import UIKit


class EventsNearMeViewController: UIViewController {
    
    
    private let table: UITableView = {
        let table = UITableView(frame: .zero, style: .insetGrouped)
        table.register(DefaultTableViewCell.self, forCellReuseIdentifier: DefaultTableViewCell.id)
        return table
    }()
    
    
    private let zipCode: String = "60014"

    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Events near me"
        self.navigationController?.navigationBar.prefersLargeTitles = true
        self.view.addSubview(self.table)
        self.table.delegate = self
        self.table.dataSource = self
        self.table.contentInset = UIEdgeInsets(top: 50.0, left: 0.0, bottom: 0.0, right: 0.0)
    }
    
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        self.table.frame = self.view.bounds
    }


}


extension EventsNearMeViewController: UITableViewDelegate, UITableViewDataSource {
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 10
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 75.0
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
    
        guard let cell = tableView.dequeueReusableCell(withIdentifier: DefaultTableViewCell.id,
                                                       for: indexPath) as? DefaultTableViewCell else { return UITableViewCell() }
        cell.configureDefaultCell(accountImage: nil,
                                profileOrBusinessFirstInitial: "T",
                                cellTopLabel: "Test business - 12:00 pm",
                                cellBottomLabel: "Test event name",
                                cellTopLabelColor: .systemCyan,
                                cellBottomLabelColor: .label)
        cell.accessoryType = .disclosureIndicator
        return cell
        

    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    
}

