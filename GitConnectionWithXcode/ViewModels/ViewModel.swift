//
//  ViewModel.swift
//  GitConnectionWithXcode
//
//  Created by Auropriya Sinha on 19/09/22.
//

import Foundation

//ViewModel
class UserListViewModel {
    var users : Observable<[UserTableViewCellModel]> = Observable([])
    var apiService = APIService()
    
    init() {
        apiService.fetch { [weak self] userList in
            self?.users.value = userList
        }
    }
}

struct UserTableViewCellModel {
    let name : String
}
