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
    static let BASE_API_URL = "http://443dfd476d6c.ngrok.io"
    
    static let CONTENT_TYPE = "application/json; charset=utf-8"
    static let MB_DEVICE_INFOR_HEADER = "MB_DEVICE_INFOR_HEADER"
    static let AUTHON_REFRESH_HEADER = "AUTHON_REFRESH_HEADER"
    static let AUTHON_ACCESS_HEADER = "AUTHON_ACCESS_HEADER"
    
    
    static func postRegist(username:String,
                           password:String,
                           whenOK:@escaping()->Void,
                           whenNG:@escaping(_ APIResult:APIResult?)->Void) {
        
        let body = ["memberEmail":username,
                    "memberPassword":password,
                    "memberPasswordcf":password]
        
        let url = URL(string: BASE_API_URL + "/v1/api/member/regist")
        
        let data : Data! = try? JSONSerialization.data(withJSONObject: body, options: []) as Data?
        
        doApi(url:url!, method: HttpMethod.POST, body:data, accessToken: nil,  whenOK: { data, statusCode in
            whenOK()
        },whenNG: { data, error,statusCode  in
            if data == nil{
                whenNG(nil)
            } else {
                whenNG(APIResult.getAPIResult(data:data!))
            }
        }, whenTokenNG: {_,_ in
            
        })
        
    }
    
    
    static func postRegistOK(code:String,
                             whenOK:@escaping()->Void,
                             whenNG:@escaping(_ APIResult:APIResult?)->Void) {
        
        let body = ["code":code]
        
        let data : Data! = try? JSONSerialization.data(withJSONObject: body, options: []) as Data?
        
        let url = URL(string: BASE_API_URL + "/v1/api/member/regist_mailcf")
        
        doApi(url:url!, method: HttpMethod.POST, body:data, accessToken: nil, whenOK: { data, statusCode in
            whenOK()
        },whenNG: { data, error,statusCode  in
            if data == nil{
                whenNG(nil)
            } else {
                whenNG(APIResult.getAPIResult(data:data!))
            }
        }, whenTokenNG: {_,_ in
        })
    }
    
    static func login(memberEmail:String,
                      memberPassword:String,
                      whenOK:@escaping(_ loginResult:LoginResult)->Void,
                      whenNG:@escaping(_ loginResult:LoginResult?)->Void) {
        let url = URL(string: BASE_API_URL + "/v1/api/member/login")
        let body = ["memberEmail":memberEmail,
                    "memberPassword":memberPassword]
        
        let data : Data! = try? JSONSerialization.data(withJSONObject: body, options: []) as Data?
        
        doApi(url:url!, method: HttpMethod.POST, body:data, accessToken: nil, whenOK: { data, statusCode in
            whenOK(LoginResult.getLoginResult(data: data!)!)
        },whenNG: { data, error,statusCode  in
            if data == nil{
                whenNG(nil)
            } else {
                do{
                    guard let r =  LoginResult.getLoginResult(data:data!) else{
                        throw RequestError.netError
                    }
                    whenNG(r)
                }catch{
                    whenNG(nil)
                }
            }
        }, whenTokenNG: {_,_ in
            
        })
        
        
    }
    static func doApi(url:URL,
                      method:HttpMethod,
                      body:Data?,
                      accessToken:String?,
                      whenOK:@escaping(_ responsData:Data?,_ statusCode: Int)->Void,
                      whenNG:@escaping(_ responsData:Data?, _ error:String?, _ statusCode: Int)->Void,
                      whenTokenNG:@escaping(_ isNotRefreshToken:Bool, _ msg:String)->Void)->Void{
        
        var request = URLRequest(url: url)
        request.setValue(CONTENT_TYPE, forHTTPHeaderField: "Content-Type")
        request.setValue(DeviceHelper.getDeviceInfo().getJsoBase64Encode(), forHTTPHeaderField: MB_DEVICE_INFOR_HEADER)
        request.setValue(accessToken, forHTTPHeaderField: AUTHON_ACCESS_HEADER)
        request.httpBody = body
        request.httpMethod = method.rawValue
        let session = URLSession.shared
        
        session.dataTask(with: request) { (data, response, error) in
            if error == nil, let data = data, let response = response as? HTTPURLResponse {
                if response.statusCode == 401 {
                    whenTokenNG(true, "accessToken is not good")
                }
                print("url:\(url),statusCode: \(response.statusCode)")
                // HTTPステータスコード
                print(String(data: data, encoding: String.Encoding.utf8) ?? "")
                if response.statusCode != 200 {
                    whenNG(data, nil, response.statusCode)
                } else {
                    whenOK(data, response.statusCode)
                }
            } else {
                
                let response = response as? HTTPURLResponse
                print("url:\(url),statusCode: \(response!.statusCode),error\(String(describing: error))")
                whenNG(nil, String(describing: error), response!.statusCode)
            }
            
        }.resume()
    }
    
    static func getAccessToken(whenOK:@escaping(_ accessToken:String)->Void,
                               whenTokenNG:@escaping(_ isNotRefreshToken:Bool, _ msg:String)->Void)->Void{
        DispatchQueue.main.async {
            // 取得KeyChina
            //Token.deleteToken()
            let accessToken = Token.getAccessToken()
            if accessToken != nil {
                whenOK(accessToken!)
            }else {
                let refreshToken = Token.getRefreshToken();
                if refreshToken == nil {
                    whenTokenNG(true, "token haven't")
                    return;
                }
                
                let url = URL(string: BASE_API_URL + "/v1/api/manag/refreshToken")
                
                var request = URLRequest(url: url!)
                request.setValue(CONTENT_TYPE, forHTTPHeaderField: "Content-Type")
                request.setValue(DeviceHelper.getDeviceInfo().getJsoBase64Encode(), forHTTPHeaderField: MB_DEVICE_INFOR_HEADER)
                request.setValue(refreshToken, forHTTPHeaderField: AUTHON_REFRESH_HEADER)
                let session = URLSession.shared
                session.dataTask(with: request) { (data, response, error) in
                    if error == nil, let data = data, let response = response as? HTTPURLResponse {
                        print("statusCode: \(response.statusCode)")
                        print(String(data: data, encoding: String.Encoding.utf8) ?? "")
                        if response.statusCode != 200 {
                            Token.deleteToken();
                            whenTokenNG(true, "statusCode = \(response.statusCode)")
                            return;
                        } else {
                            let refreshToken = RefreshTokenResult.getRefreshTokenResult(data: data)
                            Token.refreshAccessToken(refreshTokenResult: refreshToken)
                            whenOK(refreshToken!.accessToken!)
                        }
                    }
                    else {
                        Token.deleteToken();
                        whenTokenNG(true, "unknow")
                        return;
                    }
                    
                }.resume()
            }
            return
        }
    }
    
    static func getShopInfo(whenOK:@escaping(_ shopInfo:ShopInfo?)->Void,
                            whenNG:@escaping(_ msg:String)->Void,
                            whenTokenNG:@escaping(_ isNotRefreshToken:Bool, _ msg:String)->Void)->Void{
        getAccessToken(whenOK: { (accessToken) in
            
            
            let url = URL(string: BASE_API_URL + "/v1/api/manag/shopInfo")
            
            doApi(url: url!, method: HttpMethod.GET, body: nil, accessToken: accessToken) { (data, statu) in
                if statu != 200 {
                    whenNG("statu:\(statu)")
                } else {
                    whenOK(ShopInfo.getShopInfo(data: data!))
                }
            } whenNG: { (data, err, statu) in
                whenNG("data:\(String(describing: data)),err:\(String(describing: err)),statu:\(String(describing: statu))")
            } whenTokenNG: { (reLogin, msg) in
                whenTokenNG(reLogin,msg)
            }

        }, whenTokenNG: whenTokenNG)
    }
    
    
    static func getShopItemInfo(whenOK:@escaping(_ itemDetail:[ItemDetail]?)->Void,
                                whenNG:@escaping(_ isNotRefreshToken:Bool, _ msg:String)->Void,
                                whenTokenNG:@escaping(_ isNotRefreshToken:Bool, _ msg:String)->Void)->Void{
        getAccessToken(whenOK: { (accessToken) in
            
            let url = URL(string: BASE_API_URL + "/v1/api/manag/shopItemInfo")
            
            doApi(url: url!, method: HttpMethod.GET, body: nil, accessToken: accessToken) { (data, statu) in
                if statu != 200 {
                    whenNG(false,"statu:\(statu)")
                } else {
                    whenOK(ItemDetail.getItemDetail(data: data!))
                }
            } whenNG: { (data, err, statu) in
                whenNG(false, "data:\(String(describing: data)),err:\(String(describing: err)),statu:\(String(describing: statu))")
            } whenTokenNG: { (reLogin, msg) in
                whenTokenNG(reLogin,msg)
            }
        },whenTokenNG:whenTokenNG)
    }
    
    
    static func saveShopInfoForRest(shopInfo:ShopInfo,
                                    whenOK:@escaping()->Void,
                                    whenNG:@escaping(_ result:APIResult?)->Void,
                                    whenTokenNG:@escaping(_ isNotRefreshToken:Bool, _ msg:String)->Void)->Void {
        getAccessToken(whenOK: { (accessToken) in
            
            let data = CMF.obToData(shopInfo)
            let url = URL(string: BASE_API_URL + "/v1/api/manag/save_shopInfo")
            
            doApi(url: url!, method: HttpMethod.POST, body: data, accessToken: accessToken) { data, statusCode in
                whenOK()
            } whenNG: { data, error,statusCode  in
                if data == nil{
                    whenNG(nil)
                } else {
                    whenNG(APIResult.getAPIResult(data:data!))
                }
            } whenTokenNG: { (reLogin, msg) in
                whenTokenNG(reLogin,msg)
            
            }
        },whenTokenNG:whenTokenNG)
    }
    
    static func saveShopItemInfo(items: [ItemDetail],
                                 whenOK:@escaping()->Void,
                                 whenNG:@escaping()->Void,
                                 whenTokenNG:@escaping(_ isNotRefreshToken:Bool, _ msg:String)->Void)->Void {
        getAccessToken(whenOK: { (accessToken) in
            let data = CMF.obToData(items)
            let url = URL(string: BASE_API_URL + "/v1/api/manag/save_shopItemInfo")
            doApi(url: url!, method: HttpMethod.POST, body: data, accessToken: accessToken) { data, statusCode in
                whenOK()
            } whenNG: { data, error,statusCode  in
                whenNG()
            } whenTokenNG: { (reLogin, msg) in
                whenTokenNG(reLogin,msg)
            
            }
        },whenTokenNG:whenTokenNG)
    }
    static func saveShopItemInfoRow(item:ItemDetail,
                                    whenOK:@escaping()->Void,
                                    whenNG:@escaping()->Void,
                                    whenTokenNG:@escaping(_ isNotRefreshToken:Bool, _ msg:String)->Void)->Void {
        getAccessToken( whenOK: { (accessToken) in
            
            
            let data = CMF.obToData(item)
            let url = URL(string: BASE_API_URL + "/v1/api/manag/shopItemInfoRow")
            
            doApi(url: url!, method: HttpMethod.POST, body: data, accessToken: accessToken) { data, statusCode in
                whenOK()
            } whenNG: { data, error,statusCode  in
                whenNG()
            } whenTokenNG: { (reLogin, msg) in
                whenTokenNG(reLogin,msg)
            
            }

        },whenTokenNG:whenTokenNG)
    }
    
    
    //
    //    static func getShopInfo(shopID:String ,ok:@escaping(_ shopInfoResult:ShopInfoResult)->Void,ng:@escaping(_ error: String?)->Void) {
    //
    //        let url = URL(string: BASE_API_URL + "/v1/api/shop/" + shopID)
    //
    //        doApi(url:url!, method: HttpMethod.POST, body:nil, accessToken: nil, whenOK: { data, statusCode in
    //            let result = ShopInfoResult.getShopInfoResult(data:data!)
    //            ok(result!);
    //        },whenNG: { data, error,statusCode  in
    //            if data == nil{
    //                ng(nil)
    //            } else {
    //                ng("通信エラー")
    //            }
    //        })
    //
    //    }
    static func getManaColorInfoList(
        whenOK:@escaping(_ manaColor:[ManaColor]?)->Void,
        whenNG:@escaping(_ msg:String)->Void,
        whenTokenNG:@escaping(_ isNotRefreshToken:Bool, _ msg:String)->Void)->Void{
        getAccessToken(whenOK: { (accessToken) in
            
            
            let url = URL(string: BASE_API_URL + "/v1/api/manag/manaColorInfo")
            doApi(url: url!, method: HttpMethod.GET, body: nil, accessToken: accessToken) { (data, statu) in
                if statu != 200 {
                    whenNG("statu:\(String(describing: statu))")
                } else {
                    let appcom = ApiResultCommon<ManaColor>()
                    let result = appcom.getApiResultCommon(data: data!)
                    
                    whenOK(result.result)
                }
            } whenNG: { (data, err, statu) in
                whenNG("data:\(String(describing: data)),err:\(String(describing: err)),statu:\(String(describing: statu))")
            } whenTokenNG: { (reLogin, msg) in
                whenTokenNG(reLogin,msg)
            
            }
            
        },whenTokenNG:whenTokenNG)
    }
    
    
    static func saveManaColor(manaColor:ManaColor,
                       whenOK:@escaping(_ manaColor:[ManaColor]?)->Void,
                       whenNG:@escaping(_ msg:String)->Void,
                       whenTokenNG:@escaping(_ isNotRefreshToken:Bool, _ msg:String)->Void)->Void {
        getAccessToken( whenOK: { (accessToken) in
            
            
            let data = CMF.obToData(manaColor)
            let url = URL(string: BASE_API_URL + "/v1/api/manag/save_manaColorInfo")
            doApi(url: url!, method: HttpMethod.POST, body: data, accessToken: accessToken) {  (data, statu) in
                if statu != 200 {
                    whenNG("statu:\(String(describing: statu))")
                } else {
                    let appcom = ApiResultCommon<ManaColor>()
                    let result = appcom.getApiResultCommon(data: data!)
                    
                    whenOK(result.result)
                }
            } whenNG: { data, err,statu  in
                whenNG("data:\(String(describing: data)),err:\(String(describing: err)),statu:\(String(describing: statu))")
            } whenTokenNG: { (reLogin, msg) in
                whenTokenNG(reLogin,msg)
            }

        },whenTokenNG:whenTokenNG)
    }
    
    static func deleteManaColor(manaColor:ManaColor,
                       whenOK:@escaping()->Void,
                       whenNG:@escaping(_ msg:String)->Void,
                       whenTokenNG:@escaping(_ isNotRefreshToken:Bool, _ msg:String)->Void)->Void {
        getAccessToken( whenOK: { (accessToken) in
            
            
            let data = CMF.obToData(manaColor)
            let url = URL(string: BASE_API_URL + "/v1/api/manag/delete_manaColorInfo")
            doApi(url: url!, method: HttpMethod.POST, body: data, accessToken: accessToken) {  (data, statu) in
                if statu != 200 {
                    whenNG("statu:\(String(describing: statu))")
                } else {
                    whenOK()
                }
            } whenNG: { data, err,statu  in
                whenNG("data:\(String(describing: data)),err:\(String(describing: err)),statu:\(String(describing: statu))")
            } whenTokenNG: { (reLogin, msg) in
                whenTokenNG(reLogin,msg)
            }

        },whenTokenNG:whenTokenNG)
    }
}

enum RequestError :Error {
    case netError
    case serviceError
    case missingParameter(parameter: String)
    case isnil
}

