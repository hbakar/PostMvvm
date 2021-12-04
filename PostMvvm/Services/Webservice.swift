//
//  Webservice.swift
//  PostMvvm
//
//  Created by Hüseyin BAKAR on 4.12.2021.
//

import Foundation

struct Webservice
{
    func getPost(url: URL, completion: @escaping([Post]?) ->())
    {
        URLSession.shared.dataTask(with: url)
        {
            (data, response, error) in
            
            if let error = error
            {
                print(error.localizedDescription)
                completion(nil)
            }
            else if let data = data
            {
                let postList = try? JSONDecoder().decode([Post].self, from: data)
                completion(postList)
            }
            
        }.resume()
    }
}
