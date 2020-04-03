import UIKit
import RxSwift

class EditProfileViewController: UIViewController {

    @IBOutlet weak var bioTextView: UITextField!
    @IBOutlet weak var usenameTextView: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
//    private func
 
    @IBAction func done(_ sender: Any) {
        navigationController?.popViewController(animated: true)
        dismiss(animated: true, completion: nil)
        
        updateUserProfile()
    }
    
    private func updateUserProfile(){
        let request = RequestService()
        if(!bioTextView.text!.isEmpty){
            if(!usenameTextView.text!.isEmpty){
                let data = UpdateAllModel(username: usenameTextView.text!,
                                          bio: bioTextView.text! )
                let subscription: Observable<[Int]> = request.put("https://eucc.me/alina/profile/1", parameters: data).observeOn(MainScheduler.instance);
                let _ = subscription.subscribe {event in
                    debugPrint(event)
                }

            } else{
                let data = UpdateBioModel(bio: bioTextView.text!)
                let subscription: Observable<Int> = request.put("https://eucc.me/alina/profile/1", parameters: data).observeOn(MainScheduler.instance);
                let _ = subscription.subscribe {event in
                    debugPrint(event)
                }
            }
        }
        if (!usenameTextView.text!.isEmpty && bioTextView.text!.isEmpty){
            let data = UpdateUsernameModel(username: usenameTextView.text!)
            let subscription: Observable<Int> = request.put("https://eucc.me/alina/profile/1", parameters: data).observeOn(MainScheduler.instance);
            let _ = subscription.subscribe {event in
                debugPrint(event)
            }
        }
    }
    
}
