//
//  APIHelper.swift
//  mBook
//
//  Created by 郑月华 on 2020/07/04.
//  Copyright © 2020 Meal Book corp. All rights reserved.
//

import SwiftUI
enum HttpMethod :String {
    case POST = "POST"
    case GET = "GET"
}
public class APIHelper {
    static let BASE_API_URL = "http://889ebddc00eb.ngrok.io"
    
    static let CONTENT_TYPE = "application/json; charset=utf-8"
    static let MB_DEVICE_INFOR_HEADER = "MB_DEVICE_INFOR_HEADER"
    
    
    static func postRegist(username:String, password:String,ok:@escaping()->Void,ng:@escaping(_ APIResult:APIResult?)->Void) {
        let body = ["memberEmail":username,
                    "memberPassword":password,
                    "memberPasswordcf":password]
        
        let url = URL(string: BASE_API_URL + "/v1/api/member/regist")
        
        let data : Data! = try? JSONSerialization.data(withJSONObject: body, options: []) as Data?
        
        doApi(url:url!, method: HttpMethod.POST, body:data, whenOK: { data, statusCode in
            ok()
        },whenNG: { data, error,statusCode  in
            if data == nil{
                ng(nil)
            } else {
                ng(APIResult.getAPIResult(data:data!))
            }
        })
        
    }
    
    
    static func postRegistOK(code:String,ok:@escaping()->Void,ng:@escaping(_ APIResult:APIResult?)->Void) {
        
        let body = ["code":code]
        
        let data : Data! = try? JSONSerialization.data(withJSONObject: body, options: []) as Data?
        
        let url = URL(string: BASE_API_URL + "/v1/api/member/regist_mailcf")
        
        doApi(url:url!, method: HttpMethod.POST, body:data, whenOK: { data, statusCode in
            ok()
        },whenNG: { data, error,statusCode  in
            if data == nil{
                ng(nil)
            } else {
                ng(APIResult.getAPIResult(data:data!))
            }
        })
    }
    
    static func login(memberEmail:String,
                      memberPassword:String,ok:@escaping(_ loginResult:LoginResult)->Void,ng:@escaping(_ loginResult:LoginResult?)->Void) {
        let url = URL(string: BASE_API_URL + "/v1/api/member/login")
        let body = ["memberEmail":memberEmail,
                    "memberPassword":memberPassword]
        
        let data : Data! = try? JSONSerialization.data(withJSONObject: body, options: []) as Data?
        
        doApi(url:url!, method: HttpMethod.POST, body:data, whenOK: { data, statusCode in
            ok(LoginResult.getAPIResult(data: data!)!)
        },whenNG: { data, error,statusCode  in
            if data == nil{
                ng(nil)
            } else {
                do{
                    guard let r =  LoginResult.getAPIResult(data:data!) else{
                        throw RequestError.netError
                    }
                    ng(r)
                }catch{
                    ng(nil)
                }
            }
        })
        
        
    }
    static func doApi(url:URL,
                      method:HttpMethod,
                      body:Data?,
                      whenOK:@escaping(_ responsData:Data?,_ statusCode: Int)->Void,
                      whenNG:@escaping(_ responsData:Data?, _ error:String?, _ statusCode: Int)->Void)->Void{
        
        var request = URLRequest(url: url)
        request.setValue(CONTENT_TYPE, forHTTPHeaderField: "Content-Type")
        request.setValue(DeviceHelper.getDeviceInfo().getJsoBase64Encode(), forHTTPHeaderField: MB_DEVICE_INFOR_HEADER)
        request.httpBody = body
        request.httpMethod = method.rawValue
        let session = URLSession.shared
        
        session.dataTask(with: request) { (data, response, error) in
            if error == nil, let data = data, let response = response as? HTTPURLResponse {
                // HTTPステータスコード
                print("statusCode: \(response.statusCode)")
                print(String(data: data, encoding: String.Encoding.utf8) ?? "")
                        if response.statusCode != 200 {
                    whenNG(data, nil, response.statusCode)
                } else {
                    whenOK(data, response.statusCode)
                }
            } else {
                let response = response as? HTTPURLResponse
                whenNG(nil, String(describing: error), response!.statusCode)
            }
            
        }.resume()
    }
    
    
    static func getShopInfo(shopID:String ,ok:@escaping(_ shopInfoResult:ShopInfoResult)->Void,ng:@escaping(_ error: String?)->Void) {
        
        let url = URL(string: BASE_API_URL + "/v1/api/shop/" + shopID)
        
        doApi(url:url!, method: HttpMethod.POST, body:nil, whenOK: { data, statusCode in
            let result = ShopInfoResult.getShopInfoResult(data:data!)
            ok(result!);
        },whenNG: { data, error,statusCode  in
            if data == nil{
                ng(nil)
            } else {
                ng("通信エラー")
            }
        })
        
    }

        
}

enum RequestError :Error {
    case netError
    case serviceError
    case missingParameter(parameter: String)
    case isnil
}

