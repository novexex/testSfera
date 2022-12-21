//
//  FavoritesViewController.swift
//  testSfera
//
//  Created by Artour Ilyasov on 01.12.2022
//

import UIKit

protocol FavoritesViewProtocol: AnyObject {
    func presenterOutput(vc: DetailCellViewController)
    func configureWelcomeLabel()
    func removeWelcomeLabel()
}

class FavoritesViewController: UIViewController {
    var presenter: FavoritesPresenterProtocol?
    private let tableViewController = UITableViewController()
    private let myVC = UITableViewController()
    private var welcomeLabel = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initialize()
        presenter?.viewOutput()
        configureWelcomeLabel()
        title = Resources.Titles.NavBar.favorites
        navigationController?.tabBarItem.title = Resources.Titles.TabBar.favorites
    }
    
    override func viewDidAppear(_ animated: Bool) {
        refreshMealsView()
        refreshDrinksView()
    }
    
    func refreshMealsView() {
        guard let presenter, !presenter.mealsArrayIsEmpty else { return }
        let indexPath = IndexPath(row: presenter.mealsArrayCount - 1, section: 0)
        
        tableViewController.tableView.reloadData()
        
        guard tableViewController.tableView.numberOfRows(inSection: 0) == indexPath.row else { return }
        tableViewController.tableView.insertRows(at: [indexPath], with: .automatic)
        tableViewController.tableView.reloadRows(at: [indexPath], with: .automatic)
    }
    
    func refreshDrinksView() {
        guard let presenter, !presenter.drinksArrayIsEmpty else { return }
        let indexPath = IndexPath(row: presenter.drinksArrayCount - 1, section: 1)
        
        tableViewController.tableView.reloadData()
        
        guard tableViewController.tableView.numberOfRows(inSection: 1) == indexPath.row else { return }
        tableViewController.tableView.insertRows(at: [indexPath], with: .automatic)
        tableViewController.tableView.reloadRows(at: [indexPath], with: .automatic)
    }
}

extension FavoritesViewController: UITableViewDelegate, UITableViewDataSource, FavoritesViewProtocol {
    func configureWelcomeLabel() {
        welcomeLabel = {
            let label = UILabel()
            label.text = "You haven't saved any recipes yet\n Come back when you do"
            label.numberOfLines = 0
            label.textAlignment = .center
            label.sizeToFit()
            label.textColor = .gray
            
            return label
        }()
        view.addSubview(welcomeLabel)
        welcomeLabel.pin(to: view)
    }
    
    func presenterOutput(vc: DetailCellViewController) {
        self.present(vc, animated: true)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //надо попробовать создать 3 секции и перед удалением нулевой перемещать её в третью и удалять
        guard let presenter else { return 0 }
        return section == 0 ? presenter.mealsArrayCount : presenter.drinksArrayCount
    }
    
    func removeWelcomeLabel() {
        welcomeLabel.removeFromSuperview()
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        guard let presenter else { return 0 }
        return presenter.countSections()
//        3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        presenter?.recipesAddCell(tableView, cellForRowAt: indexPath) ?? UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        presenter?.recipesRemoveCell(tableView, commit: editingStyle, forRowAt: indexPath)
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        presenter?.detailView(didSelectRowAt: indexPath)
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        presenter?.getSectionName(section: section)
    }
    
    func initialize() {
        guard let presenter else { return }
        view.addSubview(tableViewController.tableView)
        
        tableViewController.tableView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            tableViewController.tableView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            tableViewController.tableView.widthAnchor.constraint(equalTo: view.widthAnchor),
            tableViewController.tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableViewController.tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -85),
        ])
        
        tableViewController.tableView.register(UITableViewCell.self, forCellReuseIdentifier: presenter.cellIdentifier)
        tableViewController.tableView.delegate = self
        tableViewController.tableView.dataSource = self
    }
}
