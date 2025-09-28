import SwiftUI

struct QuizModel {
    let facts: [FactModel] = [
        FactModel(
            image: "fact1",
            detailImages: ["fact2", "fact3"],
            title: "Feathers",
            desc: "Birds are the only modern animals that have feathers.",
            detailInfo: [
                "Feathers provide insulation and are essential for flight.",
                "They come in various types, including contour, down, and flight feathers."
            ],
            type: "Anatomy"
        ),
        FactModel(
            image: "fact2",
            detailImages: ["fact3", "fact4"],
            title: "Feather Growth",
            desc: "Feathers grow along certain lines — pterylia, and not over the entire surface of the body.",
            detailInfo: [
                "The specific growth pattern helps reduce drag during flight.",
                "Pterylia arrangement varies among species, influencing appearance and aerodynamics."
            ],
            type: "Anatomy"
        ),
        FactModel(
            image: "fact3",
            detailImages: ["fact4", "fact5"],
            title: "Bone Structure",
            desc: "Most birds have a hollow bone structure, which lightens their weight and helps them fly.",
            detailInfo: [
                "Hollow bones contain struts for strength with minimal weight.",
                "This adaptation contributes significantly to flight efficiency."
            ],
            type: "Anatomy"
        ),
        FactModel(
            image: "fact4",
            detailImages: ["fact5", "fact1"],
            title: "Heart Rate",
            desc: "The heart of birds beats much more frequently than that of mammals: hummingbirds have up to 1,200 beats per minute.",
            detailInfo: [
                "Such rapid heartbeats support their high metabolism and energetic flight.",
                "Hummingbirds can hover by flapping wings up to 80 times per second."
            ],
            type: "Anatomy"
        ),
        FactModel(
            image: "fact5",
            detailImages: ["fact1", "fact2"],
            title: "Color Vision",
            desc: "Many birds have excellent color vision, they are able to see ultraviolet light.",
            detailInfo: [
                "Ultraviolet vision aids in finding food and selecting mates.",
                "Birds' retina contains four types of cones, unlike humans' three."
            ],
            type: "Anatomy"
        ),
        FactModel(
            image: "fact1",
            detailImages: ["fact2", "fact3"],
            title: "Species Variety",
            desc: "There are more than 10,000 species of birds on Earth.",
            detailInfo: [
                "Bird species inhabit every continent and many diverse environments.",
                "This variety reflects birds' evolutionary adaptability."
            ],
            type: "Behavior"
        ),
        FactModel(
            image: "fact2",
            detailImages: ["fact3", "fact4"],
            title: "Largest Bird",
            desc: "The largest modern bird is the ostrich, its height can exceed 2.5 meters.",
            detailInfo: [
                "Ostriches are flightless but can run up to 70 km/h.",
                "They possess powerful legs used for defense."
            ],
            type: "Anatomy"
        ),
        FactModel(
            image: "fact3",
            detailImages: ["fact4", "fact5"],
            title: "Smallest Bird",
            desc: "The smallest is a hummingbird bee from Cuba, its weight is only about 2 grams.",
            detailInfo: [
                "Its tiny size allows for quick, agile flight.",
                "Despite small size, it has one of the highest metabolism rates among birds."
            ],
            type: "Anatomy"
        ),
        FactModel(
            image: "fact4",
            detailImages: ["fact5", "fact1"],
            title: "Wingspan",
            desc: "The bird with the largest wingspan is the wandering albatross (up to 3.5 meters).",
            detailInfo: [
                "Such wings enable long-distance gliding over oceans.",
                "They can stay aloft for hours without flapping wings."
            ],
            type: "Anatomy"
        ),
        FactModel(
            image: "fact5",
            detailImages: ["fact1", "fact2"],
            title: "Fastest Diver",
            desc: "The fastest bird in diving is the peregrine falcon, its speed exceeds 320 km/h.",
            detailInfo: [
                "Peregrine falcons stoop from great heights to catch prey.",
                "Their body is streamlined to reduce air resistance."
            ],
            type: "Behavior"
        ),
        FactModel(
            image: "fact1",
            detailImages: ["fact2", "fact3"],
            title: "Head Rotation",
            desc: "Owls can turn their heads almost 270 degrees.",
            detailInfo: [
                "This ability helps owls spot prey without moving their bodies.",
                "Bone structure and blood vessels enable such wide rotation safely."
            ],
            type: "Adaptations"
        ),
        FactModel(
            image: "fact2",
            detailImages: ["fact3", "fact4"],
            title: "Intelligence",
            desc: "Crows and parrots are among the most intelligent birds: they can use tools and remember human faces.",
            detailInfo: [
                "Such intelligence supports complex social behaviors.",
                "These birds can solve puzzles and adapt to new environments."
            ],
            type: "Behavior"
        ),
        FactModel(
            image: "fact3",
            detailImages: ["fact4", "fact5"],
            title: "Swimming Ability",
            desc: "Penguins cannot fly, but they swim superbly, some species dive to a depth of more than 500 meters.",
            detailInfo: [
                "They use their flippers for powerful navigation underwater.",
                "Adaptations include dense bones to reduce buoyancy."
            ],
            type: "Adaptations"
        ),
        FactModel(
            image: "fact4",
            detailImages: ["fact5", "fact1"],
            title: "Migrations",
            desc: "Arctic terns make the longest migrations — up to 70,000 km per year.",
            detailInfo: [
                "They travel from Arctic to Antarctic and back annually.",
                "Navigation relies on magnetic fields, stars, and landmarks."
            ],
            type: "Behavior"
        ),
        FactModel(
            image: "fact5",
            detailImages: ["fact1", "fact2"],
            title: "Plumage Color",
            desc: "Flamingos get pink plumage color due to food rich in carotenoids (crustaceans, algae).",
            detailInfo: [
                "Their diet directly affects feather coloration intensity.",
                "Healthy pink feathers indicate a well-nourished flamingo."
            ],
            type: "Behavior"
        ),
        FactModel(
            image: "fact1",
            detailImages: ["fact2", "fact3"],
            title: "Egg Shells",
            desc: "Most birds have hard calcium shells, and some have a bluish or green tint.",
            detailInfo: [
                "Eggshell color helps camouflage nests from predators.",
                "Calcium provides strength essential for protection."
            ],
            type: "Anatomy"
        ),
        FactModel(
            image: "fact2",
            detailImages: ["fact3", "fact4"],
            title: "Clutch Size",
            desc: "The hummingbird has the smallest clutch (1-2 eggs the size of a pea), and the ostrich has the largest (up to 15 huge eggs).",
            detailInfo: [
                "Clutch size varies with species' reproductive strategies.",
                "Smaller birds often have fewer but more frequently laid eggs."
            ],
            type: "Behavior"
        ),
        FactModel(
            image: "fact3",
            detailImages: ["fact4", "fact5"],
            title: "Parental Care",
            desc: "Birds can \"sit\" on eggs one at a time — in many species, males also participate in hatching.",
            detailInfo: [
                "Sharing incubation duties increases egg survival rates.",
                "Male involvement is common in species with shared parenting."
            ],
            type: "Behavior"
        ),
        FactModel(
            image: "fact4",
            detailImages: ["fact5", "fact1"],
            title: "Nesting Parasitism",
            desc: "Some birds (for example, cuckoos) have nesting parasitism — they throw their eggs to other species.",
            detailInfo: [
                "Parasitic birds rely on others to raise their young.",
                "This behavior reduces their parental investment."
            ],
            type: "Behavior"
        ),
        FactModel(
            image: "fact5",
            detailImages: ["fact1", "fact2"],
            title: "Vocal Variety",
            desc: "The voices of birds are very diverse: the nightingale can perform more than 200 different sound variations.",
            detailInfo: [
                "Complex songs help in territory defense and mate attraction.",
                "Birds learn songs through imitation and practice."
            ],
            type: "Behavior"
        )
    ]
    
    let quizData: [QuizQA] = [
        QuizQA(question: "What is basically the shell of a chicken egg?", answers: ["Silicon", "Calcium carbonate", "Iron", "Sodium"], rightAnswerIndex: 1),
        QuizQA(question: "Which part of the egg contains the most fat?", answers: ["Protein", "Yolk", "The shell", "The membrane"], rightAnswerIndex: 1),
        QuizQA(question: "What vitamin in an egg helps to absorb calcium?", answers: ["Vitamin C", "Vitamin D", "Vitamin B12", "Vitamin K"], rightAnswerIndex: 1),
        QuizQA(question: "Which eggshell color is more nutritious — white or brown?", answers: ["White", "Brown", "No, they are equally nutritious", "Green"], rightAnswerIndex: 2),
        QuizQA(question: "What forms inside the egg and increases with age?", answers: ["A blood vessel", "Air chamber", "Yolk sac", "The protein shell"], rightAnswerIndex: 1),
        QuizQA(question: "What happens to the protein when heated?", answers: ["It evaporates", "It denatures and hardens", "It's dissolving", "It turns into fat"], rightAnswerIndex: 1),
        QuizQA(question: "What test can determine the freshness of an egg?", answers: ["Burn it with a candle", "Tapping on the shell", "Put it in the water", "Sniffing the shell"], rightAnswerIndex: 2),
        QuizQA(question: "Why is it difficult to peel a fresh boiled egg?", answers: ["Liquid protein", "The protein is tightly attached to the inner shell", "The shell is too thick", "The yolk is soft"], rightAnswerIndex: 1),
        QuizQA(question: "What element in an egg is good for the brain?", answers: ["Fluorine", "Choline", "Nitrogen", "Mercury"], rightAnswerIndex: 1),
        QuizQA(question: "How many eggs can one ostrich egg replace?", answers: ["10–15", "25–30", "40–50", "5–7"], rightAnswerIndex: 2),

        QuizQA(question: "Which is the largest bird in the world?", answers: ["Pelican", "Eagle", "Ostrich", "Flamingo"], rightAnswerIndex: 2),
        QuizQA(question: "Which bird is the smallest?", answers: ["Sparrow", "Hummingbird bee", "Titmouse", "The Canary"], rightAnswerIndex: 1),
        QuizQA(question: "Which bird has the largest wingspan?", answers: ["The Wandering Albatross", "The Eagle", "The frigate", "Pelican"], rightAnswerIndex: 0),
        QuizQA(question: "Which bird is the fastest in diving?", answers: ["Peregrine Falcon", "Sokol-derbnik", "Eagle", "Swallow"], rightAnswerIndex: 0),
        QuizQA(question: "Which bird makes the longest migrations?", answers: ["Swan", "Arctic tern", "Goose", "Crane"], rightAnswerIndex: 1),
        QuizQA(question: "Which bird swims well but does not fly?", answers: ["The Penguin", "Flamingo", "The Loon", "Seagull"], rightAnswerIndex: 0),
        QuizQA(question: "Which bird can turn its head almost 270°?", answers: ["Falcon", "Owl", "Parrot", "Crow"], rightAnswerIndex: 1),
        QuizQA(question: "Which birds can imitate human speech?", answers: ["Tits", "Parrots and crows", "Swallows", "Pigeons"], rightAnswerIndex: 1),
        QuizQA(question: "Which bird has a pink color because of its food?", answers: ["Flamingos", "Pelican", "The Heron", "Crane"], rightAnswerIndex: 0),
        QuizQA(question: "Which bird was used as a postal bird?", answers: ["Pigeon", "Swallow", "Owl", "Seagull"], rightAnswerIndex: 0),

        QuizQA(question: "Which bird is considered a symbol of wisdom?", answers: ["Eagle", "Owl", "Titmouse", "Goose"], rightAnswerIndex: 1),
        QuizQA(question: "Which bird can imitate sounds and \"dance\"?", answers: ["Peacock", "The lyre bird", "Macaw parrot", "Toucan"], rightAnswerIndex: 1),
        QuizQA(question: "Which bird lays the largest eggs?", answers: ["Ostrich", "Turkey", "Cassowary", "Swan"], rightAnswerIndex: 0),
        QuizQA(question: "Which bird has the smallest eggs?", answers: ["Hummingbirds", "Titmouse", "Swallow", "Sparrow"], rightAnswerIndex: 0),
        QuizQA(question: "Which bird can fly backwards?", answers: ["Hummingbirds", "Eagle", "Swallow", "Pigeon"], rightAnswerIndex: 0),
        QuizQA(question: "Which bird dives to a depth of more than 500 m?", answers: ["The Imperial Penguin", "Cormorant", "The Albatross", "Kaira"], rightAnswerIndex: 0),
        QuizQA(question: "Which birds build beautiful \"towers\" and decorated nests for the females?", answers: ["The Eagles", "Gardeners (bowerbirds)", "Swans", "The Jays"], rightAnswerIndex: 1),
        QuizQA(question: "What kind of bird can fly for months without landing?", answers: ["Albatross", "Stork", "Pelican", "Crane"], rightAnswerIndex: 0),
        QuizQA(question: "Which bird is the symbol of the USA?", answers: ["Bald Eagle", "Falcon", "Raven", "Turkey"], rightAnswerIndex: 0),
        QuizQA(question: "Which bird is known for its melodious singing?", answers: ["The Starling", "The Nightingale", "The Canary", "The Lark"], rightAnswerIndex: 1),

        QuizQA(question: "What part of the egg is used to create a shiny crust in baking?", answers: ["Protein", "Yolk", "The shell", "The membrane"], rightAnswerIndex: 0),
        QuizQA(question: "What protects the egg from bacteria from the outside?", answers: ["Protein", "The yolk", "Cuticle (film)", "Air chamber"], rightAnswerIndex: 2),
        QuizQA(question: "What is the name of the protein coagulation process during cooking?", answers: ["Fermentation", "Denaturation", "Caramelization", "Hydration"], rightAnswerIndex: 1),
        QuizQA(question: "In which sauce are eggs a mandatory ingredient?", answers: ["Soy sauce", "Mayonnaise", "Barbecue", "Ketchup"], rightAnswerIndex: 1),
        QuizQA(question: "How many micropores can there be on the shell of a chicken egg?", answers: ["100–200", "500–600", "Up to 17,000", "Not a single one"], rightAnswerIndex: 2),
        QuizQA(question: "Which part of the egg contains all the essential amino acids?", answers: ["The shell", "Protein", "The yolk", "Air chamber"], rightAnswerIndex: 1),
        QuizQA(question: "Which product is considered a reference in terms of amino acid composition?", answers: ["Beef", "Fish", "Egg", "Milk"], rightAnswerIndex: 2),
        QuizQA(question: "Which yolk color is considered more useful?", answers: ["Light Yellow", "Any — depends only on the feed of the bird", "Bright orange", "White"], rightAnswerIndex: 1),
        QuizQA(question: "In what condition does protein contain about 90% water?", answers: ["Dry powder", "Fresh egg white", "Boiled protein", "Frozen protein"], rightAnswerIndex: 1)
    ]
}
