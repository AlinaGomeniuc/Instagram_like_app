import UIKit
import RxSwift
import MBProgressHUD

class EditProfileViewController: UIViewController, EditProfileViewDelegate {

    @IBOutlet weak var bioTextView: UITextField!
    @IBOutlet weak var usenameTextView: UITextField!
    
    private let editProfilePresenter = EditProfilePresenter(profileService: ProfileService())
    
    override func viewDidLoad() {
        super.viewDidLoad()
        editProfilePresenter.setViewDelegate(editProfileViewDelegate: self)
    }
     
    @IBAction func done(_ sender: Any) {
        navigationController?.popViewController(animated: true)
        dismiss(animated: true, completion: nil)
        
        editProfilePresenter.editProfileData()
    }
    
    func showLoadingHUD() {
        let hud = MBProgressHUD.showAdded(to: self.view, animated: true)
        hud.label.text = "Loading..."
    }

    func hideLoadingHUD() {
        MBProgressHUD.hide(for: self.view, animated: true)
    }
    
    func getBio() -> String{
        return self.bioTextView.text ?? ""
    }
    
    func getUsername() -> String{
        return self.usenameTextView.text ?? ""
    }
}
