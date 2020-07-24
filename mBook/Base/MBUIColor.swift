//
//  MBUIColor.swift
//  mBook
//
//  Created by 郑月华 on 2020/07/11.
//  Copyright © 2020 Meal Book corp. All rights reserved.
//

import SwiftUI
enum ColorEnum: String
{
    case Snow = "Snow"
    case GhostWhite = "GhostWhite"
    case WhiteSmoke = "WhiteSmoke"
    case Gainsboro = "Gainsboro"
    case FloralWhite = "FloralWhite"
    case OldLace = "OldLace"
    case Linen = "Linen"
    case AntiqueWhite = "AntiqueWhite"
    case PapayaWhip = "PapayaWhip"
    case BlanchedAlmond = "BlanchedAlmond"
    case Bisque = "Bisque"
    case PeachPuff = "PeachPuff"
    case NavajoWhite = "NavajoWhite"
    case Moccasin = "Moccasin"
    case Cornsilk = "Cornsilk"
    case Ivory = "Ivory"
    case LemonChiffon = "LemonChiffon"
    case Seashell = "Seashell"
    case Honeydew = "Honeydew"
    case MintCream = "MintCream"
    case Azure = "Azure"
    case AliceBlue = "AliceBlue"
    case lavender = "lavender"
    case LavenderBlush = "LavenderBlush"
    case MistyRose = "MistyRose"
    case White = "White"
    case Black = "Black"
    case DarkSlateGray = "DarkSlateGray"
    case DimGrey = "DimGrey"
    case SlateGrey = "SlateGrey"
    case LightSlateGray = "LightSlateGray"
    case Grey = "Grey"
    case LightGray = "LightGray"
    case MidnightBlue = "MidnightBlue"
    case NavyBlue = "NavyBlue"
    case CornflowerBlue = "CornflowerBlue"
    case DarkSlateBlue = "DarkSlateBlue"
    case SlateBlue = "SlateBlue"
    case MediumSlateBlue = "MediumSlateBlue"
    case LightSlateBlue = "LightSlateBlue"
    case MediumBlue = "MediumBlue"
    case RoyalBlue = "RoyalBlue"
    case Blue = "Blue"
    case DodgerBlue = "DodgerBlue"
    case DeepSkyBlue = "DeepSkyBlue"
    case SkyBlue = "SkyBlue"
    case LightSkyBlue = "LightSkyBlue"
    case SteelBlue = "SteelBlue"
    case LightSteelBlue = "LightSteelBlue"
    case LightBlue = "LightBlue"
    case PowderBlue = "PowderBlue"
    case PaleTurquoise = "PaleTurquoise"
    case DarkTurquoise = "DarkTurquoise"
    case MediumTurquoise = "MediumTurquoise"
    case Turquoise = "Turquoise"
    case Cyan = "Cyan"
    case LightCyan = "LightCyan"
    case CadetBlue = "CadetBlue"
    case MediumAquamarine = "MediumAquamarine"
    case Aquamarine = "Aquamarine"
    case DarkGreen = "DarkGreen"
    case DarkOliveGreen = "DarkOliveGreen"
    case DarkSeaGreen = "DarkSeaGreen"
    case SeaGreen = "SeaGreen"
    case MediumSeaGreen = "MediumSeaGreen"
    case LightSeaGreen = "LightSeaGreen"
    case PaleGreen = "PaleGreen"
    case SpringGreen = "SpringGreen"
    case LawnGreen = "LawnGreen"
    case Green = "Green"
    case Chartreuse = "Chartreuse"
    case MedSpringGreen = "MedSpringGreen"
    case GreenYellow = "GreenYellow"
    case LimeGreen = "LimeGreen"
    case YellowGreen = "YellowGreen"
    case ForestGreen = "ForestGreen"
    case OliveDrab = "OliveDrab"
    case DarkKhaki = "DarkKhaki"
    case PaleGoldenrod = "PaleGoldenrod"
    case LtGoldenrodYello = "LtGoldenrodYello"
    case LightYellow = "LightYellow"
    case Yellow = "Yellow"
    case Gold = "Gold"
    case LightGoldenrod = "LightGoldenrod"
    case goldenrod = "goldenrod"
    case DarkGoldenrod = "DarkGoldenrod"
    case RosyBrown = "RosyBrown"
    case IndianRed = "IndianRed"
    case SaddleBrown = "SaddleBrown"
    case Sienna = "Sienna"
    case Peru = "Peru"
    case Burlywood = "Burlywood"
    case Beige = "Beige"
    case Wheat = "Wheat"
    case SandyBrown = "SandyBrown"
    case Tan = "Tan"
    case Chocolate = "Chocolate"
    case Firebrick = "Firebrick"
    case Brown = "Brown"
    case DarkSalmon = "DarkSalmon"
    case Salmon = "Salmon"
    case LightSalmon = "LightSalmon"
    case Orange = "Orange"
    case DarkOrange = "DarkOrange"
    case Coral = "Coral"
    case LightCoral = "LightCoral"
    case Tomato = "Tomato"
    case OrangeRed = "OrangeRed"
    case Red = "Red"
    case HotPink = "HotPink"
    case DeepPink = "DeepPink"
    case Pink = "Pink"
    case LightPink = "LightPink"
    case PaleVioletRed = "PaleVioletRed"
    case Maroon = "Maroon"
    case MediumVioletRed = "MediumVioletRed"
    case VioletRed = "VioletRed"
    case Magenta = "Magenta"
    case Violet = "Violet"
    case Plum = "Plum"
    case Orchid = "Orchid"
    case MediumOrchid = "MediumOrchid"
    case DarkOrchid = "DarkOrchid"
    case DarkViolet = "DarkViolet"
    case BlueViolet = "BlueViolet"
    case Purple = "Purple"
    case MediumPurple = "MediumPurple"
    case Thistle = "Thistle"
    case Snow1 = "Snow1"
    case Snow2 = "Snow2"
    case Snow3 = "Snow3"
    case Snow4 = "Snow4"
    case Seashell1 = "Seashell1"
    case Seashell2 = "Seashell2"
    case Seashell3 = "Seashell3"
    case Seashell4 = "Seashell4"
    case AntiqueWhite1 = "AntiqueWhite1"
    case AntiqueWhite2 = "AntiqueWhite2"
    case AntiqueWhite3 = "AntiqueWhite3"
    case AntiqueWhite4 = "AntiqueWhite4"
    case Bisque1 = "Bisque1"
    case Bisque2 = "Bisque2"
    case Bisque3 = "Bisque3"
    case Bisque4 = "Bisque4"
    case PeachPuff1 = "PeachPuff1"
    case PeachPuff2 = "PeachPuff2"
    case PeachPuff3 = "PeachPuff3"
    case PeachPuff4 = "PeachPuff4"
    case NavajoWhite1 = "NavajoWhite1"
    case NavajoWhite2 = "NavajoWhite2"
    case NavajoWhite3 = "NavajoWhite3"
    case NavajoWhite4 = "NavajoWhite4"
    case LemonChiffon1 = "LemonChiffon1"
    case LemonChiffon2 = "LemonChiffon2"
    case LemonChiffon3 = "LemonChiffon3"
    case LemonChiffon4 = "LemonChiffon4"
    case Cornsilk1 = "Cornsilk1"
    case Cornsilk2 = "Cornsilk2"
    case Cornsilk3 = "Cornsilk3"
    case Cornsilk4 = "Cornsilk4"
    case Ivory1 = "Ivory1"
    case Ivory2 = "Ivory2"
    case Ivory3 = "Ivory3"
    case Ivory4 = "Ivory4"
    case Honeydew1 = "Honeydew1"
    case Honeydew2 = "Honeydew2"
    case Honeydew3 = "Honeydew3"
    case Honeydew4 = "Honeydew4"
    case LavenderBlush1 = "LavenderBlush1"
    case LavenderBlush2 = "LavenderBlush2"
    case LavenderBlush3 = "LavenderBlush3"
    case LavenderBlush4 = "LavenderBlush4"
    case MistyRose1 = "MistyRose1"
    case MistyRose2 = "MistyRose2"
    case MistyRose3 = "MistyRose3"
    case MistyRose4 = "MistyRose4"
    case Azure1 = "Azure1"
    case Azure2 = "Azure2"
    case Azure3 = "Azure3"
    case Azure4 = "Azure4"
    case SlateBlue1 = "SlateBlue1"
    case SlateBlue2 = "SlateBlue2"
    case SlateBlue3 = "SlateBlue3"
    case SlateBlue4 = "SlateBlue4"
    case RoyalBlue1 = "RoyalBlue1"
    case RoyalBlue2 = "RoyalBlue2"
    case RoyalBlue3 = "RoyalBlue3"
    case RoyalBlue4 = "RoyalBlue4"
    case Blue1 = "Blue1"
    case Blue2 = "Blue2"
    case Blue3 = "Blue3"
    case Blue4 = "Blue4"
    case DodgerBlue1 = "DodgerBlue1"
    case DodgerBlue2 = "DodgerBlue2"
    case DodgerBlue3 = "DodgerBlue3"
    case DodgerBlue4 = "DodgerBlue4"
    case SteelBlue1 = "SteelBlue1"
    case SteelBlue2 = "SteelBlue2"
    case SteelBlue3 = "SteelBlue3"
    case SteelBlue4 = "SteelBlue4"
    case DeepSkyBlue1 = "DeepSkyBlue1"
    case DeepSkyBlue2 = "DeepSkyBlue2"
    case DeepSkyBlue3 = "DeepSkyBlue3"
    case DeepSkyBlue4 = "DeepSkyBlue4"
    case SkyBlue1 = "SkyBlue1"
    case SkyBlue2 = "SkyBlue2"
    case SkyBlue3 = "SkyBlue3"
    case SkyBlue4 = "SkyBlue4"
    case LightSkyBlue1 = "LightSkyBlue1"
    case LightSkyBlue2 = "LightSkyBlue2"
    case LightSkyBlue3 = "LightSkyBlue3"
    case LightSkyBlue4 = "LightSkyBlue4"
    case SlateGray1 = "SlateGray1"
    case SlateGray2 = "SlateGray2"
    case SlateGray3 = "SlateGray3"
    case SlateGray4 = "SlateGray4"
    case LightSteelBlue1 = "LightSteelBlue1"
    case LightSteelBlue2 = "LightSteelBlue2"
    case LightSteelBlue3 = "LightSteelBlue3"
    case LightSteelBlue4 = "LightSteelBlue4"
    case LightBlue1 = "LightBlue1"
    case LightBlue2 = "LightBlue2"
    case LightBlue3 = "LightBlue3"
    case LightBlue4 = "LightBlue4"
    case LightCyan1 = "LightCyan1"
    case LightCyan2 = "LightCyan2"
    case LightCyan3 = "LightCyan3"
    case LightCyan4 = "LightCyan4"
    case PaleTurquoise1 = "PaleTurquoise1"
    case PaleTurquoise2 = "PaleTurquoise2"
    case PaleTurquoise3 = "PaleTurquoise3"
    case PaleTurquoise4 = "PaleTurquoise4"
    case CadetBlue1 = "CadetBlue1"
    case CadetBlue2 = "CadetBlue2"
    case CadetBlue3 = "CadetBlue3"
    case CadetBlue4 = "CadetBlue4"
    case Turquoise1 = "Turquoise1"
    case Turquoise2 = "Turquoise2"
    case Turquoise3 = "Turquoise3"
    case Turquoise4 = "Turquoise4"
    case Cyan1 = "Cyan1"
    case Cyan2 = "Cyan2"
    case Cyan3 = "Cyan3"
    case Cyan4 = "Cyan4"
    case DarkSlateGray1 = "DarkSlateGray1"
    case DarkSlateGray2 = "DarkSlateGray2"
    case DarkSlateGray3 = "DarkSlateGray3"
    case DarkSlateGray4 = "DarkSlateGray4"
    case Aquamarine1 = "Aquamarine1"
    case Aquamarine2 = "Aquamarine2"
    case Aquamarine3 = "Aquamarine3"
    case Aquamarine4 = "Aquamarine4"
    case DarkSeaGreen1 = "DarkSeaGreen1"
    case DarkSeaGreen2 = "DarkSeaGreen2"
    case DarkSeaGreen3 = "DarkSeaGreen3"
    case DarkSeaGreen4 = "DarkSeaGreen4"
    case SeaGreen1 = "SeaGreen1"
    case SeaGreen2 = "SeaGreen2"
    case SeaGreen3 = "SeaGreen3"
    case SeaGreen4 = "SeaGreen4"
    case PaleGreen1 = "PaleGreen1"
    case PaleGreen2 = "PaleGreen2"
    case PaleGreen3 = "PaleGreen3"
    case PaleGreen4 = "PaleGreen4"
    case SpringGreen1 = "SpringGreen1"
    case SpringGreen2 = "SpringGreen2"
    case SpringGreen3 = "SpringGreen3"
    case SpringGreen4 = "SpringGreen4"
    case Green1 = "Green1"
    case Green2 = "Green2"
    case Green3 = "Green3"
    case Green4 = "Green4"
    case Chartreuse1 = "Chartreuse1"
    case Chartreuse2 = "Chartreuse2"
    case Chartreuse3 = "Chartreuse3"
    case Chartreuse4 = "Chartreuse4"
    case OliveDrab1 = "OliveDrab1"
    case OliveDrab2 = "OliveDrab2"
    case OliveDrab3 = "OliveDrab3"
    case OliveDrab4 = "OliveDrab4"
    case DarkOliveGreen1 = "DarkOliveGreen1"
    case DarkOliveGreen2 = "DarkOliveGreen2"
    case DarkOliveGreen3 = "DarkOliveGreen3"
    case DarkOliveGreen4 = "DarkOliveGreen4"
    case Khaki1 = "Khaki1"
    case Khaki2 = "Khaki2"
    case Khaki3 = "Khaki3"
    case Khaki4 = "Khaki4"
    case LightGoldenrod1 = "LightGoldenrod1"
    case LightGoldenrod2 = "LightGoldenrod2"
    case LightGoldenrod3 = "LightGoldenrod3"
    case LightGoldenrod4 = "LightGoldenrod4"
    case LightYellow1 = "LightYellow1"
    case LightYellow2 = "LightYellow2"
    case LightYellow3 = "LightYellow3"
    case LightYellow4 = "LightYellow4"
    case Yellow1 = "Yellow1"
    case Yellow2 = "Yellow2"
    case Yellow3 = "Yellow3"
    case Yellow4 = "Yellow4"
    case Gold1 = "Gold1"
    case Gold2 = "Gold2"
    case Gold3 = "Gold3"
    case Gold4 = "Gold4"
    case Goldenrod1 = "Goldenrod1"
    case Goldenrod2 = "Goldenrod2"
    case Goldenrod3 = "Goldenrod3"
    case Goldenrod4 = "Goldenrod4"
    case DarkGoldenrod1 = "DarkGoldenrod1"
    case DarkGoldenrod2 = "DarkGoldenrod2"
    case DarkGoldenrod3 = "DarkGoldenrod3"
    case DarkGoldenrod4 = "DarkGoldenrod4"
    case RosyBrown1 = "RosyBrown1"
    case RosyBrown2 = "RosyBrown2"
    case RosyBrown3 = "RosyBrown3"
    case RosyBrown4 = "RosyBrown4"
    case IndianRed1 = "IndianRed1"
    case IndianRed2 = "IndianRed2"
    case IndianRed3 = "IndianRed3"
    case IndianRed4 = "IndianRed4"
    case Sienna1 = "Sienna1"
    case Sienna2 = "Sienna2"
    case Sienna3 = "Sienna3"
    case Sienna4 = "Sienna4"
    case Burlywood1 = "Burlywood1"
    case Burlywood2 = "Burlywood2"
    case Burlywood3 = "Burlywood3"
    case Burlywood4 = "Burlywood4"
    case Wheat1 = "Wheat1"
    case Wheat2 = "Wheat2"
    case Wheat3 = "Wheat3"
    case Wheat4 = "Wheat4"
    case Tan1 = "Tan1"
    case Tan2 = "Tan2"
    case Tan3 = "Tan3"
    case Tan4 = "Tan4"
    case Chocolate1 = "Chocolate1"
    case Chocolate2 = "Chocolate2"
    case Chocolate3 = "Chocolate3"
    case Chocolate4 = "Chocolate4"
    case Firebrick1 = "Firebrick1"
    case Firebrick2 = "Firebrick2"
    case Firebrick3 = "Firebrick3"
    case Firebrick4 = "Firebrick4"
    case Brown1 = "Brown1"
    case Brown2 = "Brown2"
    case Brown3 = "Brown3"
    case Brown4 = "Brown4"
    case Salmon1 = "Salmon1"
    case Salmon2 = "Salmon2"
    case Salmon3 = "Salmon3"
    case Salmon4 = "Salmon4"
    case LightSalmon1 = "LightSalmon1"
    case LightSalmon2 = "LightSalmon2"
    case LightSalmon3 = "LightSalmon3"
    case LightSalmon4 = "LightSalmon4"
    case Orange1 = "Orange1"
    case Orange2 = "Orange2"
    case Orange3 = "Orange3"
    case Orange4 = "Orange4"
    case DarkOrange1 = "DarkOrange1"
    case DarkOrange2 = "DarkOrange2"
    case DarkOrange3 = "DarkOrange3"
    case DarkOrange4 = "DarkOrange4"
    case Coral1 = "Coral1"
    case Coral2 = "Coral2"
    case Coral3 = "Coral3"
    case Coral4 = "Coral4"
    case Tomato1 = "Tomato1"
    case Tomato2 = "Tomato2"
    case Tomato3 = "Tomato3"
    case Tomato4 = "Tomato4"
    case OrangeRed1 = "OrangeRed1"
    case OrangeRed2 = "OrangeRed2"
    case OrangeRed3 = "OrangeRed3"
    case OrangeRed4 = "OrangeRed4"
    case Red1 = "Red1"
    case Red2 = "Red2"
    case Red3 = "Red3"
    case Red4 = "Red4"
    case DeepPink1 = "DeepPink1"
    case DeepPink2 = "DeepPink2"
    case DeepPink3 = "DeepPink3"
    case DeepPink4 = "DeepPink4"
    case HotPink1 = "HotPink1"
    case HotPink2 = "HotPink2"
    case HotPink3 = "HotPink3"
    case HotPink4 = "HotPink4"
    case Pink1 = "Pink1"
    case Pink2 = "Pink2"
    case Pink3 = "Pink3"
    case Pink4 = "Pink4"
    case LightPink1 = "LightPink1"
    case LightPink2 = "LightPink2"
    case LightPink3 = "LightPink3"
    case LightPink4 = "LightPink4"
    case PaleVioletRed1 = "PaleVioletRed1"
    case PaleVioletRed2 = "PaleVioletRed2"
    case PaleVioletRed3 = "PaleVioletRed3"
    case PaleVioletRed4 = "PaleVioletRed4"
    case Maroon1 = "Maroon1"
    case Maroon2 = "Maroon2"
    case Maroon3 = "Maroon3"
    case Maroon4 = "Maroon4"
    case VioletRed1 = "VioletRed1"
    case VioletRed2 = "VioletRed2"
    case VioletRed3 = "VioletRed3"
    case VioletRed4 = "VioletRed4"
    case Magenta1 = "Magenta1"
    case Magenta2 = "Magenta2"
    case Magenta3 = "Magenta3"
    case Magenta4 = "Magenta4"
    case Orchid1 = "Orchid1"
    case Orchid2 = "Orchid2"
    case Orchid3 = "Orchid3"
    case Orchid4 = "Orchid4"
    case Plum1 = "Plum1"
    case Plum2 = "Plum2"
    case Plum3 = "Plum3"
    case Plum4 = "Plum4"
    case MediumOrchid1 = "MediumOrchid1"
    case MediumOrchid2 = "MediumOrchid2"
    case MediumOrchid3 = "MediumOrchid3"
    case MediumOrchid4 = "MediumOrchid4"
    case DarkOrchid1 = "DarkOrchid1"
    case DarkOrchid2 = "DarkOrchid2"
    case DarkOrchid3 = "DarkOrchid3"
    case DarkOrchid4 = "DarkOrchid4"
    case Purple1 = "Purple1"
    case Purple2 = "Purple2"
    case Purple3 = "Purple3"
    case Purple4 = "Purple4"
    case MediumPurple1 = "MediumPurple1"
    case MediumPurple2 = "MediumPurple2"
    case MediumPurple3 = "MediumPurple3"
    case MediumPurple4 = "MediumPurple4"
    case Thistle1 = "Thistle1"
    case Thistle2 = "Thistle2"
    case Thistle3 = "Thistle3"
    case Thistle4 = "Thistle4"
    case grey11 = "grey11"
    case grey21 = "grey21"
    case grey31 = "grey31"
    case grey41 = "grey41"
    case grey51 = "grey51"
    case grey61 = "grey61"
    case grey71 = "grey71"
    case gray81 = "gray81"
    case gray91 = "gray91"
    case DarkGrey = "DarkGrey"
    case DarkBlue = "DarkBlue"
    case DarkCyan = "DarkCyan"
    case DarkMagenta = "DarkMagenta"
    case DarkRed = "DarkRed"
    case LightGreen = "LightGreen"
}

//let anEnum = ColorEnum(rawValue: "one")!

struct MBUIColor {
    static func getColor(color:String?)->Color?{
        return color == nil ?
            nil:
            Color( MBUIColor.getUIColor(color: ColorEnum(rawValue: color!)!))
    }
    static func getUIColor(color: String?)->UIColor{
        return (color == nil ?
            nil:
            MBUIColor.getUIColor(color: ColorEnum(rawValue: color!)!))!
    }
    static func getUIColor(color: ColorEnum)->UIColor{
        switch color {
        case ColorEnum.Snow:return UIColor(red:255,green: 250,blue: 250, alpha:1.0)
        case ColorEnum.GhostWhite:return UIColor(red:248,green: 248,blue: 255, alpha:1.0)
        case ColorEnum.WhiteSmoke:return UIColor(red:245,green: 245,blue: 245, alpha:1.0)
        case ColorEnum.Gainsboro:return UIColor(red:220,green: 220,blue: 220, alpha:1.0)
        case ColorEnum.FloralWhite:return UIColor(red:255,green: 250,blue: 240, alpha:1.0)
        case ColorEnum.OldLace:return UIColor(red:253,green: 245,blue: 230, alpha:1.0)
        case ColorEnum.Linen:return UIColor(red:250,green: 240,blue: 230, alpha:1.0)
        case ColorEnum.AntiqueWhite:return UIColor(red:250,green: 235,blue: 215, alpha:1.0)
        case ColorEnum.PapayaWhip:return UIColor(red:255,green: 239,blue: 213, alpha:1.0)
        case ColorEnum.BlanchedAlmond:return UIColor(red:255,green: 235,blue: 205, alpha:1.0)
        case ColorEnum.Bisque:return UIColor(red:255,green: 228,blue: 196, alpha:1.0)
        case ColorEnum.PeachPuff:return UIColor(red:255,green: 218,blue: 185, alpha:1.0)
        case ColorEnum.NavajoWhite:return UIColor(red:255,green: 222,blue: 173, alpha:1.0)
        case ColorEnum.Moccasin:return UIColor(red:255,green: 228,blue: 181, alpha:1.0)
        case ColorEnum.Cornsilk:return UIColor(red:255,green: 248,blue: 220, alpha:1.0)
        case ColorEnum.Ivory:return UIColor(red:255,green: 255,blue: 240, alpha:1.0)
        case ColorEnum.LemonChiffon:return UIColor(red:255,green: 250,blue: 205, alpha:1.0)
        case ColorEnum.Seashell:return UIColor(red:255,green: 245,blue: 238, alpha:1.0)
        case ColorEnum.Honeydew:return UIColor(red:240,green: 255,blue: 240, alpha:1.0)
        case ColorEnum.MintCream:return UIColor(red:245,green: 255,blue: 250, alpha:1.0)
        case ColorEnum.Azure:return UIColor(red:240,green: 255,blue: 255, alpha:1.0)
        case ColorEnum.AliceBlue:return UIColor(red:240,green: 248,blue: 255, alpha:1.0)
        case ColorEnum.lavender:return UIColor(red:230,green: 230,blue: 250, alpha:1.0)
        case ColorEnum.LavenderBlush:return UIColor(red:255,green: 240,blue: 245, alpha:1.0)
        case ColorEnum.MistyRose:return UIColor(red:255,green: 228,blue: 225, alpha:1.0)
        case ColorEnum.White:return UIColor(red:255,green: 255,blue: 255, alpha:1.0)
        case ColorEnum.Black:return UIColor(red:0,green: 0,blue: 0, alpha:1.0)
        case ColorEnum.DarkSlateGray:return UIColor(red:47,green: 79,blue: 79, alpha:1.0)
        case ColorEnum.DimGrey:return UIColor(red:105,green: 105,blue: 105, alpha:1.0)
        case ColorEnum.SlateGrey:return UIColor(red:112,green: 128,blue: 144, alpha:1.0)
        case ColorEnum.LightSlateGray:return UIColor(red:119,green: 136,blue: 153, alpha:1.0)
        case ColorEnum.Grey:return UIColor(red:190,green: 190,blue: 190, alpha:1.0)
        case ColorEnum.LightGray:return UIColor(red:211,green: 211,blue: 211, alpha:1.0)
        case ColorEnum.MidnightBlue:return UIColor(red:25,green: 25,blue: 112, alpha:1.0)
        case ColorEnum.NavyBlue:return UIColor(red:0,green: 0,blue: 128, alpha:1.0)
        case ColorEnum.CornflowerBlue:return UIColor(red:100,green: 149,blue: 237, alpha:1.0)
        case ColorEnum.DarkSlateBlue:return UIColor(red:72,green: 61,blue: 139, alpha:1.0)
        case ColorEnum.SlateBlue:return UIColor(red:106,green: 90,blue: 205, alpha:1.0)
        case ColorEnum.MediumSlateBlue:return UIColor(red:123,green: 104,blue: 238, alpha:1.0)
        case ColorEnum.LightSlateBlue:return UIColor(red:132,green: 112,blue: 255, alpha:1.0)
        case ColorEnum.MediumBlue:return UIColor(red:0,green: 0,blue: 205, alpha:1.0)
        case ColorEnum.RoyalBlue:return UIColor(red:65,green: 105,blue: 225, alpha:1.0)
        case ColorEnum.Blue:return UIColor(red:0,green: 0,blue: 255, alpha:1.0)
        case ColorEnum.DodgerBlue:return UIColor(red:30,green: 144,blue: 255, alpha:1.0)
        case ColorEnum.DeepSkyBlue:return UIColor(red:0,green: 191,blue: 255, alpha:1.0)
        case ColorEnum.SkyBlue:return UIColor(red:135,green: 206,blue: 235, alpha:1.0)
        case ColorEnum.LightSkyBlue:return UIColor(red:135,green: 206,blue: 250, alpha:1.0)
        case ColorEnum.SteelBlue:return UIColor(red:70,green: 130,blue: 180, alpha:1.0)
        case ColorEnum.LightSteelBlue:return UIColor(red:176,green: 196,blue: 222, alpha:1.0)
        case ColorEnum.LightBlue:return UIColor(red:173,green: 216,blue: 230, alpha:1.0)
        case ColorEnum.PowderBlue:return UIColor(red:176,green: 224,blue: 230, alpha:1.0)
        case ColorEnum.PaleTurquoise:return UIColor(red:175,green: 238,blue: 238, alpha:1.0)
        case ColorEnum.DarkTurquoise:return UIColor(red:0,green: 206,blue: 209, alpha:1.0)
        case ColorEnum.MediumTurquoise:return UIColor(red:72,green: 209,blue: 204, alpha:1.0)
        case ColorEnum.Turquoise:return UIColor(red:64,green: 224,blue: 208, alpha:1.0)
        case ColorEnum.Cyan:return UIColor(red:0,green: 255,blue: 255, alpha:1.0)
        case ColorEnum.LightCyan:return UIColor(red:224,green: 255,blue: 255, alpha:1.0)
        case ColorEnum.CadetBlue:return UIColor(red:95,green: 158,blue: 160, alpha:1.0)
        case ColorEnum.MediumAquamarine:return UIColor(red:102,green: 205,blue: 170, alpha:1.0)
        case ColorEnum.Aquamarine:return UIColor(red:127,green: 255,blue: 212, alpha:1.0)
        case ColorEnum.DarkGreen:return UIColor(red:0,green: 100,blue: 0, alpha:1.0)
        case ColorEnum.DarkOliveGreen:return UIColor(red:85,green: 107,blue: 47, alpha:1.0)
        case ColorEnum.DarkSeaGreen:return UIColor(red:143,green: 188,blue: 143, alpha:1.0)
        case ColorEnum.SeaGreen:return UIColor(red:46,green: 139,blue: 87, alpha:1.0)
        case ColorEnum.MediumSeaGreen:return UIColor(red:60,green: 179,blue: 113, alpha:1.0)
        case ColorEnum.LightSeaGreen:return UIColor(red:32,green: 178,blue: 170, alpha:1.0)
        case ColorEnum.PaleGreen:return UIColor(red:152,green: 251,blue: 152, alpha:1.0)
        case ColorEnum.SpringGreen:return UIColor(red:0,green: 255,blue: 127, alpha:1.0)
        case ColorEnum.LawnGreen:return UIColor(red:124,green: 252,blue: 0, alpha:1.0)
        case ColorEnum.Green:return UIColor(red:0,green: 255,blue: 0, alpha:1.0)
        case ColorEnum.Chartreuse:return UIColor(red:127,green: 255,blue: 0, alpha:1.0)
        case ColorEnum.MedSpringGreen:return UIColor(red:0,green: 250,blue: 154, alpha:1.0)
        case ColorEnum.GreenYellow:return UIColor(red:173,green: 255,blue: 47, alpha:1.0)
        case ColorEnum.LimeGreen:return UIColor(red:50,green: 205,blue: 50, alpha:1.0)
        case ColorEnum.YellowGreen:return UIColor(red:154,green: 205,blue: 50, alpha:1.0)
        case ColorEnum.ForestGreen:return UIColor(red:34,green: 139,blue: 34, alpha:1.0)
        case ColorEnum.OliveDrab:return UIColor(red:107,green: 142,blue: 35, alpha:1.0)
        case ColorEnum.DarkKhaki:return UIColor(red:189,green: 183,blue: 107, alpha:1.0)
        case ColorEnum.PaleGoldenrod:return UIColor(red:238,green: 232,blue: 170, alpha:1.0)
        case ColorEnum.LtGoldenrodYello:return UIColor(red:250,green: 250,blue: 210, alpha:1.0)
        case ColorEnum.LightYellow:return UIColor(red:255,green: 255,blue: 224, alpha:1.0)
        case ColorEnum.Yellow:return UIColor(red:255,green: 255,blue: 0, alpha:1.0)
        case ColorEnum.Gold:return UIColor(red:255,green: 215,blue: 0, alpha:1.0)
        case ColorEnum.LightGoldenrod:return UIColor(red:238,green: 221,blue: 130, alpha:1.0)
        case ColorEnum.goldenrod:return UIColor(red:218,green: 165,blue: 32, alpha:1.0)
        case ColorEnum.DarkGoldenrod:return UIColor(red:184,green: 134,blue: 11, alpha:1.0)
        case ColorEnum.RosyBrown:return UIColor(red:188,green: 143,blue: 143, alpha:1.0)
        case ColorEnum.IndianRed:return UIColor(red:205,green: 92,blue: 92, alpha:1.0)
        case ColorEnum.SaddleBrown:return UIColor(red:139,green: 69,blue: 19, alpha:1.0)
        case ColorEnum.Sienna:return UIColor(red:160,green: 82,blue: 45, alpha:1.0)
        case ColorEnum.Peru:return UIColor(red:205,green: 133,blue: 63, alpha:1.0)
        case ColorEnum.Burlywood:return UIColor(red:222,green: 184,blue: 135, alpha:1.0)
        case ColorEnum.Beige:return UIColor(red:245,green: 245,blue: 220, alpha:1.0)
        case ColorEnum.Wheat:return UIColor(red:245,green: 222,blue: 179, alpha:1.0)
        case ColorEnum.SandyBrown:return UIColor(red:244,green: 164,blue: 96, alpha:1.0)
        case ColorEnum.Tan:return UIColor(red:210,green: 180,blue: 140, alpha:1.0)
        case ColorEnum.Chocolate:return UIColor(red:210,green: 105,blue: 30, alpha:1.0)
        case ColorEnum.Firebrick:return UIColor(red:178,green: 34,blue: 34, alpha:1.0)
        case ColorEnum.Brown:return UIColor(red:165,green: 42,blue: 42, alpha:1.0)
        case ColorEnum.DarkSalmon:return UIColor(red:233,green: 150,blue: 122, alpha:1.0)
        case ColorEnum.Salmon:return UIColor(red:250,green: 128,blue: 114, alpha:1.0)
        case ColorEnum.LightSalmon:return UIColor(red:255,green: 160,blue: 122, alpha:1.0)
        case ColorEnum.Orange:return UIColor(red:255,green: 165,blue: 0, alpha:1.0)
        case ColorEnum.DarkOrange:return UIColor(red:255,green: 140,blue: 0, alpha:1.0)
        case ColorEnum.Coral:return UIColor(red:255,green: 127,blue: 80, alpha:1.0)
        case ColorEnum.LightCoral:return UIColor(red:240,green: 128,blue: 128, alpha:1.0)
        case ColorEnum.Tomato:return UIColor(red:255,green: 99,blue: 71, alpha:1.0)
        case ColorEnum.OrangeRed:return UIColor(red:255,green: 69,blue: 0, alpha:1.0)
        case ColorEnum.Red:return UIColor(red:255,green: 0,blue: 0, alpha:1.0)
        case ColorEnum.HotPink:return UIColor(red:255,green: 105,blue: 180, alpha:1.0)
        case ColorEnum.DeepPink:return UIColor(red:255,green: 20,blue: 147, alpha:1.0)
        case ColorEnum.Pink:
            return UIColor(red:255,green: 192,blue: 203, alpha:1.0)
        case ColorEnum.LightPink:return UIColor(red:255,green: 182,blue: 193, alpha:1.0)
        case ColorEnum.PaleVioletRed:return UIColor(red:219,green: 112,blue: 147, alpha:1.0)
        case ColorEnum.Maroon:return UIColor(red:176,green: 48,blue: 96, alpha:1.0)
        case ColorEnum.MediumVioletRed:return UIColor(red:199,green: 21,blue: 133, alpha:1.0)
        case ColorEnum.VioletRed:return UIColor(red:208,green: 32,blue: 144, alpha:1.0)
        case ColorEnum.Magenta:return UIColor(red:255,green: 0,blue: 255, alpha:1.0)
        case ColorEnum.Violet:return UIColor(red:238,green: 130,blue: 238, alpha:1.0)
        case ColorEnum.Plum:return UIColor(red:221,green: 160,blue: 221, alpha:1.0)
        case ColorEnum.Orchid:return UIColor(red:218,green: 112,blue: 214, alpha:1.0)
        case ColorEnum.MediumOrchid:return UIColor(red:186,green: 85,blue: 211, alpha:1.0)
        case ColorEnum.DarkOrchid:return UIColor(red:153,green: 50,blue: 204, alpha:1.0)
        case ColorEnum.DarkViolet:return UIColor(red:148,green: 0,blue: 211, alpha:1.0)
        case ColorEnum.BlueViolet:return UIColor(red:138,green: 43,blue: 226, alpha:1.0)
        case ColorEnum.Purple:return UIColor(red:160,green: 32,blue: 240, alpha:1.0)
        case ColorEnum.MediumPurple:return UIColor(red:147,green: 112,blue: 219, alpha:1.0)
        case ColorEnum.Thistle:return UIColor(red:216,green: 191,blue: 216, alpha:1.0)
        case ColorEnum.Snow1:return UIColor(red:255,green: 250,blue: 250, alpha:1.0)
        case ColorEnum.Snow2:return UIColor(red:238,green: 233,blue: 233, alpha:1.0)
        case ColorEnum.Snow3:return UIColor(red:205,green: 201,blue: 201, alpha:1.0)
        case ColorEnum.Snow4:return UIColor(red:139,green: 137,blue: 137, alpha:1.0)
        case ColorEnum.Seashell1:return UIColor(red:255,green: 245,blue: 238, alpha:1.0)
        case ColorEnum.Seashell2:return UIColor(red:238,green: 229,blue: 222, alpha:1.0)
        case ColorEnum.Seashell3:return UIColor(red:205,green: 197,blue: 191, alpha:1.0)
        case ColorEnum.Seashell4:return UIColor(red:139,green: 134,blue: 130, alpha:1.0)
        case ColorEnum.AntiqueWhite1:return UIColor(red:255,green: 239,blue: 219, alpha:1.0)
        case ColorEnum.AntiqueWhite2:return UIColor(red:238,green: 223,blue: 204, alpha:1.0)
        case ColorEnum.AntiqueWhite3:return UIColor(red:205,green: 192,blue: 176, alpha:1.0)
        case ColorEnum.AntiqueWhite4:return UIColor(red:139,green: 131,blue: 120, alpha:1.0)
        case ColorEnum.Bisque1:return UIColor(red:255,green: 228,blue: 196, alpha:1.0)
        case ColorEnum.Bisque2:return UIColor(red:238,green: 213,blue: 183, alpha:1.0)
        case ColorEnum.Bisque3:return UIColor(red:205,green: 183,blue: 158, alpha:1.0)
        case ColorEnum.Bisque4:return UIColor(red:139,green: 125,blue: 107, alpha:1.0)
        case ColorEnum.PeachPuff1:return UIColor(red:255,green: 218,blue: 185, alpha:1.0)
        case ColorEnum.PeachPuff2:return UIColor(red:238,green: 203,blue: 173, alpha:1.0)
        case ColorEnum.PeachPuff3:return UIColor(red:205,green: 175,blue: 149, alpha:1.0)
        case ColorEnum.PeachPuff4:return UIColor(red:139,green: 119,blue: 101, alpha:1.0)
        case ColorEnum.NavajoWhite1:return UIColor(red:255,green: 222,blue: 173, alpha:1.0)
        case ColorEnum.NavajoWhite2:return UIColor(red:238,green: 207,blue: 161, alpha:1.0)
        case ColorEnum.NavajoWhite3:return UIColor(red:205,green: 179,blue: 139, alpha:1.0)
        case ColorEnum.NavajoWhite4:return UIColor(red:139,green: 121,blue: 94, alpha:1.0)
        case ColorEnum.LemonChiffon1:return UIColor(red:255,green: 250,blue: 205, alpha:1.0)
        case ColorEnum.LemonChiffon2:return UIColor(red:238,green: 233,blue: 191, alpha:1.0)
        case ColorEnum.LemonChiffon3:return UIColor(red:205,green: 201,blue: 165, alpha:1.0)
        case ColorEnum.LemonChiffon4:return UIColor(red:139,green: 137,blue: 112, alpha:1.0)
        case ColorEnum.Cornsilk1:return UIColor(red:255,green: 248,blue: 220, alpha:1.0)
        case ColorEnum.Cornsilk2:return UIColor(red:238,green: 232,blue: 205, alpha:1.0)
        case ColorEnum.Cornsilk3:return UIColor(red:205,green: 200,blue: 177, alpha:1.0)
        case ColorEnum.Cornsilk4:return UIColor(red:139,green: 136,blue: 120, alpha:1.0)
        case ColorEnum.Ivory1:return UIColor(red:255,green: 255,blue: 240, alpha:1.0)
        case ColorEnum.Ivory2:return UIColor(red:238,green: 238,blue: 224, alpha:1.0)
        case ColorEnum.Ivory3:return UIColor(red:205,green: 205,blue: 193, alpha:1.0)
        case ColorEnum.Ivory4:return UIColor(red:139,green: 139,blue: 131, alpha:1.0)
        case ColorEnum.Honeydew1:return UIColor(red:240,green: 255,blue: 240, alpha:1.0)
        case ColorEnum.Honeydew2:return UIColor(red:224,green: 238,blue: 224, alpha:1.0)
        case ColorEnum.Honeydew3:return UIColor(red:193,green: 205,blue: 193, alpha:1.0)
        case ColorEnum.Honeydew4:return UIColor(red:131,green: 139,blue: 131, alpha:1.0)
        case ColorEnum.LavenderBlush1:return UIColor(red:255,green: 240,blue: 245, alpha:1.0)
        case ColorEnum.LavenderBlush2:return UIColor(red:238,green: 224,blue: 229, alpha:1.0)
        case ColorEnum.LavenderBlush3:return UIColor(red:205,green: 193,blue: 197, alpha:1.0)
        case ColorEnum.LavenderBlush4:return UIColor(red:139,green: 131,blue: 134, alpha:1.0)
        case ColorEnum.MistyRose1:return UIColor(red:255,green: 228,blue: 225, alpha:1.0)
        case ColorEnum.MistyRose2:return UIColor(red:238,green: 213,blue: 210, alpha:1.0)
        case ColorEnum.MistyRose3:return UIColor(red:205,green: 183,blue: 181, alpha:1.0)
        case ColorEnum.MistyRose4:return UIColor(red:139,green: 125,blue: 123, alpha:1.0)
        case ColorEnum.Azure1:return UIColor(red:240,green: 255,blue: 255, alpha:1.0)
        case ColorEnum.Azure2:return UIColor(red:224,green: 238,blue: 238, alpha:1.0)
        case ColorEnum.Azure3:return UIColor(red:193,green: 205,blue: 205, alpha:1.0)
        case ColorEnum.Azure4:return UIColor(red:131,green: 139,blue: 139, alpha:1.0)
        case ColorEnum.SlateBlue1:return UIColor(red:131,green: 111,blue: 255, alpha:1.0)
        case ColorEnum.SlateBlue2:return UIColor(red:122,green: 103,blue: 238, alpha:1.0)
        case ColorEnum.SlateBlue3:return UIColor(red:105,green: 89,blue: 205, alpha:1.0)
        case ColorEnum.SlateBlue4:return UIColor(red:71,green: 60,blue: 139, alpha:1.0)
        case ColorEnum.RoyalBlue1:return UIColor(red:72,green: 118,blue: 255, alpha:1.0)
        case ColorEnum.RoyalBlue2:return UIColor(red:67,green: 110,blue: 238, alpha:1.0)
        case ColorEnum.RoyalBlue3:return UIColor(red:58,green: 95,blue: 205, alpha:1.0)
        case ColorEnum.RoyalBlue4:return UIColor(red:39,green: 64,blue: 139, alpha:1.0)
        case ColorEnum.Blue1:return UIColor(red:0,green: 0,blue: 255, alpha:1.0)
        case ColorEnum.Blue2:return UIColor(red:0,green: 0,blue: 238, alpha:1.0)
        case ColorEnum.Blue3:return UIColor(red:0,green: 0,blue: 205, alpha:1.0)
        case ColorEnum.Blue4:return UIColor(red:0,green: 0,blue: 139, alpha:1.0)
        case ColorEnum.DodgerBlue1:return UIColor(red:30,green: 144,blue: 255, alpha:1.0)
        case ColorEnum.DodgerBlue2:return UIColor(red:28,green: 134,blue: 238, alpha:1.0)
        case ColorEnum.DodgerBlue3:return UIColor(red:24,green: 116,blue: 205, alpha:1.0)
        case ColorEnum.DodgerBlue4:return UIColor(red:16,green: 78,blue: 139, alpha:1.0)
        case ColorEnum.SteelBlue1:return UIColor(red:99,green: 184,blue: 255, alpha:1.0)
        case ColorEnum.SteelBlue2:return UIColor(red:92,green: 172,blue: 238, alpha:1.0)
        case ColorEnum.SteelBlue3:return UIColor(red:79,green: 148,blue: 205, alpha:1.0)
        case ColorEnum.SteelBlue4:return UIColor(red:54,green: 100,blue: 139, alpha:1.0)
        case ColorEnum.DeepSkyBlue1:return UIColor(red:0,green: 191,blue: 255, alpha:1.0)
        case ColorEnum.DeepSkyBlue2:return UIColor(red:0,green: 178,blue: 238, alpha:1.0)
        case ColorEnum.DeepSkyBlue3:return UIColor(red:0,green: 154,blue: 205, alpha:1.0)
        case ColorEnum.DeepSkyBlue4:return UIColor(red:0,green: 104,blue: 139, alpha:1.0)
        case ColorEnum.SkyBlue1:return UIColor(red:135,green: 206,blue: 255, alpha:1.0)
        case ColorEnum.SkyBlue2:return UIColor(red:126,green: 192,blue: 238, alpha:1.0)
        case ColorEnum.SkyBlue3:return UIColor(red:108,green: 166,blue: 205, alpha:1.0)
        case ColorEnum.SkyBlue4:return UIColor(red:74,green: 112,blue: 139, alpha:1.0)
        case ColorEnum.LightSkyBlue1:return UIColor(red:176,green: 226,blue: 255, alpha:1.0)
        case ColorEnum.LightSkyBlue2:return UIColor(red:164,green: 211,blue: 238, alpha:1.0)
        case ColorEnum.LightSkyBlue3:return UIColor(red:141,green: 182,blue: 205, alpha:1.0)
        case ColorEnum.LightSkyBlue4:return UIColor(red:96,green: 123,blue: 139, alpha:1.0)
        case ColorEnum.SlateGray1:return UIColor(red:198,green: 226,blue: 255, alpha:1.0)
        case ColorEnum.SlateGray2:return UIColor(red:185,green: 211,blue: 238, alpha:1.0)
        case ColorEnum.SlateGray3:return UIColor(red:159,green: 182,blue: 205, alpha:1.0)
        case ColorEnum.SlateGray4:return UIColor(red:108,green: 123,blue: 139, alpha:1.0)
        case ColorEnum.LightSteelBlue1:return UIColor(red:202,green: 225,blue: 255, alpha:1.0)
        case ColorEnum.LightSteelBlue2:return UIColor(red:188,green: 210,blue: 238, alpha:1.0)
        case ColorEnum.LightSteelBlue3:return UIColor(red:162,green: 181,blue: 205, alpha:1.0)
        case ColorEnum.LightSteelBlue4:return UIColor(red:110,green: 123,blue: 139, alpha:1.0)
        case ColorEnum.LightBlue1:return UIColor(red:191,green: 239,blue: 255, alpha:1.0)
        case ColorEnum.LightBlue2:return UIColor(red:178,green: 223,blue: 238, alpha:1.0)
        case ColorEnum.LightBlue3:return UIColor(red:154,green: 192,blue: 205, alpha:1.0)
        case ColorEnum.LightBlue4:return UIColor(red:104,green: 131,blue: 139, alpha:1.0)
        case ColorEnum.LightCyan1:return UIColor(red:224,green: 255,blue: 255, alpha:1.0)
        case ColorEnum.LightCyan2:return UIColor(red:209,green: 238,blue: 238, alpha:1.0)
        case ColorEnum.LightCyan3:return UIColor(red:180,green: 205,blue: 205, alpha:1.0)
        case ColorEnum.LightCyan4:return UIColor(red:122,green: 139,blue: 139, alpha:1.0)
        case ColorEnum.PaleTurquoise1:return UIColor(red:187,green: 255,blue: 255, alpha:1.0)
        case ColorEnum.PaleTurquoise2:return UIColor(red:174,green: 238,blue: 238, alpha:1.0)
        case ColorEnum.PaleTurquoise3:return UIColor(red:150,green: 205,blue: 205, alpha:1.0)
        case ColorEnum.PaleTurquoise4:return UIColor(red:102,green: 139,blue: 139, alpha:1.0)
        case ColorEnum.CadetBlue1:return UIColor(red:152,green: 245,blue: 255, alpha:1.0)
        case ColorEnum.CadetBlue2:return UIColor(red:142,green: 229,blue: 238, alpha:1.0)
        case ColorEnum.CadetBlue3:return UIColor(red:122,green: 197,blue: 205, alpha:1.0)
        case ColorEnum.CadetBlue4:return UIColor(red:83,green: 134,blue: 139, alpha:1.0)
        case ColorEnum.Turquoise1:return UIColor(red:0,green: 245,blue: 255, alpha:1.0)
        case ColorEnum.Turquoise2:return UIColor(red:0,green: 229,blue: 238, alpha:1.0)
        case ColorEnum.Turquoise3:return UIColor(red:0,green: 197,blue: 205, alpha:1.0)
        case ColorEnum.Turquoise4:return UIColor(red:0,green: 134,blue: 139, alpha:1.0)
        case ColorEnum.Cyan1:return UIColor(red:0,green: 255,blue: 255, alpha:1.0)
        case ColorEnum.Cyan2:return UIColor(red:0,green: 238,blue: 238, alpha:1.0)
        case ColorEnum.Cyan3:return UIColor(red:0,green: 205,blue: 205, alpha:1.0)
        case ColorEnum.Cyan4:return UIColor(red:0,green: 139,blue: 139, alpha:1.0)
        case ColorEnum.DarkSlateGray1:return UIColor(red:151,green: 255,blue: 255, alpha:1.0)
        case ColorEnum.DarkSlateGray2:return UIColor(red:141,green: 238,blue: 238, alpha:1.0)
        case ColorEnum.DarkSlateGray3:return UIColor(red:121,green: 205,blue: 205, alpha:1.0)
        case ColorEnum.DarkSlateGray4:return UIColor(red:82,green: 139,blue: 139, alpha:1.0)
        case ColorEnum.Aquamarine1:return UIColor(red:127,green: 255,blue: 212, alpha:1.0)
        case ColorEnum.Aquamarine2:return UIColor(red:118,green: 238,blue: 198, alpha:1.0)
        case ColorEnum.Aquamarine3:return UIColor(red:102,green: 205,blue: 170, alpha:1.0)
        case ColorEnum.Aquamarine4:return UIColor(red:69,green: 139,blue: 116, alpha:1.0)
        case ColorEnum.DarkSeaGreen1:return UIColor(red:193,green: 255,blue: 193, alpha:1.0)
        case ColorEnum.DarkSeaGreen2:return UIColor(red:180,green: 238,blue: 180, alpha:1.0)
        case ColorEnum.DarkSeaGreen3:return UIColor(red:155,green: 205,blue: 155, alpha:1.0)
        case ColorEnum.DarkSeaGreen4:return UIColor(red:105,green: 139,blue: 105, alpha:1.0)
        case ColorEnum.SeaGreen1:return UIColor(red:84,green: 255,blue: 159, alpha:1.0)
        case ColorEnum.SeaGreen2:return UIColor(red:78,green: 238,blue: 148, alpha:1.0)
        case ColorEnum.SeaGreen3:return UIColor(red:67,green: 205,blue: 128, alpha:1.0)
        case ColorEnum.SeaGreen4:return UIColor(red:46,green: 139,blue: 87, alpha:1.0)
        case ColorEnum.PaleGreen1:return UIColor(red:154,green: 255,blue: 154, alpha:1.0)
        case ColorEnum.PaleGreen2:return UIColor(red:144,green: 238,blue: 144, alpha:1.0)
        case ColorEnum.PaleGreen3:return UIColor(red:124,green: 205,blue: 124, alpha:1.0)
        case ColorEnum.PaleGreen4:return UIColor(red:84,green: 139,blue: 84, alpha:1.0)
        case ColorEnum.SpringGreen1:return UIColor(red:0,green: 255,blue: 127, alpha:1.0)
        case ColorEnum.SpringGreen2:return UIColor(red:0,green: 238,blue: 118, alpha:1.0)
        case ColorEnum.SpringGreen3:return UIColor(red:0,green: 205,blue: 102, alpha:1.0)
        case ColorEnum.SpringGreen4:return UIColor(red:0,green: 139,blue: 69, alpha:1.0)
        case ColorEnum.Green1:return UIColor(red:0,green: 255,blue: 0, alpha:1.0)
        case ColorEnum.Green2:return UIColor(red:0,green: 238,blue: 0, alpha:1.0)
        case ColorEnum.Green3:return UIColor(red:0,green: 205,blue: 0, alpha:1.0)
        case ColorEnum.Green4:return UIColor(red:0,green: 139,blue: 0, alpha:1.0)
        case ColorEnum.Chartreuse1:return UIColor(red:127,green: 255,blue: 0, alpha:1.0)
        case ColorEnum.Chartreuse2:return UIColor(red:118,green: 238,blue: 0, alpha:1.0)
        case ColorEnum.Chartreuse3:return UIColor(red:102,green: 205,blue: 0, alpha:1.0)
        case ColorEnum.Chartreuse4:return UIColor(red:69,green: 139,blue: 0, alpha:1.0)
        case ColorEnum.OliveDrab1:return UIColor(red:192,green: 255,blue: 62, alpha:1.0)
        case ColorEnum.OliveDrab2:return UIColor(red:179,green: 238,blue: 58, alpha:1.0)
        case ColorEnum.OliveDrab3:return UIColor(red:154,green: 205,blue: 50, alpha:1.0)
        case ColorEnum.OliveDrab4:return UIColor(red:105,green: 139,blue: 34, alpha:1.0)
        case ColorEnum.DarkOliveGreen1:return UIColor(red:202,green: 255,blue: 112, alpha:1.0)
        case ColorEnum.DarkOliveGreen2:return UIColor(red:188,green: 238,blue: 104, alpha:1.0)
        case ColorEnum.DarkOliveGreen3:return UIColor(red:162,green: 205,blue: 90, alpha:1.0)
        case ColorEnum.DarkOliveGreen4:return UIColor(red:110,green: 139,blue: 61, alpha:1.0)
        case ColorEnum.Khaki1:return UIColor(red:255,green: 246,blue: 143, alpha:1.0)
        case ColorEnum.Khaki2:return UIColor(red:238,green: 230,blue: 133, alpha:1.0)
        case ColorEnum.Khaki3:return UIColor(red:205,green: 198,blue: 115, alpha:1.0)
        case ColorEnum.Khaki4:return UIColor(red:139,green: 134,blue: 78, alpha:1.0)
        case ColorEnum.LightGoldenrod1:return UIColor(red:255,green: 236,blue: 139, alpha:1.0)
        case ColorEnum.LightGoldenrod2:return UIColor(red:238,green: 220,blue: 130, alpha:1.0)
        case ColorEnum.LightGoldenrod3:return UIColor(red:205,green: 190,blue: 112, alpha:1.0)
        case ColorEnum.LightGoldenrod4:return UIColor(red:139,green: 129,blue: 76, alpha:1.0)
        case ColorEnum.LightYellow1:return UIColor(red:255,green: 255,blue: 224, alpha:1.0)
        case ColorEnum.LightYellow2:return UIColor(red:238,green: 238,blue: 209, alpha:1.0)
        case ColorEnum.LightYellow3:return UIColor(red:205,green: 205,blue: 180, alpha:1.0)
        case ColorEnum.LightYellow4:return UIColor(red:139,green: 139,blue: 122, alpha:1.0)
        case ColorEnum.Yellow1:return UIColor(red:255,green: 255,blue: 0, alpha:1.0)
        case ColorEnum.Yellow2:return UIColor(red:238,green: 238,blue: 0, alpha:1.0)
        case ColorEnum.Yellow3:return UIColor(red:205,green: 205,blue: 0, alpha:1.0)
        case ColorEnum.Yellow4:return UIColor(red:139,green: 139,blue: 0, alpha:1.0)
        case ColorEnum.Gold1:return UIColor(red:255,green: 215,blue: 0, alpha:1.0)
        case ColorEnum.Gold2:return UIColor(red:238,green: 201,blue: 0, alpha:1.0)
        case ColorEnum.Gold3:return UIColor(red:205,green: 173,blue: 0, alpha:1.0)
        case ColorEnum.Gold4:return UIColor(red:139,green: 117,blue: 0, alpha:1.0)
        case ColorEnum.Goldenrod1:return UIColor(red:255,green: 193,blue: 37, alpha:1.0)
        case ColorEnum.Goldenrod2:return UIColor(red:238,green: 180,blue: 34, alpha:1.0)
        case ColorEnum.Goldenrod3:return UIColor(red:205,green: 155,blue: 29, alpha:1.0)
        case ColorEnum.Goldenrod4:return UIColor(red:139,green: 105,blue: 20, alpha:1.0)
        case ColorEnum.DarkGoldenrod1:return UIColor(red:255,green: 185,blue: 15, alpha:1.0)
        case ColorEnum.DarkGoldenrod2:return UIColor(red:238,green: 173,blue: 14, alpha:1.0)
        case ColorEnum.DarkGoldenrod3:return UIColor(red:205,green: 149,blue: 12, alpha:1.0)
        case ColorEnum.DarkGoldenrod4:return UIColor(red:139,green: 101,blue: 8, alpha:1.0)
        case ColorEnum.RosyBrown1:return UIColor(red:255,green: 193,blue: 193, alpha:1.0)
        case ColorEnum.RosyBrown2:return UIColor(red:238,green: 180,blue: 180, alpha:1.0)
        case ColorEnum.RosyBrown3:return UIColor(red:205,green: 155,blue: 155, alpha:1.0)
        case ColorEnum.RosyBrown4:return UIColor(red:139,green: 105,blue: 105, alpha:1.0)
        case ColorEnum.IndianRed1:return UIColor(red:255,green: 106,blue: 106, alpha:1.0)
        case ColorEnum.IndianRed2:return UIColor(red:238,green: 99,blue: 99, alpha:1.0)
        case ColorEnum.IndianRed3:return UIColor(red:205,green: 85,blue: 85, alpha:1.0)
        case ColorEnum.IndianRed4:return UIColor(red:139,green: 58,blue: 58, alpha:1.0)
        case ColorEnum.Sienna1:return UIColor(red:255,green: 130,blue: 71, alpha:1.0)
        case ColorEnum.Sienna2:return UIColor(red:238,green: 121,blue: 66, alpha:1.0)
        case ColorEnum.Sienna3:return UIColor(red:205,green: 104,blue: 57, alpha:1.0)
        case ColorEnum.Sienna4:return UIColor(red:139,green: 71,blue: 38, alpha:1.0)
        case ColorEnum.Burlywood1:return UIColor(red:255,green: 211,blue: 155, alpha:1.0)
        case ColorEnum.Burlywood2:return UIColor(red:238,green: 197,blue: 145, alpha:1.0)
        case ColorEnum.Burlywood3:return UIColor(red:205,green: 170,blue: 125, alpha:1.0)
        case ColorEnum.Burlywood4:return UIColor(red:139,green: 115,blue: 85, alpha:1.0)
        case ColorEnum.Wheat1:return UIColor(red:255,green: 231,blue: 186, alpha:1.0)
        case ColorEnum.Wheat2:return UIColor(red:238,green: 216,blue: 174, alpha:1.0)
        case ColorEnum.Wheat3:return UIColor(red:205,green: 186,blue: 150, alpha:1.0)
        case ColorEnum.Wheat4:return UIColor(red:139,green: 126,blue: 102, alpha:1.0)
        case ColorEnum.Tan1:return UIColor(red:255,green: 165,blue: 79, alpha:1.0)
        case ColorEnum.Tan2:return UIColor(red:238,green: 154,blue: 73, alpha:1.0)
        case ColorEnum.Tan3:return UIColor(red:205,green: 133,blue: 63, alpha:1.0)
        case ColorEnum.Tan4:return UIColor(red:139,green: 90,blue: 43, alpha:1.0)
        case ColorEnum.Chocolate1:return UIColor(red:255,green: 127,blue: 36, alpha:1.0)
        case ColorEnum.Chocolate2:return UIColor(red:238,green: 118,blue: 33, alpha:1.0)
        case ColorEnum.Chocolate3:return UIColor(red:205,green: 102,blue: 29, alpha:1.0)
        case ColorEnum.Chocolate4:return UIColor(red:139,green: 69,blue: 19, alpha:1.0)
        case ColorEnum.Firebrick1:return UIColor(red:255,green: 48,blue: 48, alpha:1.0)
        case ColorEnum.Firebrick2:return UIColor(red:238,green: 44,blue: 44, alpha:1.0)
        case ColorEnum.Firebrick3:return UIColor(red:205,green: 38,blue: 38, alpha:1.0)
        case ColorEnum.Firebrick4:return UIColor(red:139,green: 26,blue: 26, alpha:1.0)
        case ColorEnum.Brown1:return UIColor(red:255,green: 64,blue: 64, alpha:1.0)
        case ColorEnum.Brown2:return UIColor(red:238,green: 59,blue: 59, alpha:1.0)
        case ColorEnum.Brown3:return UIColor(red:205,green: 51,blue: 51, alpha:1.0)
        case ColorEnum.Brown4:return UIColor(red:139,green: 35,blue: 35, alpha:1.0)
        case ColorEnum.Salmon1:return UIColor(red:255,green: 140,blue: 105, alpha:1.0)
        case ColorEnum.Salmon2:return UIColor(red:238,green: 130,blue: 98, alpha:1.0)
        case ColorEnum.Salmon3:return UIColor(red:205,green: 112,blue: 84, alpha:1.0)
        case ColorEnum.Salmon4:return UIColor(red:139,green: 76,blue: 57, alpha:1.0)
        case ColorEnum.LightSalmon1:return UIColor(red:255,green: 160,blue: 122, alpha:1.0)
        case ColorEnum.LightSalmon2:return UIColor(red:238,green: 149,blue: 114, alpha:1.0)
        case ColorEnum.LightSalmon3:return UIColor(red:205,green: 129,blue: 98, alpha:1.0)
        case ColorEnum.LightSalmon4:return UIColor(red:139,green: 87,blue: 66, alpha:1.0)
        case ColorEnum.Orange1:return UIColor(red:255,green: 165,blue: 0, alpha:1.0)
        case ColorEnum.Orange2:return UIColor(red:238,green: 154,blue: 0, alpha:1.0)
        case ColorEnum.Orange3:return UIColor(red:205,green: 133,blue: 0, alpha:1.0)
        case ColorEnum.Orange4:return UIColor(red:139,green: 90,blue: 0, alpha:1.0)
        case ColorEnum.DarkOrange1:return UIColor(red:255,green: 127,blue: 0, alpha:1.0)
        case ColorEnum.DarkOrange2:return UIColor(red:238,green: 118,blue: 0, alpha:1.0)
        case ColorEnum.DarkOrange3:return UIColor(red:205,green: 102,blue: 0, alpha:1.0)
        case ColorEnum.DarkOrange4:return UIColor(red:139,green: 69,blue: 0, alpha:1.0)
        case ColorEnum.Coral1:return UIColor(red:255,green: 114,blue: 86, alpha:1.0)
        case ColorEnum.Coral2:return UIColor(red:238,green: 106,blue: 80, alpha:1.0)
        case ColorEnum.Coral3:return UIColor(red:205,green: 91,blue: 69, alpha:1.0)
        case ColorEnum.Coral4:return UIColor(red:139,green: 62,blue: 47, alpha:1.0)
        case ColorEnum.Tomato1:return UIColor(red:255,green: 99,blue: 71, alpha:1.0)
        case ColorEnum.Tomato2:return UIColor(red:238,green: 92,blue: 66, alpha:1.0)
        case ColorEnum.Tomato3:return UIColor(red:205,green: 79,blue: 57, alpha:1.0)
        case ColorEnum.Tomato4:return UIColor(red:139,green: 54,blue: 38, alpha:1.0)
        case ColorEnum.OrangeRed1:return UIColor(red:255,green: 69,blue: 0, alpha:1.0)
        case ColorEnum.OrangeRed2:return UIColor(red:238,green: 64,blue: 0, alpha:1.0)
        case ColorEnum.OrangeRed3:return UIColor(red:205,green: 55,blue: 0, alpha:1.0)
        case ColorEnum.OrangeRed4:return UIColor(red:139,green: 37,blue: 0, alpha:1.0)
        case ColorEnum.Red1:return UIColor(red:255,green: 0,blue: 0, alpha:1.0)
        case ColorEnum.Red2:return UIColor(red:238,green: 0,blue: 0, alpha:1.0)
        case ColorEnum.Red3:return UIColor(red:205,green: 0,blue: 0, alpha:1.0)
        case ColorEnum.Red4:return UIColor(red:139,green: 0,blue: 0, alpha:1.0)
        case ColorEnum.DeepPink1:return UIColor(red:255,green: 20,blue: 147, alpha:1.0)
        case ColorEnum.DeepPink2:return UIColor(red:238,green: 18,blue: 137, alpha:1.0)
        case ColorEnum.DeepPink3:return UIColor(red:205,green: 16,blue: 118, alpha:1.0)
        case ColorEnum.DeepPink4:return UIColor(red:139,green: 10,blue: 80, alpha:1.0)
        case ColorEnum.HotPink1:return UIColor(red:255,green: 110,blue: 180, alpha:1.0)
        case ColorEnum.HotPink2:return UIColor(red:238,green: 106,blue: 167, alpha:1.0)
        case ColorEnum.HotPink3:return UIColor(red:205,green: 96,blue: 144, alpha:1.0)
        case ColorEnum.HotPink4:return UIColor(red:139,green: 58,blue: 98, alpha:1.0)
        case ColorEnum.Pink1:return UIColor(red:255,green: 181,blue: 197, alpha:1.0)
        case ColorEnum.Pink2:return UIColor(red:238,green: 169,blue: 184, alpha:1.0)
        case ColorEnum.Pink3:return UIColor(red:205,green: 145,blue: 158, alpha:1.0)
        case ColorEnum.Pink4:return UIColor(red:139,green: 99,blue: 108, alpha:1.0)
        case ColorEnum.LightPink1:return UIColor(red:255,green: 174,blue: 185, alpha:1.0)
        case ColorEnum.LightPink2:return UIColor(red:238,green: 162,blue: 173, alpha:1.0)
        case ColorEnum.LightPink3:return UIColor(red:205,green: 140,blue: 149, alpha:1.0)
        case ColorEnum.LightPink4:return UIColor(red:139,green: 95,blue: 101, alpha:1.0)
        case ColorEnum.PaleVioletRed1:return UIColor(red:255,green: 130,blue: 171, alpha:1.0)
        case ColorEnum.PaleVioletRed2:return UIColor(red:238,green: 121,blue: 159, alpha:1.0)
        case ColorEnum.PaleVioletRed3:return UIColor(red:205,green: 104,blue: 137, alpha:1.0)
        case ColorEnum.PaleVioletRed4:return UIColor(red:139,green: 71,blue: 93, alpha:1.0)
        case ColorEnum.Maroon1:return UIColor(red:255,green: 52,blue: 179, alpha:1.0)
        case ColorEnum.Maroon2:return UIColor(red:238,green: 48,blue: 167, alpha:1.0)
        case ColorEnum.Maroon3:return UIColor(red:205,green: 41,blue: 144, alpha:1.0)
        case ColorEnum.Maroon4:return UIColor(red:139,green: 28,blue: 98, alpha:1.0)
        case ColorEnum.VioletRed1:return UIColor(red:255,green: 62,blue: 150, alpha:1.0)
        case ColorEnum.VioletRed2:return UIColor(red:238,green: 58,blue: 140, alpha:1.0)
        case ColorEnum.VioletRed3:return UIColor(red:205,green: 50,blue: 120, alpha:1.0)
        case ColorEnum.VioletRed4:return UIColor(red:139,green: 34,blue: 82, alpha:1.0)
        case ColorEnum.Magenta1:return UIColor(red:255,green: 0,blue: 255, alpha:1.0)
        case ColorEnum.Magenta2:return UIColor(red:238,green: 0,blue: 238, alpha:1.0)
        case ColorEnum.Magenta3:return UIColor(red:205,green: 0,blue: 205, alpha:1.0)
        case ColorEnum.Magenta4:return UIColor(red:139,green: 0,blue: 139, alpha:1.0)
        case ColorEnum.Orchid1:return UIColor(red:255,green: 131,blue: 250, alpha:1.0)
        case ColorEnum.Orchid2:return UIColor(red:238,green: 122,blue: 233, alpha:1.0)
        case ColorEnum.Orchid3:return UIColor(red:205,green: 105,blue: 201, alpha:1.0)
        case ColorEnum.Orchid4:return UIColor(red:139,green: 71,blue: 137, alpha:1.0)
        case ColorEnum.Plum1:return UIColor(red:255,green: 187,blue: 255, alpha:1.0)
        case ColorEnum.Plum2:return UIColor(red:238,green: 174,blue: 238, alpha:1.0)
        case ColorEnum.Plum3:return UIColor(red:205,green: 150,blue: 205, alpha:1.0)
        case ColorEnum.Plum4:return UIColor(red:139,green: 102,blue: 139, alpha:1.0)
        case ColorEnum.MediumOrchid1:return UIColor(red:224,green: 102,blue: 255, alpha:1.0)
        case ColorEnum.MediumOrchid2:return UIColor(red:209,green: 95,blue: 238, alpha:1.0)
        case ColorEnum.MediumOrchid3:return UIColor(red:180,green: 82,blue: 205, alpha:1.0)
        case ColorEnum.MediumOrchid4:return UIColor(red:122,green: 55,blue: 139, alpha:1.0)
        case ColorEnum.DarkOrchid1:return UIColor(red:191,green: 62,blue: 255, alpha:1.0)
        case ColorEnum.DarkOrchid2:return UIColor(red:178,green: 58,blue: 238, alpha:1.0)
        case ColorEnum.DarkOrchid3:return UIColor(red:154,green: 50,blue: 205, alpha:1.0)
        case ColorEnum.DarkOrchid4:return UIColor(red:104,green: 34,blue: 139, alpha:1.0)
        case ColorEnum.Purple1:return UIColor(red:155,green: 48,blue: 255, alpha:1.0)
        case ColorEnum.Purple2:return UIColor(red:145,green: 44,blue: 238, alpha:1.0)
        case ColorEnum.Purple3:return UIColor(red:125,green: 38,blue: 205, alpha:1.0)
        case ColorEnum.Purple4:return UIColor(red:85,green: 26,blue: 139, alpha:1.0)
        case ColorEnum.MediumPurple1:return UIColor(red:171,green: 130,blue: 255, alpha:1.0)
        case ColorEnum.MediumPurple2:return UIColor(red:159,green: 121,blue: 238, alpha:1.0)
        case ColorEnum.MediumPurple3:return UIColor(red:137,green: 104,blue: 205, alpha:1.0)
        case ColorEnum.MediumPurple4:return UIColor(red:93,green: 71,blue: 139, alpha:1.0)
        case ColorEnum.Thistle1:return UIColor(red:255,green: 225,blue: 255, alpha:1.0)
        case ColorEnum.Thistle2:return UIColor(red:238,green: 210,blue: 238, alpha:1.0)
        case ColorEnum.Thistle3:return UIColor(red:205,green: 181,blue: 205, alpha:1.0)
        case ColorEnum.Thistle4:return UIColor(red:139,green: 123,blue: 139, alpha:1.0)
        case ColorEnum.grey11:return UIColor(red:28,green: 28,blue: 28, alpha:1.0)
        case ColorEnum.grey21:return UIColor(red:54,green: 54,blue: 54, alpha:1.0)
        case ColorEnum.grey31:return UIColor(red:79,green: 79,blue: 79, alpha:1.0)
        case ColorEnum.grey41:return UIColor(red:105,green: 105,blue: 105, alpha:1.0)
        case ColorEnum.grey51:return UIColor(red:130,green: 130,blue: 130, alpha:1.0)
        case ColorEnum.grey61:return UIColor(red:156,green: 156,blue: 156, alpha:1.0)
        case ColorEnum.grey71:return UIColor(red:181,green: 181,blue: 181, alpha:1.0)
        case ColorEnum.gray81:return UIColor(red:207,green: 207,blue: 207, alpha:1.0)
        case ColorEnum.gray91:return UIColor(red:232,green: 232,blue: 232, alpha:1.0)
        case ColorEnum.DarkGrey:return UIColor(red:169,green: 169,blue: 169, alpha:1.0)
        case ColorEnum.DarkBlue:return UIColor(red:0,green: 0,blue: 139, alpha:1.0)
        case ColorEnum.DarkCyan:return UIColor(red:0,green: 139,blue: 139, alpha:1.0)
        case ColorEnum.DarkMagenta:return UIColor(red:139,green: 0,blue: 139, alpha:1.0)
        case ColorEnum.DarkRed:return UIColor(red:139,green: 0,blue: 0, alpha:1.0)
        case ColorEnum.LightGreen:return UIColor(red:144,green: 238,blue: 144, alpha:1.0)
            //        default:
            //            return UIColor(red:255, green:255, blue: 255, alpha:1.0)
        }
    }
    
}

