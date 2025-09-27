import SwiftUI

struct CookingModel {
    var recipes = [
        RecipeModel(
            name: "Perfect Eggs Benedict",
            image: "recipe1",
            ingredients: """
            Chicken eggs — 4 pcs.
            English muffins (or toasts/rolls) — 2 pcs.
            Ham, bacon or salmon — 2-4 slices
            Vinegar — 1 tablespoon
            Butter — 100 g
            Yolks — 2 pcs.
            Lemon juice — 1 tablespoon
            Salt and pepper — to taste
            """,
            preparation: """
            1. Hollandaise sauce
            Melt the butter and let it cool slightly.
            In a bowl, whisk 2 egg yolks with lemon juice and a pinch of salt.
            Place the bowl in a water bath (so that the bottom does not touch the water) and, constantly whisking with a whisk, pour in the melted butter in a thin stream.
            The sauce should be thick and creamy. Add pepper to taste.
            
            2. Poached eggs
            Boil water in a saucepan, turn down the heat to a low boil.
            Add a tablespoon of vinegar to the water.
            Break the egg into a small cup and carefully pour it into the water.
            Cook for 2.5–3 minutes so that the white sets and the yolk remains liquid.
            Remove the egg with a slotted spoon and dry it on a paper towel.
            
            3. Assembly
            Cut the muffins in half and toast.
            Place a slice of bacon or ham on each half.
            Carefully place the poached egg on top.
            Pour over the hollandaise sauce.
            Sprinkle with freshly ground pepper, you can add herbs or a little paprika. Serve immediately while warm.
            """,
            category: ["Seafood", "Classic"],
            timePrepare: "25 mins",
            difficulty: "Medium"
        ),
        RecipeModel(
            name: "French omelet",
            image: "recipe2",
            ingredients: """
            Eggs — 3 pcs.
            Milk — 2 tablespoons
            Butter — 20 g
            Salt and pepper — to taste
            """,
            preparation: """
            Whisk eggs with milk, add salt and pepper.
            Melt the butter in a frying pan.
            Pour out the mixture and cook over low heat, lifting the edges slightly.
            Roll the omelet in half and serve with the herbs.
            """,
            category: ["Classic"],
            timePrepare: "10 mins",
            difficulty: "Easy"
        ),
        RecipeModel(
            name: "Shakshuka",
            image: "recipe3",
            ingredients: """
            Eggs — 4 pcs.
            Tomatoes — 4 pcs. (or 1 jar in its own juice)
            Onion — 1 pc.
            Garlic — 2 cloves
            Paprika, cumin, salt, pepper
            Olive oil — 2 tablespoons
            """,
            preparation: """
            Fry the onion and garlic, add tomatoes and spices.
            Simmer the sauce for 10 minutes.
            Make holes in the sauce and carefully beat in the eggs.
            Cover and cook until desired consistency.
            """,
            category: ["Classic", "Vegetables"],
            timePrepare: "30 mins",
            difficulty: "Medium"
        ),
        RecipeModel(
            name: "Mimosa salad",
            image: "recipe4",
            ingredients: """
            Eggs — 4 pcs.
            Canned fish (tuna or sardine) — 1 can
            Onion — 1 pc.
            Hard cheese — 100 g
            Mayonnaise — 3 tablespoons
            """,
            preparation: """
            Boil the eggs, separate the whites from the yolks.
            Mash the fish with a fork, chop the onion finely.
            Lay out the layers: fish, proteins, onion, cheese, mayonnaise.
            Sprinkle the grated egg yolks on top.
            """,
            category: ["Salad"],
            timePrepare: "20 mins",
            difficulty: "Easy"
        ),
        RecipeModel(
            name: "Egg sandwich",
            image: "recipe5",
            ingredients: """
            Eggs — 2 pcs.
            Mayonnaise — 1 tablespoon
            Toast bread — 2 pieces
            Lettuce leaf, cucumber, salt, pepper
            """,
            preparation: """
            Boil the hard-boiled eggs, mash them with mayonnaise.
            Spread the mixture on the bread.
            Add the lettuce leaves and cucumber.
            Cover with a second slice of bread.
            """,
            category: ["Snack"],
            timePrepare: "15 mins",
            difficulty: "Easy"
        ),
        RecipeModel(
            name: "Egg pudding (casserole)",
            image: "recipe6",
            ingredients: """
            Eggs — 4 pcs.
            Milk — 250 ml
            Sugar — 2 tablespoons
            Vanilla — to taste
            """,
            preparation: """
            Whisk eggs with sugar and milk.
            Add the vanilla.
            Pour the mixture into the mold.
            Cook in a water bath or in the oven at 160°C for ~ 40 minutes.
            """,
            category: ["Dessert"],
            timePrepare: "50 mins",
            difficulty: "Medium"
        )
    ]

}
