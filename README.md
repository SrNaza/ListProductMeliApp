# List Product Meli App
Meli app Tech Test / NAzareth Villalba

arquitectura usada clean arquitecrue

Patron arquitectonico utilizado : VIPER

El ejercicio consta principalmente de 3 pantallas :
 1 - Vista principal con campo de busqueda HomeViewController.swift
 2 - Listado de los items con un collectionView ListViewController.swift
 3 - Detalle de un producto seleccionado DetailViewController.swift
 
Cada una presentada con el flujo necesario que amerita el manejo del patron Viper mas una capa de Servicio en con junto con 
el interactor y NetworkingServices.swift para la consulta a la api publica de mercado libre.

Tecnologias: 

programacion reactiva con rxSwift

consultas HTTP - alamofire

pruebas unitarias

* Alamofire / AlamofireObjectMapper
* RxSwift / RxCocoa
* SDWebImage
