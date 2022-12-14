//
//  DetailCellPresenter.swift
//  testSfera
//
//  Created by Artour Ilyasov on 12.12.2022
//

import UIKit

protocol DetailCellPresenterProtocol: AnyObject {
    func viewDidLoad()
}

class DetailCellPresenter {
    weak var view: DetailCellViewProtocol?
    var router: DetailCellRouterProtocol
    var interactor: DetailCellInteractorProtocol

    init(interactor: DetailCellInteractorProtocol, router: DetailCellRouterProtocol) {
        self.interactor = interactor
        self.router = router
    }
    
    func prepareEntity(meal: ParcedMeal) -> String {
        let mealDiscription = "Meal: \(meal.strMeal)\n\n"
        let categoryDiscription = "Category: \(meal.category), \(meal.strArea)\n\n"
        let instructionDiscription = "\n\nInstructions:\n\(meal.instructions)"
        var ingredientsDiscription = Resources.empty
        
        for (index1, index2) in zip(meal.ingredients.indices, meal.measure.indices) {
            ingredientsDiscription += "\(meal.ingredients[index1] ?? Resources.del): \(meal.measure[index2] ?? Resources.del),\n"
        }
        
        ingredientsDiscription.formatting()

        return mealDiscription + categoryDiscription + ingredientsDiscription + instructionDiscription
    }
    
    func prepareEntity(drink: ParcedDrink) -> String {
        let drinkDiscription = "Drink: \(drink.strDrink)\n\n"
        let categoryDiscription = "Category: \(drink.category), \(drink.strAlcoholic)\n\n"
        let instructionDiscription = "\n\nInstructions:\n\(drink.instructions)"
        var ingredientsDiscription = Resources.empty
        
        for (index1, index2) in zip(drink.ingredients.indices, drink.measure.indices) {
            ingredientsDiscription += "\(drink.ingredients[index1] ?? Resources.del): \(drink.measure[index2] ?? Resources.del),\n"
        }

        ingredientsDiscription.formatting()

        return drinkDiscription + categoryDiscription + ingredientsDiscription + instructionDiscription
    }
}

extension DetailCellPresenter: DetailCellPresenterProtocol {
    func viewDidLoad() {
        let entity = interactor.getDetailEntity()
        if let entity = entity as? ParcedMeal {
            let description = prepareEntity(meal: entity)
            let imageView = UIImageView().getImageFromURL(url: entity.image)
            view?.viewInput(description: description, image: imageView)
        } else if let entity = entity as? ParcedDrink {
            let description = prepareEntity(drink: entity)
            let imageView = UIImageView().getImageFromURL(url: entity.image)
            view?.viewInput(description: description, image: imageView)
        }
    }
}
