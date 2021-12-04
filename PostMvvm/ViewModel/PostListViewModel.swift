//
//  PostListViewModel.swift
//  PostMvvm
//
//  Created by Hüseyin BAKAR on 4.12.2021.
//

import Foundation

struct PostViewModel
{
    let post : Post
    
    var id : Int { return post.id ?? 0}
    var title : String { return post.title ?? ""}
}

struct PostListViewModel
{
    let postListe : [Post]
}

extension PostListViewModel
{
    func numberOfRowsInSection() ->Int
    {
        return self.postListe.count
    }
    
    func postAtIndex(_ index: Int) -> PostViewModel
    {
        let post = self.postListe[index]
        return PostViewModel(post: post)
    }
}
