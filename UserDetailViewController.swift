import CoreData
import UIKit

class UserDetailViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
   
    @IBOutlet weak var userListTableView: UITableView!
    var Userarr : [User] = []
    var arr_Name = [String]()
    var arr_Email = [String]()
    var arr_Phone = [String]()
    var arr_Age = [String]()
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Userarr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "userlistcell")as! UserListTableViewCell
      
        cell.lblname.text = Userarr[indexPath.row].uname!
        cell.lblemail.text = Userarr[indexPath.row].uemail!
        cell.lblphone.text = Userarr[indexPath.row].uphone!
        cell.lblage.text = Userarr[indexPath.row].uage!
        
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        if editingStyle == .delete
        {
            var  st = self.Userarr[indexPath.row]
            context.delete(st)
            do{
                Userarr = try context.fetch(User.fetchRequest())
                (UIApplication.shared.delegate as! AppDelegate).saveContext()
            }
            catch{
                
            }
            userListTableView.reloadData()
      
        }
        
    }
    override func viewWillAppear(_ animated: Bool) {
        getData()
        userListTableView.reloadData()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
       getData()
        self.userListTableView.delegate = self
        self.userListTableView.dataSource = self
        
    }
    func getData(){
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        do{
            Userarr = try context.fetch(User.fetchRequest())
        }
        catch{
            print("Error in fatch data ")
        }
       
    }
}
