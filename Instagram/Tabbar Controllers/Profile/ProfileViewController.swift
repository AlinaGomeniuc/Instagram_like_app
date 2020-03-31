import UIKit

class ProfileViewController: UIViewController {

    
    // MARK: Outlets
    @IBOutlet weak var collectionView: UICollectionView!

    
    // MARK: Properties
    let cellIdentifier = "ProfileCell"
    var collectionViewFlowLayout: UICollectionViewFlowLayout!
    var images = [#imageLiteral(resourceName: "img_2"), #imageLiteral(resourceName: "img_1"), #imageLiteral(resourceName: "image_1"), #imageLiteral(resourceName: "image_4")]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initArray()
        setupCollectionView()
        // Do any additional setup after loading the view.
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        setupCollectionViewItem()
    }
    
    private func setupCollectionView() {
      collectionView.delegate = self
      collectionView.dataSource = self
      let nib = UINib(nibName: "ProfileCell", bundle: nil)
      collectionView.register(nib, forCellWithReuseIdentifier: cellIdentifier)
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
    
    func initArray(){
        for _ in 1...6{
            images.append(contentsOf: images)
        }
    }
}

    //MARK: Flow layout delegate
extension ProfileViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("didSelectItem at: \(indexPath)")
    }
}
   

    //MARK: Data source
    
extension ProfileViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return images.count
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ProfileCell", for: indexPath) as! ProfileCell
        let image = images[indexPath.item]
        cell.imageView.image = image
        return cell
    }
    
}
    

