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
    
    func prepareEntity(meal: ParcedMealClass) -> String {
        let mealDiscription = "Meal: \(meal.strMeal)\n\n"
        let categoryDiscription = "Category: \(meal.category), \(meal.strArea)\n\n"
        let instructionDiscription = "\n\nInstructions:\n\(meal.instructions)"
        var ingredientsDiscription = ""
        
        for (index, _) in meal.ingredients.enumerated() {
            ingredientsDiscription += "\(meal.ingredients[index] ?? "del"): \(meal.measure[index] ?? "del"),\n"
        }
        
        ingredientsDiscription.formatting()

        return mealDiscription + categoryDiscription + instructionDiscription + instructionDiscription + ingredientsDiscription
    }
    
    func prepareEntity(drink: ParcedDrinkClass) -> String {
        let drinkDiscription = "Drink: \(drink.strDrink)\n\n"
        let categoryDiscription = "Category: \(drink.category), \(drink.strAlcoholic)\n\n"
        let instructionDiscription = "\n\nInstructions:\n\(drink.instructions)"
        var ingredientsDiscription = ""
        
        for (index, _) in drink.ingredients.enumerated() {
            ingredientsDiscription += "\(drink.ingredients[index] ?? "del"): \(drink.measure[index] ?? "del"),\n"
        }

        ingredientsDiscription.formatting()

        return drinkDiscription + categoryDiscription + instructionDiscription + instructionDiscription + ingredientsDiscription
    }
}

extension DetailCellPresenter: DetailCellPresenterProtocol {
    func viewDidLoad() {
        let entity = interactor.getDetailEntity()
        if let entity = entity as? ParcedMealClass {
            let description = prepareEntity(meal: entity)
            view?.viewInput(description: description, image: entity.image)
        } else if let entity = entity as? ParcedDrinkClass {
            let description = prepareEntity(drink: entity)
            view?.viewInput(description: description, image: entity.image)
        }
    }
    
}
