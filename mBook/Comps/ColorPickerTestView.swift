//
//  ColorPickerTestView.swift
//  mBook
//
//  Created by 郑月华 on 2020/12/14.
//  Copyright © 2020 Meal Book corp. All rights reserved.
//

import SwiftUI


struct ColorPickerTestView: View {
    @State private var drawSwiftUIColor: Color = Color.red
    @State private var drawOpacity: Double = 1.0
    @State private var drawUIColor: UIColor = UIColor(red: 1.0, green: 0.0, blue: 0.0, alpha: 1.0)
    @State private var drawHexNumber: String = "#FF0000"

    var body: some View {
        VStack {
            Spacer()
            if #available(iOS 14.0, *) {
                ColorPicker("", selection: $drawSwiftUIColor, supportsOpacity: true)
                    .scaleEffect(2)
                    .offset(x: 28 - UIScreen.main.bounds.width, y: -15)
                    .onChange(of: drawSwiftUIColor) { newValue in
                        getColorsFromPicker(pickerColor: newValue)
                    }
                    
                    // Use this only if you are initializing the picker with UIColor, otherwise delete the onAppear()
                    .onAppear() {
                        //resetColorPickerWithUIColor()
                    }
            } else {
                // Fallback on earlier versions
            }

            Spacer()

            Text("SwiftUI Color").bold().foregroundColor(drawSwiftUIColor).opacity(drawOpacity)

            Text("UI Color").bold().foregroundColor(Color(drawUIColor))

            Text("Hex Number: \(drawHexNumber)").bold()
        }
    }


    func getColorsFromPicker(pickerColor: Color) {
        let colorString = "\(pickerColor)"
        let colorArray: [String] = colorString.components(separatedBy: " ")

        if colorArray.count > 1 {
            var r: CGFloat = CGFloat((Float(colorArray[1]) ?? 1))
            var g: CGFloat = CGFloat((Float(colorArray[2]) ?? 1))
            var b: CGFloat = CGFloat((Float(colorArray[3]) ?? 1))
            let alpha: CGFloat = CGFloat((Float(colorArray[4]) ?? 1))

            if (r < 0.0) {r = 0.0}
            if (g < 0.0) {g = 0.0}
            if (b < 0.0) {b = 0.0}

            if (r > 1.0) {r = 1.0}
            if (g > 1.0) {g = 1.0}
            if (b > 1.0) {b = 1.0}

            // Update UIColor
            drawUIColor = UIColor(red: r, green: g, blue: b, alpha: alpha)
            // Update Opacity
            drawOpacity = Double(alpha)

            // Update hex
            let rgb:Int = (Int)(r*255)<<16 | (Int)(g*255)<<8 | (Int)(b*255)<<0
            drawHexNumber = String(format: "#%06X", rgb)
        }
    }


    func resetColorPickerWithUIColor() {
        let color: UIColor = drawUIColor
        let r: Double = Double(color.rgba.red)
        let g: Double = Double(color.rgba.green)
        let b: Double = Double(color.rgba.blue)
        drawSwiftUIColor = Color(red: r, green: g, blue: b, opacity: drawOpacity)
    }
}

extension UIColor {
    var rgba: (red: CGFloat, green: CGFloat, blue: CGFloat, alpha: CGFloat) {
        var red: CGFloat = 0
        var green: CGFloat = 0
        var blue: CGFloat = 0
        var alpha: CGFloat = 0

        getRed(&red, green: &green, blue: &blue, alpha: &alpha)
        return (red, green, blue, alpha)
    }
}


struct ColorPickerTestView_Previews: PreviewProvider {
    static var previews: some View {
        ColorPickerTestView()
    }
}


