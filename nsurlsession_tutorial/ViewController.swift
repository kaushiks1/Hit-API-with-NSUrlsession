//
//  ViewController.swift
//  nsurlsession_tutorial


import UIKit

class ViewController: UIViewController {
    
  //  let url_to_request:String = "http://shagunn.info/cherishws/webservices/homepage?key=28c15c0b405c1f7a107133edf5504367"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        print("\(data_request(url_to_request: "http://shagunn.info/cherishws/mobileapi/products?category=2&limit=10&page=1&parentmenu=1"))")
        
        download_request(stringURL: "http://shagunn.info/cherishws/mobileapi/products?category=2&limit=10&page=1&parentmenu=1", dictionaryAdditionalHeaderParameters: [:], dictionaryParameters: [:] , completionHandlerSuccess: {_ in 
            
            }, completionHandlerFailure: {_ in
                
        })
        
        //print("\(upload_request(url_to_request: "http://shagunn.info/cherishws/webservices/homepage?key=28c15c0b405c1f7a107133edf5504367"))")
        
//        let url = NSURL(string: "www.google.com")
//        
//        downloadFileFromURL(url: url!) { (_ success) in
//            
//            print("\(success)")
//            
//        }
    }
    
    
    
//    func data_request(url_to_request: String)
//    {
//        let url:URL = URL(string: url_to_request)!
//        let session = URLSession.shared
//        
//        let request = NSMutableURLRequest(url: url)
//        request.httpMethod = "GET"
//        request.cachePolicy = NSURLRequest.CachePolicy.reloadIgnoringCacheData
//        
//        let paramString = "data=Hello"
//        request.httpBody = paramString.data(using: String.Encoding.utf8)
//        
//        
//        let task = session.dataTask(with: request as URLRequest, completionHandler:
//            {
//                (data, response, error) in
//                
//                guard let _:Data = data, let _:URLResponse = response  , error == nil else {
//                    print("error")
//                    return
//                }
//                
//                let dataString = NSString(data: data!, encoding: String.Encoding.utf8.rawValue)
//                print(dataString)
//                
//        })
//        
//        task.resume()
//        
//    }
//    
    
    func download_request(stringURL: String, dictionaryAdditionalHeaderParameters: [String: String], dictionaryParameters: [String: String] ,completionHandlerSuccess: (_ successResponse:AnyObject) -> Void, completionHandlerFailure: (_ failureResponse: AnyObject) -> Void)
    {

        var sessionConfiguration = URLSessionConfiguration.default
        sessionConfiguration.httpAdditionalHeaders = dictionaryAdditionalHeaderParameters
      
        let url:URL = URL(string: stringURL)!
        let urlSession = URLSession.shared
        
        let urlRequest = NSMutableURLRequest(url: url)
        urlRequest.httpMethod = "GET"
        urlRequest.cachePolicy = NSURLRequest.CachePolicy.reloadIgnoringCacheData
        urlRequest.httpBody = "data=Hello".data(using: String.Encoding.utf8)
//        urlRequest.httpBody = dictionaryParameters.data(using: String.Encoding.utf8)
        urlRequest.setValue("application/form-data", forHTTPHeaderField: "Content-Text")
//        urlRequest.setValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")
        
        
        let urlSessionTask = urlSession.downloadTask(with: urlRequest as URLRequest, completionHandler:
            {
                (url, response, error) in
                
                
                if (error == nil)
                {
                    print("\(url)");
                }
                else
                {
                   print("\(error)");
                }
                
                guard let _:URL = url, let _:URLResponse = response  , error == nil else {
                    print("error")
                    return
                }
                
                let urlContents = try! NSString(contentsOf: url!, encoding: String.Encoding.utf8.rawValue)
                
                guard let _:NSString = urlContents else {
                    print("error")
                    return
                }
                
                print(urlContents)
                
        })
        
        urlSessionTask.resume()
        
    }
    
    
//    func upload_request(url_to_request: String)
//    {
//        let url:URL = URL(string: url_to_request)!
//        let session = URLSession.shared
//        
//        let request = NSMutableURLRequest(url: url)
//        request.httpMethod = "GET"
//        request.cachePolicy = NSURLRequest.CachePolicy.reloadIgnoringCacheData
//        
//        
//        let data = "data=Hi".data(using: String.Encoding.utf8)
//        
//        
//        let task = session.uploadTask(with: request as URLRequest, from: data, completionHandler:
//            {
//                (data,response,error) in
//                
//                guard let _:Data = data, let _:URLResponse = response  , error == nil else {
//                    print("error")
//                    return
//                }
//                
//                let dataString = NSString(data: data!, encoding: String.Encoding.utf8.rawValue)
//                print(dataString)
//            }
//        );
//        
//        task.resume()
//        
//    }
    
    
//    typealias CompletionHandler = (_ success:Bool) -> Void
    
//    func downloadFileFromURL(url: String, headerParameters: [String: String], parameters: [String: String] ,completionHandlerSuccess: (_ success:AnyObject) -> Void, completionHandlerFailure: (_ failure:AnyObject) -> Void) {
//        
//        var swift3Array = [String]()
//        
//        swift3Array.append("Tutorials")
//        
//        swift3Array.append("More Tutorials")
//        
//        let flag = "usa" // true if download succeed,false otherwise
//        
//        completionHandlerSuccess(swift3Array as AnyObject)
//    }
    
    
    
}

