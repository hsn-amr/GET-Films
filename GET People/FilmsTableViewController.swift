//
//  FilmsTableViewController.swift
//  GET People
//
//  Created by administrator on 20/12/2021.
//

import UIKit

class FilmsTableViewController: UITableViewController {

    let mainUrl = "https://swapi.dev/api/films/?format=json"
    var films =  [FilmResult]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        requestApi(url: mainUrl)
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    
    func requestApi(url: String){
        let url = URL(string: url)
        
        URLSession.shared.dataTask(with: url!, completionHandler: {
            data, respose, error in
            
            guard let myData = data else {return}
            
            do {
                //codable
                let decoder = JSONDecoder()
                let result = try decoder.decode(FilmsWelcome.self, from: myData)
                self.films = result.results
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            } catch {
                print(error)
            }
        }).resume()
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return films.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "filmCell", for: indexPath)

        // Configure the cell...
        cell.textLabel?.text = films[indexPath.row].title

        return cell
    }
    


}
