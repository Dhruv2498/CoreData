import UIKit
import CoreData
class ViewController: UIViewController {
    @IBOutlet weak var txtName: UITextField!
    @IBOutlet weak var txtEmail: UITextField!
    @IBOutlet weak var txtPhone: UITextField!
    @IBOutlet weak var txtAge: UITextField!
    @IBAction func btnSAVE(_ sender: Any) {
        if validate{
            Save()
        }
    }
    @IBAction func btnVIEW(_ sender: Any) {
        let D = storyboard?.instantiateViewController(identifier: "UList") as! UserDetailViewController
        self.navigationController?.pushViewController(D, animated: true)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
       
    }
    func Save(){
        let contextref = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        let usercontext = User(context : contextref)
        usercontext.uname = txtName.text!
        usercontext.uemail = txtEmail.text!
        usercontext.uphone = txtPhone.text!
        usercontext.uage = txtAge.text!
        (UIApplication.shared.delegate as! AppDelegate).saveContext()
       
        txtName.text = ""
        txtEmail.text = ""
        txtPhone.text = ""
        txtAge.text = ""
        let alert = UIAlertController(title: "Message", message: "Data saved", preferredStyle: .alert)
        let okaction = UIAlertAction(title: "ok", style: .default)
        alert.addAction(okaction)
        self.present(alert, animated: true)
    }

    var validate : Bool{
        if txtName.text!.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty{
            let alert = UIAlertController(title: "Alert", message: "Plz Enter Name..", preferredStyle: .actionSheet)
            let ok = UIAlertAction(title: "Ok", style: .default,handler: nil)
            alert.addAction(ok)
            self.present(alert,animated: true,completion: nil)
            return false
        }
        if txtEmail.text!.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty{
            let alert = UIAlertController(title: "Alert", message: "Plz Enter Email..", preferredStyle: .actionSheet)
            let ok = UIAlertAction(title: "Ok", style: .default,handler: nil)
            alert.addAction(ok)
            self.present(alert,animated: true,completion: nil)
            return false
        }
        if txtPhone.text!.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty{
            let alert = UIAlertController(title: "Alert", message: "Plz Enter phone..", preferredStyle: .actionSheet)
            let ok = UIAlertAction(title: "Ok", style: .default,handler: nil)
            alert.addAction(ok)
            self.present(alert,animated: true,completion: nil)
            return false
        }
        if ( Int(txtAge.text!)! >= 18 && Int(txtAge.text!)! <= 25){
            if txtAge.text!.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty{
                let alert = UIAlertController(title: "Alert", message: "Plz Enter age..", preferredStyle: .actionSheet)
                let ok = UIAlertAction(title: "Ok", style: .default,handler: nil)
                alert.addAction(ok)
                self.present(alert,animated: true,completion: nil)
                return false
            }
            return true
        }
        else
        {
            let alert = UIAlertController(title: "Alert", message: "Plz Enter age Between 18 to 25 ..", preferredStyle: .actionSheet)
            let ok = UIAlertAction(title: "Ok", style: .default,handler: nil)
            alert.addAction(ok)
            self.present(alert,animated: true,completion: nil)
        }
        return true
    }
   
}

