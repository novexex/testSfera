//
//  Resources.swift
//  testSfera
//
//  Created by Artour Ilyasov on 30.11.2022.
//

import UIKit

enum Resources {
    enum Colors {
        static let active = UIColor(hexString: "#437BFE")
        static let inActive = UIColor(hexString: "#929DA5")
        static let separator = UIColor(hexString: "#E8ECEF")
        static let titleGray = UIColor(hexString: "#545C77")
        static let background = UIColor(hexString: "#F8F9F9")
    }
    
    enum Titles {
        enum TabBar {
            static let meal = "Random Meal"
            static let drink = "Random Drink"
            static let favorites = "Saved Recipes"
        }
        enum NavBar {
            enum Actions {
                static let left = "Next"
                static let right = "Save"
            }
            static let favorites = "Favorites Recipes"
            static let meal = "Meal Recipe"
            static let drink = "Drink Recipe"
        }
        
    }
    
    enum Images {
        static let meal = UIImage(systemName: "fork.knife")
        static let drink = UIImage(systemName: "wineglass")
        static let favorites = UIImage(systemName: "bookmark")
    }
    
    enum Fonts {
        static func helveticaRegular(with size: CGFloat) -> UIFont {
            UIFont(name: "Helvetica", size: size) ?? UIFont()
        }
    }
}

enum DictValues {
    enum Drink {
        static let name = "strDrink"
        static let alco = "strAlcoholic"
        static let image = "strDrinkThumb"
    }
    
    enum Meal {
        static let name = "strMeal"
        static let area = "strArea"
        static let image = "strMealThumb"
    }
    
    static let instruct = "strInstructions"
    static let category = "strCategory"
    
    static let ingr1 = "strIngredient1"
    static let ingr2 = "strIngredient2"
    static let ingr3 = "strIngredient3"
    static let ingr4 = "strIngredient4"
    static let ingr5 = "strIngredient5"
    static let ingr6 = "strIngredient6"
    static let ingr7 = "strIngredient7"
    static let ingr8 = "strIngredient8"
    static let ingr9 = "strIngredient9"
    static let ingr10 = "strIngredient10"
    static let ingr11 = "strIngredient11"
    static let ingr12 = "strIngredient12"
    static let ingr13 = "strIngredient13"
    static let ingr14 = "strIngredient14"
    static let ingr15 = "strIngredient15"
    static let ingr16 = "strIngredient16"
    static let ingr17 = "strIngredient17"
    static let ingr18 = "strIngredient18"
    static let ingr19 = "strIngredient19"
    static let ingr20 = "strIngredient20"
    
    static let meas1 = "strMeasure1"
    static let meas2 = "strMeasure2"
    static let meas3 = "strMeasure3"
    static let meas4 = "strMeasure4"
    static let meas5 = "strMeasure5"
    static let meas6 = "strMeasure6"
    static let meas7 = "strMeasure7"
    static let meas8 = "strMeasure8"
    static let meas9 = "strMeasure9"
    static let meas10 = "strMeasure10"
    static let meas11 = "strMeasure11"
    static let meas12 = "strMeasure12"
    static let meas13 = "strMeasure13"
    static let meas14 = "strMeasure14"
    static let meas15 = "strMeasure15"
    static let meas16 = "strMeasure16"
    static let meas17 = "strMeasure17"
    static let meas18 = "strMeasure18"
    static let meas19 = "strMeasure19"
    static let meas20 = "strMeasure20"
}
