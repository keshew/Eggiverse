import SwiftUI

struct DetailRecipeView: View {
    @StateObject var detailRecipeModel =  DetailRecipeViewModel()
    @Environment(\.presentationMode) var presentationMode
    @Binding var recipe: RecipeModel
    
    var body: some View {
        ZStack {
            Color(red: 254/255, green: 250/255, blue: 233/255).ignoresSafeArea()
            
            VStack {
                HStack {
                    Button(action: {
                        presentationMode.wrappedValue.dismiss()
                    }) {
                        Image(systemName: "arrow.left")
                            .foregroundStyle(.black)
                            .font(.system(size: 20))
                    }
                    
                    Spacer()
                    
                    Text(recipe.name)
                        .InterBold(size: 20)
                    
                    Spacer()
                    
                    Button(action: {
                        
                    }) {
                        Image(systemName: "arrow.left")
                            .foregroundStyle(.black)
                            .font(.system(size: 20))
                    }
                    .disabled(true)
                    .hidden()
                }
                .padding(.horizontal)
                
                ScrollView(showsIndicators: false) {
                    Image(recipe.image)
                        .resizable()
                        .frame(width: 350, height: 200)
                        .cornerRadius(12)
                        .padding(.top, 10)
                    
                    VStack(alignment: .leading) {
                        HStack {
                            Image(.ingredients)
                                .resizable()
                                .frame(width: 25, height: 25)
                            
                            Text("Ingredients:")
                                .InterBold(size: 16)
                            
                            Spacer()
                        }
                        
                        
                        HStack {
                            Text(recipe.ingredients)
                                .InterRegular(size: 14)
                            Spacer()
                        }
                        .padding(.horizontal, 33)
                    }
                    .padding(.horizontal, 30)
                    
                    VStack(alignment: .leading) {
                        HStack {
                            Image(.preparation)
                                .resizable()
                                .frame(width: 25, height: 25)
                            
                            Text("Preparation:")
                                .InterBold(size: 16)
                            
                            Spacer()
                        }
     
                        
                        Text(recipe.preparation)
                            .InterRegular(size: 14)
                            .padding(.horizontal, 30)
                    }
                    .padding(.horizontal, 30)
                }
            }
        }
    }
}

#Preview {
    DetailRecipeView(recipe: .constant(RecipeModel(name: "", image: "", ingredients: "", preparation: "", category: [""], timePrepare: "", difficulty: "")))
}

