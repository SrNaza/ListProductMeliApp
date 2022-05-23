//
//  ListDeatilCell.swift
//  ListProductMeliApp
//
//  Created by Nazareth villalba on 22/05/22.
//

import UIKit
import SDWebImage

class ListDeatilCell: UICollectionViewCell {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var shippingLabel: UILabel!
        
    override func awakeFromNib() {
        super.awakeFromNib()
        setupComponent()
    }

    func setupComponent() {
        titleLabel.font = setFont(of: .semibold, family: .Sans, and: 12)
        titleLabel.textColor = .black
        
        priceLabel.font = setFont(of: .bold, family: .Sans, and: 15)
        priceLabel.textColor = .black
        
        shippingLabel.font = setFont(of: .semibold, family: .Sans, and: 12)
        shippingLabel.textColor = .blue
        
        titleLabel.text = ""
        priceLabel.text = ""
        shippingLabel.text = ""
    }
    
    func setupCell(item: WidgetResult) {
        titleLabel.text = item.title
        priceLabel.text = String("$ \(item.price)")
           
        shippingLabel.text = item.shipping.freeShipping ? "Envio Gratis" : item.condition
        shippingLabel.textColor = item.shipping.freeShipping ? .red : .black
        
        imageView.contentMode = .scaleAspectFit
        donwloadImage(imageView: self.imageView, urlString: item.thumbnail)
    }
}

func donwloadImage(imageView: UIImageView, urlString: String) {
    guard let url = URL(string: urlString) else {
        imageView.image = Images.image(type: .meliDev)
        return
    }
    
    imageView.sd_setImage(with: url, placeholderImage: Images.image(type: .meliDev), completed: { (image, error, cacheType, imageUrl) in
        if error == nil {
            imageView.image = image
        } else {
            imageView.image = Images.image(type: .meliDev)
        }
    })
}
