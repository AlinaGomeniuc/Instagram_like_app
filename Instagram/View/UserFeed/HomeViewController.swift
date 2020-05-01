import UIKit
import RxSwift
import MBProgressHUD

class HomeViewController: UIViewController, UserFeedViewDelegate {
    @IBOutlet weak var collectionView: UICollectionView!
    
    private let userFeedPresenter = UserFeedPresenter(userFeedService: UserFeedService())
    
    // MARK: Properties
    let cellIdentifier = "UserFeedCell"
    var collectionViewFlowLayout: UICollectionViewFlowLayout!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        userFeedPresenter.setViewDelegate(userFeedViewDelegate: self)
        
        let bundle = Bundle.init(for: UserFeedCell.self)
        let nib = UINib(nibName: "UserFeedCell", bundle: bundle)
        collectionView.register(nib, forCellWithReuseIdentifier: cellIdentifier)
        
        userFeedPresenter.fetchUserFeedData()
    }
    
    func showLoadingHUD() {
        let hud = MBProgressHUD.showAdded(to: self.view, animated: true)
        hud.label.text = "Loading..."
    }

    func hideLoadingHUD() {
        MBProgressHUD.hide(for: self.view, animated: true)
    }
    
    func refrashUserFeedView() {
        collectionView.reloadData()
    }

    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        setupCollectionViewItem()
    }
    
    private func setupCollectionViewItem(){
        if collectionViewFlowLayout == nil{

            let width = collectionView.frame.width - 20
            let height = width

            collectionViewFlowLayout = UICollectionViewFlowLayout()

            collectionViewFlowLayout.itemSize = CGSize(width: width, height: height)
            collectionViewFlowLayout.sectionInset = UIEdgeInsets.zero
            collectionViewFlowLayout.scrollDirection = .vertical

            collectionView.setCollectionViewLayout(collectionViewFlowLayout, animated: true)
        }
    }
}

    //MARK: Data source
extension HomeViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return userFeedPresenter.nrOfPosts
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "UserFeedCell", for: indexPath)
        
        guard let userFeedCell = cell as? UserFeedCell else { return UICollectionViewCell() }
        userFeedPresenter.configureCell(cell: userFeedCell, forRow: indexPath.row)
        return userFeedCell
    }
}
    
    
