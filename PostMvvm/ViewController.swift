//
//  ViewController.swift
//  PostMvvm
//
//  Created by Hüseyin BAKAR on 4.12.2021.
//

import UIKit

 class ViewController: UIViewController {

    
    private var postViewModel : PostListViewModel!
    
    @IBOutlet var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        getData()
        
        
        print("Post MVVM & Rest Api Example v1 & Github")
    }
}

extension ViewController : UITableViewDelegate, UITableViewDataSource
{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.postViewModel == nil ? 0 : self.postViewModel.numberOfRowsInSection()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PostCell", for: indexPath) as! PostTableViewCell
        let post = self.postViewModel.postAtIndex(indexPath.row)
        cell.lblID.text = String(post.id)
        cell.lblTitle.text = post.title
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
    
    private func getData()
    {
        let url = URL(string: "http://jsonplaceholder.typicode.com/posts")!
        
        Webservice().getPost(url: url) { posts in
            if let postListe = posts
            {
                self.postViewModel = PostListViewModel(postListe: postListe)
                
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            }
        }
    }
    
}

