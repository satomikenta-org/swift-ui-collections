//
//  user.swift
//  health-app
//
//  Created by 里見健太 on 2021/04/01.
//

import Foundation

class UserService: ObservableObject {

    // connpass's event search API
    private let urlLink = "https://jsonplaceholder.typicode.com/users"
    // このプロパティに変更があった際にイベント発行
    @Published var users: [User] = []

    init() {
        fetchUsers()
    }

    func fetchUsers() {
        URLSession.shared.dataTask(with: URL(string: urlLink)!) { (data, response, error) in
            guard let data = data else { return }
            let decoder: JSONDecoder = JSONDecoder()
            do {
                let users = try! decoder.decode([User].self, from: data)
                DispatchQueue.main.async {
                    self.users = users
                }
            } catch {
                print("json convert failed in JSONDecoder. " + error.localizedDescription)
            }
        }.resume()
    }
}
