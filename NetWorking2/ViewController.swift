//
//  ViewController.swift
//  NetWorking2
//
//  Created by Consultant on 3/1/22.
//

import UIKit

class ViewController: UIViewController {
    
  
@IBOutlet weak var tableView: UITableView!
    
    
    var brewerries = [Brewery]()
    
    
    override func viewDidLoad() {
        fetchData()
        setupDelegates()
        super.viewDidLoad()
    }
    
    func setupDelegates () {
        
        tableView.delegate = self
        tableView.dataSource = self
        
    }
    
    func fetchData(){
        
        let session = URLSession.shared
        guard let url = URL(string: "https://api.openbrewerydb.org/breweries") else {return}
        let task =  session.dataTask(with: url){
            
            data,response, error in
            guard error == nil else {
                print("error: \(error?.localizedDescription ?? "No idea what happened here!")")
                return
            }
            guard let responseData = data else {
                print("Error: did not receive data")
                return
            }
            guard let httpResponse = response as? HTTPURLResponse else {
                print("Error: not a valid HTTP URL Response")
                return
            }
            //response status
            print("Response Status Code: \(httpResponse.statusCode)")
            print("Response Status debugDescription \(httpResponse.debugDescription)")
            print("Response Status LocalizedString \(HTTPURLResponse.localizedString(forStatusCode: httpResponse.statusCode))")
            
            // parse the resul as jason
            do {
                guard let jsonData = try? JSONSerialization.jsonObject(with: responseData, options:[]) else {return}
                print(jsonData)
                guard let jsonArray = jsonData as? [Any] else {return}
                for brewski in jsonArray {
                    //represent the data as an array
                    guard let breweryDict = brewski as? [String:Any] else {return}
                    // assign properties
                    guard let name = breweryDict["name"] as? String else {return}
                    guard let type = breweryDict["brewery_type"] as? String else {return}
                    guard let city = breweryDict["city"] as? String else {return}
                    guard let state = breweryDict["state"] as? String else {return}
                    guard let street = breweryDict["street"] as? String else {return}
                    //guard let web = breweryDict["website_url"] as? String else {return}
                    print(name)
                    print(type)
                    print(city)
                    print(state)
                    
                    
                    
                    //, web: web
                    self.brewerries.append(Brewery(name: name, type: type, city: city, state: state, street: street))
                }
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            }
            
            
        }
        task.resume()
        
    }

}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return brewerries.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = brewerries[indexPath.row].name
        cell.detailTextLabel?.text = "\(brewerries[indexPath.row].city), \(brewerries[indexPath.row].state)"
        
        return cell
    }
    
     func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let vc = storyboard?.instantiateViewController(withIdentifier: "DetailViewController") as? DetailViewController
        vc?.tranStreet = brewerries[indexPath.row].street
         vc?.tranName = brewerries[indexPath.row].name
         //vc?.tranWebSite_url = brewerries[indexPath.row].web ?? ""
         
        //vc?.img = UIImage(named: curatedList[indexPath.row].nameImage)!
        self.navigationController?.pushViewController(vc!, animated: true)

    }
    
    
    
    
}


