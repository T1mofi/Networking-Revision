//
//  ViewController.swift
//  Networking Basics
//
//  Created by Tsimafei Sikorski on 06/07/2023.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        perofrmRequest()
    }

    func perofrmRequest() {
        var urlComponents = URLComponents(string: "https://itunes.apple.com/search")!
        urlComponents.queryItems = [
            "term": "jack+johnson",
            "media": "movie",
            "limit": "1"
        ].map { URLQueryItem(name: $0, value: $1)}
        Task {
            let (data, response) = try await URLSession.shared.data(from: urlComponents.url!)

            if let response = response as? HTTPURLResponse? {
                switch response?.statusCode {
                case 200:
                    if let stringRepresentation = String(data: data, encoding: .utf8) {
                        print(stringRepresentation)
                    }
                default:
                    print(response?.statusCode)
                }
            }
        }
    }


}

