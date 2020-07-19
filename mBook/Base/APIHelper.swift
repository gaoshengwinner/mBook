//
//  APIHelper.swift
//  mBook
//
//  Created by 郑月华 on 2020/07/04.
//  Copyright © 2020 Meal Book corp. All rights reserved.
//

import SwiftUI

public class APIHelper {
    static let BASE_API_URL = "http://3a6e6043c414.ngrok.io"
    
    static func postRegist(username:String, password:String,ok:@escaping()->Void,ng:@escaping(_ APIResult:APIResult)->Void) {
        
        let url = URL(string: BASE_API_URL + "/v1/api/member/regist")
        var request = URLRequest(url: url!)
        request.setValue("application/json; charset=utf-8", forHTTPHeaderField: "Content-Type")
        request.setValue(DeviceHelper.getDeviceInfo().getJson(), forHTTPHeaderField: "MB_DEVICE_INFOR_HEADER")
        
        let body = """
        {"memberEmail":"\(username)", "memberPassword":"\(password)", "memberPasswordcf":"\(password)"}
        """
        
        request.httpBody = body.data(using: .utf8)
        
        request.httpMethod = "POST"
        let session = URLSession.shared
        session.dataTask(with: request) { (data, response, error) in
            if error == nil, let data = data, let response = response as? HTTPURLResponse {
                
                // HTTPヘッダの取得
                print("Content-Type: \(response.allHeaderFields["Content-Type"] ?? "")")
                // HTTPステータスコード
                print("statusCode: \(response.statusCode)")
                print(String(data: data, encoding: String.Encoding.utf8) ?? "")
                
                let result = APIResult.getAPIResult(data:data)
                if result.statu == APIResult.IS_OK || result.statu == "" {
                    print("OK")
                    ok();
                } else {
                    print("NG")
                    ng(result)
                }
            } else {
                print(error ?? "")
            }
        }.resume()
    }
    
    static func postRegistOK(code:String,ok:@escaping()->Void,ng:@escaping(_ APIResult:APIResult)->Void) {
        
        let url = URL(string: BASE_API_URL + "/v1/api/member/regist_mailcf")
        var request = URLRequest(url: url!)
        request.setValue("application/json; charset=utf-8", forHTTPHeaderField: "Content-Type")
        request.setValue(DeviceHelper.getDeviceInfo().getJson(), forHTTPHeaderField: "MB_DEVICE_INFOR_HEADER")
        
        let body = """
        {"code":"\(code)"}
        """
        
        request.httpBody = body.data(using: .utf8)
        
        request.httpMethod = "POST"
        let session = URLSession.shared
        session.dataTask(with: request) { (data, response, error) in
            if error == nil, let data = data, let response = response as? HTTPURLResponse {
                
                // HTTPヘッダの取得
                print("Content-Type: \(response.allHeaderFields["Content-Type"] ?? "")")
                // HTTPステータスコード
                print("statusCode: \(response.statusCode)")
                print(String(data: data, encoding: String.Encoding.utf8) ?? "")
                
                let result = APIResult.getAPIResult(data:data)
                if result.statu == APIResult.IS_OK || result.statu == "" {
                    print("OK")
                    ok();
                } else {
                    print("NG")
                    ng(result)
                }
            } else {
                print(error ?? "")
            }
        }.resume()
    }
    
    static func getShopInfo(shopID:String ,ok:@escaping(_ shopInfoResult:ShopInfoResult)->Void,ng:@escaping(_ error: Error?)->Void) {
        let url = URL(string: BASE_API_URL + "/v1/api/shop/" + shopID)
        var request = URLRequest(url: url!)
        request.httpMethod = "GET"
        let session = URLSession.shared
        session.dataTask(with: request) { (data, response, error) in
            if error == nil, let data = data, let response = response as? HTTPURLResponse {
                // HTTPヘッダの取得
                print("Content-Type: \(response.allHeaderFields["Content-Type"] ?? "")")
                // HTTPステータスコード
                print("statusCode: \(response.statusCode)")
                print(String(data: data, encoding: String.Encoding.utf8) ?? "")
                let result = ShopInfoResult.getShopInfoResult(data:data)
                print("OK")
                ok(result!);
            } else {
                ng(error)
            }
        }.resume()
        
        
    }
    
    
    
}
