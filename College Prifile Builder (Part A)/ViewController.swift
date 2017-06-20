


import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    
    @IBOutlet weak var myTableView: UITableView!
    var collegeArray: [College] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collegeArray.append (College(Name: "Berkely", Location: "California" , Enrollment: "Enrolled", Image: #imageLiteral(resourceName: "berkely")))
        collegeArray.append (College(Name: "Stanford", Location: "Stanford" , Enrollment: "Denied", Image: #imageLiteral(resourceName: "Stanford")))
        collegeArray.append (College(Name: "Harvard", Location: "Cambridge" , Enrollment: "Denied", Image: #imageLiteral(resourceName: "Harvard")))
    }
    
    override func viewDidAppear(_ animated: Bool)
    {
       myTableView.reloadData()
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return collegeArray.count
    }
    
    
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = myTableView.dequeueReusableCell(withIdentifier: "myCell", for: indexPath)
        cell.textLabel!.text = collegeArray[indexPath.row].name
        cell.detailTextLabel!.text = collegeArray[indexPath.row].location
        
        return cell
    }
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            collegeArray.remove(at: indexPath.row)
            myTableView.reloadData()
        }
    }
    func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        let college = collegeArray[sourceIndexPath.row]
        collegeArray.remove(at: sourceIndexPath.row)
        collegeArray.insert(college, at: destinationIndexPath.row)
    }
    
    func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    @IBAction func addButtonTapped(_ sender: UIBarButtonItem)
        
    {
        let addAlert = UIAlertController(title: "addCollege", message: nil, preferredStyle: .alert)
        addAlert.addTextField { (nameTextField) in
            nameTextField.placeholder = "Enter Name of College Here"
        }
            addAlert.addTextField { (nameTextField) in
                nameTextField.placeholder = "Enter Enrollment Here"
        }
        
        addAlert.addTextField { (nameTextField) in
            nameTextField.placeholder = "Enter Location Here"
        }
        
        let addButtonAction = UIAlertAction  (title: "add", style: .default) { (addAction) -> Void in
            
                
                self.collegeArray.append(College(Name: (addAlert.textFields?[0].text!)!, Location: (addAlert.textFields?[1].text!)!, Enrollment: (addAlert.textFields?[0].text!)!))
            self.myTableView.reloadData()
        }
        addAlert.addAction(addButtonAction)
        addAlert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        present(addAlert, animated: true, completion: nil)
    
    }
    

    
    @IBAction func editButtonTapped(_ sender: UIBarButtonItem)
        
    {
        myTableView.isEditing = !myTableView.isEditing
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let detailController = segue.destination as! SecondViewController
        detailController.college = collegeArray[(myTableView.indexPathForSelectedRow?.row)!]
    }
    
    
    
    
    
    
    
    
}


