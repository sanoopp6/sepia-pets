//
//  PetListViewModel.swift
//  Sepia Pets
//
//  Created by Sanoop PM on 29/11/22.
//

import Foundation


class PetListViewModel : NSObject {
    
    private var localRespository : LocalDataRepositoy!
    private(set) var pets : [Pet]! {
        didSet {
            self.bindPetsViewModelToController()
        }
    }
    
    var bindPetsViewModelToController : (() -> ()) = {}
    
    override init() {
        super.init()
        self.localRespository = LocalDataRepositoy()
        localRespository.fetchPetsData { data in
            self.pets = data
        }
        
    }
}
