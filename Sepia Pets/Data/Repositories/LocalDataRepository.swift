//
//  LocalDataRepository.swift
//  Sepia Pets
//
//  Created by Sanoop PM on 30/11/22.
//

import Foundation
import SwiftUI


class LocalDataRepositoy  {
        
    func fetchPetsData(completion : @escaping ([Pet]) -> ()){
        
            let data: PetList =  dataLoad("pets_list.json")
            completion(data.pets)
        }

}

