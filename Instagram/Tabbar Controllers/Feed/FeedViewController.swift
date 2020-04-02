import UIKit
import RxSwift
import MBProgressHUD

class FeedViewController: UIViewController {
    
    // MARK: Outlets
    @IBOutlet weak var collectionView: UICollectionView!
    
    
    // MARK: Properties
    let cellIdentifier = "FeedCell"
    var collectionViewFlowLayout: UICollectionViewFlowLayout!
    var dataSource: Array<FeedCellModel> = Array()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let bundle = Bundle.init(for: FeedCell.self)
        let nib = UINib(nibName: "FeedCell", bundle: bundle)
        collectionView.register(nib, forCellWithReuseIdentifier: cellIdentifier)
        
        fetchData()
    }
    
    private func fetchData(){
            showLoadingHUD()
            let req = RequestService()
            let url = URL(string: "https://eucc.me/alina/general_feed")
            let urlR = URLRequest(url: url!);
            let subscription: Observable<[GeneralFeedModel]> = req.get(urlR).observeOn(MainScheduler.instance);
            let _ = subscription.subscribe {event in
                var post : [GeneralFeedModel];
                switch event {
                case .next(let value):
                    post = value
                    for element in post {
                        guard let imageURL = URL(string: element.url) else { continue }
                        guard let imageData = try? Data(contentsOf: imageURL) else { continue }
                        guard let image = UIImage(data: imageData) else { continue }
                        let cell = FeedCellModel(id: element.id,
                                                 image: image)
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
extension FeedViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dataSource.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "FeedCell", for: indexPath)
        
        guard let feedCell = cell as? FeedCell else { return UICollectionViewCell() }
        feedCell.imageView.image = dataSource[indexPath.row].image
        return feedCell
    }
}
    
