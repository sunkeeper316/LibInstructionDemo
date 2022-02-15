

import Foundation

var currentaccount = ""


class UserDefault : NSObject{
    static var shared = UserDefault()
    
    let userDefaults = UserDefaults.standard
    
    func registerFristStatus(){
        userDefaults.register(defaults: ["isFrist" : true])
    }
    func saveFristStatus(isfrist : Bool) {
        userDefaults.set(isfrist, forKey: "isFrist")
    }
    func loadFristStatus() -> Bool{
        return userDefaults.bool(forKey: "isFrist")
    }
    func addNewFristStatus(){
        userDefaults.register(defaults: ["isFristAddNew" : true])
    }
    func saveAddNewFristStatus(isfrist : Bool) {
        userDefaults.set(isfrist, forKey: "isFristAddNew")
    }
    func loadAddNewFristStatus() -> Bool{
        return userDefaults.bool(forKey: "isFristAddNew")
    }
    func saveAccount(){
        userDefaults.set(currentaccount, forKey: "account")
    }
    func loadAccount(){
        currentaccount = userDefaults.string(forKey: "account") ?? ""
    }
    func savePassword(currentpassword : String){
        userDefaults.set(currentpassword, forKey: "password")
    }
    func loadPassword() -> String{
       let currentpassword = userDefaults.string(forKey: "password") ?? ""
        return currentpassword
    }
//    func saveDateFormetter(){
//        userDefaults.set(customDateFormatterIndex, forKey: "DateFormetter")
//    }
//    func loadDateFormetter() {
//        customDateFormatterIndex = userDefaults.integer(forKey: "DateFormetter")
//    }
    func saveDeviceListIndex(index:Int){
        userDefaults.set(index, forKey: "DeviceListIndex")
    }
    func loadDeviceName() -> String{
        return userDefaults.string(forKey: "DeviceName") ?? ""
    }
    func saveDeviceName(device:String){
//        saveDeviceConnect(connect: Connect.BLE.rawValue)
        userDefaults.set(device, forKey: "DeviceName")
    }
    func loadDeviceConnect() -> String{
        return userDefaults.string(forKey: "DeviceConnect") ?? ""
    }
    func saveDeviceConnect(connect:String){
        userDefaults.set(connect, forKey: "DeviceConnect")
    }
    func loadDeviceListIndex() -> Int{
        return userDefaults.integer(forKey: "DeviceListIndex")
    }
//    func saveMeteringSystem(){
//        userDefaults.set(meteringSystemIndex, forKey: "MeteringSystem")
//    }
//    func loadMeteringSystem() {
//        meteringSystemIndex = userDefaults.integer(forKey: "MeteringSystem")
//    }
    func loadAll(){
        loadAccount()
//        loadDateFormetter()
//        loadMeteringSystem()
    }


}
