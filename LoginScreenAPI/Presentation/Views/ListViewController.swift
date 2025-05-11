//
//  ListViewController.swift
//  LoginScreenAPI
//
//  Created by Cesar Rojas on 4/24/25.
//

import UIKit

class ListViewController: UITableViewController {
    
    private let viewModel: ListViewModel
    
    init(viewModel: ListViewModel) {
        self.viewModel = viewModel
        super.init(style: .plain)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .systemBackground
        title = "Data from server"
        
        tableView.register(ListTableViewCell.self, forCellReuseIdentifier: "Cell")
        
        bindViewModel()
        viewModel.fetchUsers()
    }
    
    private func bindViewModel() {
        viewModel.onUsersFetched = { [weak self] in
            self?.tableView.reloadData()
        }
        
        viewModel.onError = { error in
            print("Error fetching users: \(error)")
        }
    }


    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.users.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! ListTableViewCell
        let user = viewModel.users[indexPath.row]
        cell.configure(with: user)

        return cell
    }
}
