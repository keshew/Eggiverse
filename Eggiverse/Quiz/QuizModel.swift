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
}
