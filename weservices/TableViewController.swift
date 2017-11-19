//
//  TableViewController.swift
//  weservices
//
//  Created by Admin on 11/9/17.
//  Copyright © 2017 Admin. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        getData() { (data) in
            
            
        }
      
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
     
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 1
    }

  
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "one", for: indexPath)

       

        return cell
    }


    func getData(completion : @escaping ( _ data :[[String : Any]] )-> Void){
      
        let url = URL(string : "http://services.groupkt.com/country/search?text=un" )
        let urlrequest = URLRequest(url : url! )
        let conf = URLSessionConfiguration.default
        let session = URLSession(configuration: conf)
        session.dataTask(with: urlrequest) { (data, response, error) in
            if let error = error{
              return
        }
            else if let data = data, let response = response as? HTTPURLResponse, response.statusCode == 200  {
              
                var json = try? JSONSerialization.jsonObject(with: data, options: []) as! [String : Any]
                
                let item = json!["RestResponse"] as! [String : Any]
                
                let element = item["result"] as! [[String : String]]
                
                completion(element)
         
            }
        
    }.resume()
    
    
    
    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

}
