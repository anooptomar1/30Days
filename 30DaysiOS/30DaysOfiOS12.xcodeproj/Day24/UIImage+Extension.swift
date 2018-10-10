//
// UIImage+Extension
// 30DaysOfiOS12
//
// Created by DevTechie Interactive on 10/3/18.
// Copyright © 2018 Devtechie. All rights reserved.
//

import UIKit

extension UIImage {
    static func imageAsync(urlString: String, completion: @escaping (UIImage?) -> Void) {
        
        let url = URL(string: urlString)!
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard error == nil else {
                completion(nil)
                return
            }
            
            guard let data = data else {
                completion(nil)
                return
            }
            
            let img = UIImage(data: data)
            completion(img)
        }.resume()
        
    }
}
