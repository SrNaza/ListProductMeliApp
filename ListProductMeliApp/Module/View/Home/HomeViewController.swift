//
//  HomeViewController.swift
//  ListProductMeliApp
//
//  Created by Nazareth villalba on 21/05/22.
//

import UIKit
import RxSwift
import RxCocoa

final class HomeViewController: UIViewController {

    // MARK: - Initialization
    @IBOutlet weak var searchBardField: UITextField! {
        didSet {
            searchBardField.rx.controlEvent([.editingDidEndOnExit])
                .asObservable()
                .subscribe(onNext: { [weak self] _ in
                    guard let self = self else { return }
                    self.sendInformation()
                })
        }
    }
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView! {
        didSet {
            imageView.image = Images.image(type: .dev)
        }
    }
    
    private var presenter: HomeFlowPresenterProtocol?
    private let disposeBag = DisposeBag()
    
    init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        searchBardField.delegate = self
        
        let interactor = HomeFlowInteractor()
        let router = HomeFlowRouter(baseController: self)
        presenter = HomeFlowPresenter(interactor: interactor, router: router)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setup()
    }
}

extension HomeViewController: UITextFieldDelegate {
    
    func textFieldShouldClear(_ textField: UITextField) -> Bool {
        searchBardField.resignFirstResponder()
        return true
    }
    
    func setup() {
        searchBardField.text = ""
        searchBardField.font = setFont(of: .bold, family: .Mono, and: 15)
        searchBardField.textColor = .black
        searchBardField.placeholder = "Busca el articulo que necesites"
        searchBardField.setPlaceHolderColor()
        
        titleLabel.text = "Meli App 🫡"
        titleLabel.font = setFont(of: .bold, family: .Mono, and: 15)
        titleLabel.textColor = .black
    }
    
    func sendInformation() {
        guard let presenter = presenter else { return }
        
        if searchBardField.text?.count == 0 {
            searchBardField.text = ""
            searchBardField.placeholder = "Busca el articulo que necesites"
            showOptionsAlert(title: "Busqueda vacia", redButtonTitle: "Cancel", message: "Necesitas indicar un articulo a buscar") { }
        }
        
        let detailInfo = presenter.getItemsDetail(itemToSearch: searchBardField.text ?? "").asObservable()
        
        detailInfo.asObservable()
            .subscribe(onNext: { [weak self] info in
            guard let self = self, !info.results.isEmpty else {
                self?.showOptionsAlert(title: "Lo sentimos", redButtonTitle: "Cancel", message: "El articulo que intentas buscar no esta disponible de momento\n Trabajaremos para traerlo pronto 😜") { }
                self?.setup()
                return
            }
                self.presenter?.handleAction(.showList(item: info.results))
        }).disposed(by: disposeBag)
    }
}
