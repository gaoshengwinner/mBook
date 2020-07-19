import UIKit
import Security
public class Keychain {
    
    class func save(key: String, string: String) -> Bool {
        return save(key: key, data: (string ).data(using:.utf8)!)
    }
    class func save(key: String, data: Data) -> Bool {
        let query = [
            kSecClass as String       : kSecClassGenericPassword as String,
            kSecAttrAccount as String : key,
            kSecValueData as String   : data ] as [String : Any]
        SecItemDelete(query as CFDictionary)
        let status: OSStatus = SecItemAdd(query as CFDictionary, nil)
        return status == noErr
    }
    class func loadString(key: String) -> String? {
        let data = load(key: key)
        return data == nil ? "" : String(data: load(key: key)!,encoding: .utf8)
    }
    class func load(key: String) -> Data? {
        let query = [
            kSecClass as String       : kSecClassGenericPassword,
            kSecAttrAccount as String : key,
            kSecReturnData as String  : kCFBooleanTrue as Any,
            kSecMatchLimit as String  : kSecMatchLimitOne ] as [String : Any]
        var dataTypeRef: AnyObject?
        let status = withUnsafeMutablePointer(to: &dataTypeRef) { SecItemCopyMatching(query as CFDictionary, UnsafeMutablePointer($0)) }

        if status == errSecSuccess {
            if let data = dataTypeRef as! Data? {
                return data
            }
        }
        return nil
    }
    class func delete(key: String) -> Bool {
        let query = [
            kSecClass as String       : kSecClassGenericPassword,
            kSecAttrAccount as String : key ] as [String : Any]

        let status: OSStatus = SecItemDelete(query as CFDictionary)
        return status == noErr
    }
    class func clear() -> Bool {
        let query = [ kSecClass as String : kSecClassGenericPassword ]
        let status: OSStatus = SecItemDelete(query as CFDictionary)
        return status == noErr
    }
}
