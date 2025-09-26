import SwiftUI

extension Text {
    func InterRegular(size: CGFloat,
                    color: Color = .black)  -> some View {
        self.font(.custom("Inter-Regular", size: size))
            .foregroundColor(color)
    }
    
    func InterMedium(size: CGFloat,
                    color: Color = .black)  -> some View {
        self.font(.custom("Inter-Medium", size: size))
            .foregroundColor(color)
    }
    
    func InterBold(size: CGFloat,
                   color: Color = .black)  -> some View {
        self.font(.custom("Inter-Bold", size: size))
            .foregroundColor(color)
    }
    
    func CustomFontGradient(size: CGFloat,
                            color: LinearGradient = LinearGradient(colors: [Color(red: 255/255, green: 218/255, blue: 1/255),
                                                                            .white,
                                                                            Color(red: 255/255, green: 218/255, blue: 1/255),
                                                                            .white], startPoint: .top, endPoint: .bottom))  -> some View {
                                                                                self.font(.custom("Inter-Bold", size: size))
                                                                                    .foregroundStyle(color)
                                                                            }
}

extension View {
    func outlineText(color: Color, width: CGFloat) -> some View {
        modifier(StrokeModifier(strokeSize: width, strokeColor: color))
    }
    
    func outlineTextLess(color: Color, width: CGFloat) -> some View {
        modifier(StrokeModifierLess(strokeSize: width, strokeColor: color))
    }
}

struct StrokeModifier: ViewModifier {
    private let id = UUID()
    var strokeSize: CGFloat = 1
    var strokeColor: Color = .blue
    
    func body(content: Content) -> some View {
        content
            .padding(strokeSize*2)
            .background (Rectangle()
                .foregroundStyle(strokeColor)
                .mask({
                    outline(context: content)
                })
            )}
    
    func outline(context:Content) -> some View {
        Canvas { context, size in
            context.addFilter(.alphaThreshold(min: 0.01))
            context.drawLayer { layer in
                if let text = context.resolveSymbol(id: id) {
                    layer.draw(text, at: .init(x: size.width/1.95, y: size.height/1.9))
                }
            }
        } symbols: {
            context.tag(id)
                .blur(radius: strokeSize)
        }
    }
}

struct StrokeModifierLess: ViewModifier {
    private let id = UUID()
    var strokeSize: CGFloat = 1
    var strokeColor: Color = .blue
    
    func body(content: Content) -> some View {
        content
            .padding(strokeSize*2)
            .background (Rectangle()
                .foregroundStyle(strokeColor)
                .mask({
                    outline(context: content)
                })
            )}
    
    func outline(context:Content) -> some View {
        Canvas { context, size in
            context.addFilter(.alphaThreshold(min: 0.01))
            context.drawLayer { layer in
                if let text = context.resolveSymbol(id: id) {
                    layer.draw(text, at: .init(x: size.width/2, y: size.height/2))
                }
            }
        } symbols: {
            context.tag(id)
                .blur(radius: strokeSize)
        }
    }
}
