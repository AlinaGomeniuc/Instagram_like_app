import UIKit
import RxSwift
import MBProgressHUD

class ProfileViewController: UIViewController {
    // MARK: Outlets
    @IBOutlet weak var collectionView: UICollectionView!

    @IBOutlet weak var navigationBar: UINavigationBar!
    
    @IBOutlet weak var bio: UILabel!
    @IBOutlet weak var followers: UILabel!
    @IBOutlet weak var following: UILabel!
    @IBOutlet weak var posts: UILabel!
    
    // MARK: Properties
    let cellIdentifier = "PostCell"
    var collectionViewFlowLayout: UICollectionViewFlowLayout!
    var dataSource: Array<PostCellModel> = Array()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let bundle = Bundle.init(for: PostCell.self)
        let nib = UINib(nibName: "PostCell", bundle: bundle)
        collectionView.register(nib, forCellWithReuseIdentifier: cellIdentifier)
        
        fetchPostData()
    }
    
    @IBAction func refreshProfile(_ sender: Any) {
        fetchProfileData()
    }
    
    override func viewWillAppear(_ animated: Bool) {
         fetchProfileData()
    }
    
    private func fetchPostData(){
            showLoadingHUD()
            let req = RequestService()
            let url = URL(string: "https://eucc.me/alina/post")
            let urlR = URLRequest(url: url!);
            let subscription: Observable<[PostModel]> = req.get(urlR).observeOn(MainScheduler.instance);
            let _ = subscription.subscribe {event in
                var post : [PostModel];
                switch event {
                case .next(let value):
                    post = value
                    for element in post {
                        guard let imageURL = URL(string: element.url) else { continue }
                        guard let imageData = try? Data(contentsOf: imageURL) else { continue }
                        guard let image = UIImage(data: imageData) else { continue }
                        let cell = PostCellModel(id: element.id,
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
    
    private func fetchProfileData(){
               let req = RequestService()
               let url = URL(string: "https://eucc.me/alina/profile")
               let urlR = URLRequest(url: url!);
               let subscription: Observable<[ProfileModel]> = req.get(urlR).observeOn(MainScheduler.instance);
               let _ = subscription.subscribe {event in
                var post : [ProfileModel];
                   switch event {
                   case .next(let value):
                    post = value
                    for element in post {
                        self.navigationBar.topItem?.title = element.username
                        self.bio.text = element.bio
                        self.following.text = element.following
                        self.followers.text = element.followers
                        self.posts.text = element.posts
                    }
                   case .error(let error):
                        print(error)
       
                   case .completed:
                    print("completed")
       
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
    
extension ProfileViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dataSource.count
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PostCell", for: indexPath)
        
        guard let postCell = cell as? PostCell else { return UICollectionViewCell() }
        postCell.imageView.image = dataSource[indexPath.row].image
        return postCell
    }
    
}
    


