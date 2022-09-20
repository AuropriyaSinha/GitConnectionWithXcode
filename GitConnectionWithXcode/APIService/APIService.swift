//
//  APIService.swift
//  GitConnectionWithXcode
//
//  Created by Auropriya Sinha on 19/09/22.
//

import Foundation

class APIService{
    
    var urlString = "https://jsonplaceholder.typicode.com/users"
    
    func fetch(completion : @escaping ([UserTableViewCellModel]) -> ()) {
        
        guard let url = URL(string: urlString) else {return}
            URLSession.shared.dataTask(with: url, completionHandler: { data, response, error in
                if response != nil && error == nil {
                    guard let data = data else {return}
                    do {
                        let usersModels = try JSONDecoder().decode([User].self, from: data)
                        let users = usersModels.compactMap({ model in
                            UserTableViewCellModel(name: model.name)
                        })
                        completion(users)
                    } catch let err {
                        print(err.localizedDescription)
                        completion([])
                    }
                }
            }).resume()
    }
}
