//
//  PetsListViewController.swift
//  Sepia Pets
//
//  Created by Sanoop PM on 29/11/22.
//

import UIKit

class PetsListViewController: UIViewController, StoryboardInstantiable, Alertable {

    private var petListViewModel: PetListViewModel!
    @IBOutlet weak var petsTableView: UITableView!
    
    
    static func create() -> PetsListViewController {
        let view = PetsListViewController.instantiateViewController()
        return view
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        initView()
        initViewModel()
    }
    
    func initView() {
        petsTableView.delegate = self
        petsTableView.dataSource = self
        
        petsTableView.register(PetTableViewCell.nib, forCellReuseIdentifier: PetTableViewCell.identifier)

    }
    
    func initViewModel() {
        self.petListViewModel =  PetListViewModel()
        self.petListViewModel.bindPetsViewModelToController = {
            
            DispatchQueue.main.async {
                self.petsTableView.reloadData()
            }
        }
    }

}

extension PetsListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
}


extension PetsListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return petListViewModel.pets.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: PetTableViewCell.identifier, for: indexPath) as? PetTableViewCell else { fatalError("xib does not exists") }
        cell.petData = petListViewModel.pets[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let config: Config =  dataLoad("config.json")
        
        if (checkWorkingTime(input: config.settings.workHours!)) {
            self.navigationController?.pushViewController(PetDetailViewController.create(pet: self.petListViewModel.pets[indexPath.row]), animated: true)
        } else {
            showAlert(title: "Sorry!", message: "Content is only available during the working time")
        }
        
    }
}
