//
//  DetailViewController.swift
//  ListProductMeliApp
//
//  Created by Nazareth villalba on 22/05/22.
//

import UIKit

class DetailViewController: UIViewController {
    
    @IBOutlet weak var conditionAndQuantityLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var availableQuantityLabel: UILabel!
    @IBOutlet weak var shippingLabel: UILabel!
    @IBOutlet weak var addressLabel: UILabel!
    
    private var item: WidgetResult = WidgetResult()
    
    init(result: WidgetResult) {
        super.init(nibName: nil, bundle: nil)
        self.item = result
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
        return nil
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupComponent()
        setup(item: item)
    }
}

private extension DetailViewController {
    func setup(item: WidgetResult) {
        conditionAndQuantityLabel.text = "\(item.condition.uppercased()) | Cantidad vendida \(item.soldQuantity)"
        titleLabel.text = item.title
        priceLabel.text = String("$ \(item.price)")
        availableQuantityLabel.text = String("Stock Disponible > \(item.availableQuantity)")
           
        shippingLabel.text = item.shipping.freeShipping ? "Envio Gratis" : "Condicion > \(item.condition)"
        
        addressLabel.text = "Ubicacion del Vendedor: \(item.sellerAddress.city.name)"
        
        imageView.contentMode = .scaleAspectFit
        donwloadImage(imageView: self.imageView, urlString: item.thumbnail)
    }
    
    func setupComponent() {
        conditionAndQuantityLabel.font = setFont(of: .semibold, family: .Sans, and: 12)
        conditionAndQuantityLabel.textColor = .gray
        
        titleLabel.font = setFont(of: .bold, family: .Mono, and: 20)
        titleLabel.textColor = .black
        
        priceLabel.font = setFont(of: .bold, family: .Sans, and: 20)
        priceLabel.textColor = .black
        
        availableQuantityLabel.font = setFont(of: .semibold, family: .Sans, and: 18)
        availableQuantityLabel.textColor = .gray
        
        shippingLabel.font = setFont(of: .semibold, family: .Sans, and: 12)
        shippingLabel.textColor = item.shipping.freeShipping ? .red : .black
        
        addressLabel.font = setFont(of: .semibold, family: .Sans, and: 12)
        addressLabel.textColor = .blue
        
        
        conditionAndQuantityLabel.text = ""
        titleLabel.text = ""
        priceLabel.text = ""
        availableQuantityLabel.text = ""
        shippingLabel.text = ""
        addressLabel.text = ""
        
        setNav(icon: Images.icon(type: .backWhite), to: .leftButton, target: self, action: #selector(backButtonPressed), color: .black)
    }
    
    @objc func backButtonPressed(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }
}
