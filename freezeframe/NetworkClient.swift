//
//  NetworkClient.swift
//  freezeframe
//
//  Created by Alex on 19.03.17.
//  Copyright © 2017 AnsA. All rights reserved.
//

import Foundation
import Alamofire
import Kanna

class NetworkClient {
    
    var shows = Array<modelList>()
    var objectModel = modelList()
    
    // MARK: GetList
    func getList(apiEndPoint: NSString, completion: @escaping (_ response: ResponsePackage) -> ()) -> Bool
    {
        
        let responsePackage = ResponsePackage()
        Alamofire.request("http://freezeframe.esy.es/news/jsoup.html").responseString { response in
            print("\(response.result.isSuccess)")
            
            if let html = response.result.value
            {
                
                if let doc = Kanna.HTML(html: html, encoding: String.Encoding.utf8)
                {
                    self.addText(doc: doc)
                    
                    self.addImage(doc: doc)
                    responsePackage.responseArray = self.shows
                    responsePackage.success = true
                }
                completion(responsePackage)
                
            }
            
        }
        return true
    }
    
    // MARK: add Text to Array
    func addText(doc:HTMLDocument) {
        
        var flag = 0
        for show in doc.css("td")
        {
            flag = flag+1
            let showString = show.text!
            
            let data = showString.data(using: String.Encoding.isoLatin1)
            let str = NSString(data: data!, encoding: String.Encoding.utf8.rawValue)

            switch flag {
                
            case (1) :
                self.objectModel.number = str! as String
                
            case (2) :
                self.objectModel.text1 = str! as String
                
            case (3) :
                self.objectModel.text2 = str! as String
                
            case (4) :
                self.objectModel.textData = str! as String
                
            case (5) :
                self.objectModel.image = "Test image"
                self.shows.append(self.objectModel)
                flag = 0
                self.objectModel = modelList()

            default: break
                
            }
            
            
        }
    }
    
    // MARK: add image to Array
    func addImage(doc:HTMLDocument) {
        
        var flag = 0
        for link in doc.css("td > img")
        {
            print(link.toHTML!)
            let showString = link["src"]!
            shows[flag].image = showString
            flag = flag+1
        }
        
    }
    
    func saveModel(){
        
    }
}
//MARK: classResponse
class ResponsePackage {
    
    var success = false
    var response: AnyObject? = nil
    var responseArray: Array<modelList> = Array<modelList>()
    var error: NSError? = nil
    
}

