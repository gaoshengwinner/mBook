//
//  DocFileManager.swift
//  mBook
//
//  Created by 郑月华 on 2020/07/22.
//  Copyright © 2020 Meal Book corp. All rights reserved.
//
import SwiftUI

public class DocFileManager {
    
    static let SHOP_MENU_INFO_FILE_PATH : NSString = "shop"
    static let SHOP_MENU_INFO_FILE_NAME : NSString = "shop_info_list.json"
    
    static func saveShopInfoToFile(shopID:String, contet: Data)->Void{
        let path : NSString = getDocumentsPath(subpath: (shopID as NSString) .appendingPathComponent(SHOP_MENU_INFO_FILE_PATH as String) as NSString)
        write(path: path , filename: SHOP_MENU_INFO_FILE_NAME as NSString, contet: contet)
    }
    
    static func readShopInfoFromFile(shopID:String)->Data?{
        let path : NSString = getDocumentsPath(subpath: (shopID as NSString) .appendingPathComponent(SHOP_MENU_INFO_FILE_PATH as String) as NSString)
        
        
        let r =  read(path: path, filename: SHOP_MENU_INFO_FILE_NAME as NSString)
        return r
    }
    
    private static func getDocumentsPath(subpath: NSString)->NSString{
        // 1、获得沙盒的根路径
        let home = NSHomeDirectory() as NSString
        // 2、获得Documents路径，使用NSString对象的stringByAppendingPathComponent()方法拼接路径
        let docPath = home.appendingPathComponent("Documents") as NSString
        // 3、获取文本文件路径
        let filePath = docPath.appendingPathComponent(subpath as String) as NSString
        
        let fileManager: FileManager = FileManager.default
        let exist = fileManager.fileExists(atPath: filePath as String)
        if (!exist) {
            
            try! fileManager.createDirectory(atPath: filePath as String,withIntermediateDirectories: true, attributes: nil)
        }
        return filePath
    }
    
    static func write(path: NSString, filename:NSString, contet: Data) -> Void {
        // 4、将数据写入文件中
        let filefullpath = path.appendingPathComponent(filename as String)
        do{
            //try "".write(toFile: path, atomically: true, encoding: String.Encoding.utf8)
            try contet.write(to: URL(fileURLWithPath: filefullpath), options: Data.WritingOptions.atomic)
        } catch {
            print(error)
        }
    }
    
    static func read(path: NSString, filename:NSString) -> Data?{
        let filefullpath = path.appendingPathComponent(filename as String)
        if let nsData = NSData(contentsOf: URL(fileURLWithPath: filefullpath)){
            return nsData as Data
        }
        
        return nil
    }
    
    static func saveWithFile() {
        // 1、获得沙盒的根路径
        let home = NSHomeDirectory() as NSString
        // 2、获得Documents路径，使用NSString对象的stringByAppendingPathComponent()方法拼接路径
        let docPath = home.appendingPathComponent("Documents") as NSString
        // 3、获取文本文件路径
        let filePath = docPath.appendingPathComponent("data.plist")
        let dataSource = NSMutableArray()
        dataSource.add("小桥上我曾背你走过")
        dataSource.add("河边上为你放的烟火")
        dataSource.add("电影院最后一排座我们第一次吻过")
        dataSource.add("那么多浪漫我都记得")
        dataSource.add("别再跟着我漂泊")
        // 4、将数据写入文件中
        dataSource.write(toFile: filePath, atomically: true)
    }
    
    static func readWithFile() {
        // 1、获得沙盒的根路径
        let home = NSHomeDirectory() as NSString
        // 2、获得Documents路径，使用NSString对象的stringByAppendingPathComponent()方法拼接路径
        let docPath = home.appendingPathComponent("Documents") as NSString
        // 3、获取文本文件路径
        let filePath = docPath.appendingPathComponent("data.plist")
        let dataSource = NSArray(contentsOfFile: filePath)
        dataSource?.forEach({line in
            
            let s : NSString = line as! NSString
            print(s)
        })
        print(dataSource ?? "nasi")
    }
    
}
