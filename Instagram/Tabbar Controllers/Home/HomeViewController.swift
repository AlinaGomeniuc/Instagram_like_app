import UIKit
import RxSwift
import MBProgressHUD

class HomeViewController: UIViewController {
    @IBOutlet weak var collectionView: UICollectionView!
    
    // MARK: Properties
       let cellIdentifier = "UserFeedCell"
       var collectionViewFlowLayout: UICollectionViewFlowLayout!
       var dataSource: Array<UserFeedCellModel> = Array()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let bundle = Bundle.init(for: UserFeedCell.self)
        let nib = UINib(nibName: "UserFeedCell", bundle: bundle)
        collectionView.register(nib, forCellWithReuseIdentifier: cellIdentifier)
        
        fetchData()
    }
    
    private func fetchData(){
            showLoadingHUD()
            let req = RequestService()
            let url = URL(string: "https://eucc.me/alina/feed")
            let urlR = URLRequest(url: url!);
            let subscription: Observable<[FeedModel]> = req.get(urlR).observeOn(MainScheduler.instance);
            let _ = subscription.subscribe {event in
                var post : [FeedModel];
                switch event {
                case .next(let value):
                    post = value
                    for element in post {
                        guard let imageURL = URL(string: element.url) else { continue }
                        guard let imageData = try? Data(contentsOf: imageURL) else { continue }
                        guard let image = UIImage(data: imageData) else { continue }
                        let cell = UserFeedCellModel(id: element.id,
                                                     image: image,
                                                     postId: element.postId,
                                                     username: element.username,
                                                     likes: element.likes,
                                                     comments: element.comments)
                        self.dataSource.append(cell)
            }
                case .error(let error):
                     print(error)

                case .completed:
                    self.hideLoadingHUD()
                    self.collectionView.reloadData()

                }
            }
        }
    
    
    private func showLoadingHUD() {
        let hud = MBProgressHUD.showAdded(to: self.view, animated: true)
        hud.label.text = "Loading..."
    }

    private func hideLoadingHUD() {
        MBProgressHUD.hide(for: self.view, animated: true)
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
extension HomeViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
func numberOfSections(in collectionView: UICollectionView) -> Int {
    return 1
}

func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return dataSource.count
}

func collectionView(_ collectionView: UICollectionView,
                    layout collectionViewLayout: UICollectionViewLayout,
                    insetForSectionAt section: Int) -> UIEdgeInsets {
    let inset = 10
    return UIEdgeInsets(top: CGFloat(inset), left: CGFloat(inset), bottom: CGFloat(inset), right: CGFloat(inset))
}

func collectionView(_ collectionView: UICollectionView,
                    layout collectionViewLayout: UICollectionViewLayout,
                    sizeForItemAt indexPath: IndexPath) -> CGSize {
    return CGSize.init(width: UIScreen.main.bounds.width - 20, height: 384)
}

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "UserFeedCell", for: indexPath)
        
        guard let userFeedCell = cell as? UserFeedCell else { return UICollectionViewCell() }
        userFeedCell.image.image = dataSource[indexPath.row].image
        userFeedCell.comments.text = dataSource[indexPath.row].comments
        userFeedCell.likes.text = dataSource[indexPath.row].likes
        userFeedCell.username.text = dataSource[indexPath.row].username
        return userFeedCell
    }
}
    
    
