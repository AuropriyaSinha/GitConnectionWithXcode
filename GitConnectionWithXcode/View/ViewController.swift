//
//  ViewController.swift
//  MVVMBindings
//
//  Created by Auropriya Sinha on 19/09/22.
//

import UIKit

//Observalble
class Observable<T> {
    
    var value : T? {
        didSet {
            listener?(value)
        }
    }
    private var listener : ((T?) -> Void)?
    init(_ value : T?) {
        self.value = value
    }
    
    func bind(_ listener : @escaping (T?) -> Void) {
        listener(value)
        self.listener = listener
    }
}



//Controller
class ViewController: UIViewController {
    
    @IBOutlet weak var tableViewOutlet : UITableView!
    
//    private let tableView : UITableView = {
//        let table = UITableView()
//        table.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
//        return table
//    }()
    private var viewModel = UserListViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        //view.addSubview(tableView)
        //tableView.frame = view.bounds
        //tableView.dataSource = self
        self.tableViewOutlet.dataSource = self
        
        viewModel.users.bind { [weak self] _ in
            DispatchQueue.main.async {
                self?.tableViewOutlet.reloadData()
            }
        }
    }
}

extension ViewController : UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.users.value?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell : TableViewCell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? TableViewCell ?? TableViewCell()
        cell.personName.text = viewModel.users.value?[indexPath.row].name
        cell.personName.accessibilityHint = "person name is \(viewModel.users.value?[indexPath.row].name ?? "")"
        return cell
    }
}


