//
//  NetworkManager.swift
//  TheSpoke
//
//  Created by Rhea Malik on 11/5/22.
//

import Foundation

class NetworkManager: ObservableObject {
    
    @Published var posts = [NewsPost]()
    
    func fetchData(postsPerPage: Int = 20, page: Int = 1) {
        if let url = URL(string: "https://spoke.news/wp-json/wp/v2/posts?per_page=\(postsPerPage)&page=\(page)&filter%5Borderby%5D=date&order=desc") {
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { (data, response, error) in
                if error == nil {
                    let decoder = JSONDecoder()
                    if let safeData = data {
                        do {
                            let results = try decoder.decode([Post].self, from: safeData)
                            for result in results {
                                if result.imageLink.image.count > 0 {
                                    
                                    if let imageUrl = URL(string: result.imageLink.image[0].imageJsonlink) {
                                        let urlSession = URLSession(configuration: .default)
                                        let imageTask = urlSession.dataTask(with: imageUrl) { (data, response, error) in
                                            if error == nil {
                                                let jsonDecoder = JSONDecoder()
                                                if let safeData = data {
                                                    do {
                                                        let results = try jsonDecoder.decode([JSONImage].self, from: safeData)
                                                        DispatchQueue.main.async {
                                                            if results.count > 0 {
                                                                let link = results[0].guid.rendered
                                                                let image = link.replacingOccurrences(of: "http://", with: "https://")
                                                                self.posts.append(NewsPost(post: result, image: image))
                                                            }
                                                        }
                                                    } catch {
                                                        print(error)
                                                    }
                                                }
                                            }
                                        }
                                        imageTask.resume()
                                    }
                                    
                                }
                            }
                            
                        } catch {
                            print(error)
                        }
                    }
                }
            }
            task.resume()
        }
    }
    
//    func fetchImageData(_ url: String, index: Int) {
//        if let url = URL(string: url) {
//            let session = URLSession(configuration: .default)
//            let task = session.dataTask(with: url) { (data, response, error) in
//                if error == nil {
//                    let decoder = JSONDecoder()
//                    if let safeData = data {
//                        do {
//                            let results = try decoder.decode([JSONImage].self, from: safeData)
//                            DispatchQueue.main.async {
//                                if results.count > 0 {
//                                    self.images[index] =
//                                }
//                            }
//                        } catch {
//                            print(error)
//                        }
//                    }
//                }
//            }
//            task.resume()
//        }
//    }
}
