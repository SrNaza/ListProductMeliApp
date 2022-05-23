//
//  ListViewController.swift
//  ListProductMeliApp
//
//  Created by Nazareth villalba on 22/05/22.
//

import UIKit

class ListViewController: UIViewController {
    
    @IBOutlet private var collection: UICollectionView!
    
    private var result: [WidgetResult] = []
    private var presenter: HomeFlowPresenterProtocol
    
    init(result: [WidgetResult], presenter: HomeFlowPresenterProtocol) {
        self.result = result
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
        return nil
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
//        let interactor = HomeFlowInteractor()
//        let router = HomeFlowRouter(baseController: self)
//        presenter = HomeFlowPresenter(interactor: interactor, router: router)
        
        
    }
}

private extension ListViewController {
    func setup() {
        setNav(icon: Images.icon(type: .backWhite), to: .leftButton, target: self, action: #selector(backButtonPressed), color: .black)
        collection.register(UINib(nibName: "ListDeatilCell", bundle: nil) , forCellWithReuseIdentifier: "ListDeatilCell")
        collection.reloadData()
        collection.delegate = self
        collection.dataSource = self
    }
    
    @objc func backButtonPressed(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }
}

extension ListViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return result.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ListDeatilCell", for: indexPath) as! ListDeatilCell
        cell.setupCell(item: result[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        presenter.handleAction(.showDetail(item: result[indexPath.row]))
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let noOfCellsInRow = 2   //number of column you want
        let flowLayout = collectionViewLayout as! UICollectionViewFlowLayout
        let totalSpace = flowLayout.sectionInset.left
        + flowLayout.sectionInset.right
        + (flowLayout.minimumInteritemSpacing * CGFloat(noOfCellsInRow - 1))
        
        let size = Int((collectionView.bounds.width - totalSpace) / CGFloat(noOfCellsInRow))
        
        return CGSize(width: size, height: 330)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 5
    }
}
