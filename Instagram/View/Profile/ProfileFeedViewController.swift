import UIKit
import RxSwift
import MBProgressHUD

class ProfileViewController: UIViewController, ProfileFeedViewDelegate {

    // MARK: Outlets
    @IBOutlet weak var collectionView: UICollectionView!
    
    private let profileFeedPresenter = ProfileFeedPresenter(profileService: ProfileService())

    @IBOutlet weak var navigationBar: UINavigationBar!
    
    @IBOutlet weak var bio: UILabel!
    @IBOutlet weak var followers: UILabel!
    @IBOutlet weak var following: UILabel!
    @IBOutlet weak var posts: UILabel!
    
    // MARK: Properties
    let cellIdentifier = "PostCell"
    var collectionViewFlowLayout: UICollectionViewFlowLayout!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        profileFeedPresenter.setViewDelegate(profileFeedViewDelegate: self)
        
        let bundle = Bundle.init(for: PostCell.self)
        let nib = UINib(nibName: "PostCell", bundle: bundle)
        collectionView.register(nib, forCellWithReuseIdentifier: cellIdentifier)
        
        profileFeedPresenter.fetchProfileFeedData()
        profileFeedPresenter.fetchProfileData()
    }
    
    @IBAction func refreshProfile(_ sender: Any) {
        profileFeedPresenter.profileFeedData.removeAll()
        profileFeedPresenter.fetchProfileFeedData()
        profileFeedPresenter.fetchProfileData()
    }
 
    
    func showLoadingHUD() {
        let hud = MBProgressHUD.showAdded(to: self.view, animated: true)
        hud.label.text = "Loading..."
    }

    func hideLoadingHUD() {
        MBProgressHUD.hide(for: self.view, animated: true)
    }
    
    func setUsername(username: String){
        self.navigationBar.topItem?.title = username
    }
    
    func setPostNr(postNr: String){
        self.posts.text = postNr
    }
    
    func setFolowersNr(folowersNr: String){
        self.followers.text = folowersNr
    }
    
    func setFolowingNr(folowingNr: String){
        self.following.text = folowingNr
    }
    
    func setBio(bioInfo: String){
        self.bio.text = bioInfo
    }
    
    func refrashProfileFeedView(){
        collectionView.reloadData()
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        setupCollectionViewItem()
    }
    
    private func setupCollectionViewItem(){
        if collectionViewFlowLayout == nil{
            let numberOfItemForRow: CGFloat = 3
            let lineSpacing: CGFloat = 5
            let interItemSpacing: CGFloat = 5
            let width = (collectionView.frame.width - (numberOfItemForRow - 1) * interItemSpacing) / numberOfItemForRow
            let height = width

            collectionViewFlowLayout = UICollectionViewFlowLayout()
            collectionViewFlowLayout.itemSize = CGSize(width: width, height: height)
            collectionViewFlowLayout.sectionInset = UIEdgeInsets.zero
            collectionViewFlowLayout.scrollDirection = .vertical
            collectionViewFlowLayout.minimumLineSpacing = lineSpacing
            collectionViewFlowLayout.minimumInteritemSpacing = interItemSpacing

            collectionView.setCollectionViewLayout(collectionViewFlowLayout, animated: true)
        }
    }
}

    //MARK: Data source
extension ProfileViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return profileFeedPresenter.nrOfPosts
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PostCell", for: indexPath)
        
        guard let postCell = cell as? PostCell else { return UICollectionViewCell() }
        profileFeedPresenter.configureCell(cell: postCell, forRow: indexPath.row)
        return postCell
    }
    
}
    


