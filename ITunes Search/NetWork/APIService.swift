
import Foundation


public class APIService {
    public static let shared = APIService()
    
    public enum APIError: Error {
        case error(_ errorString: String)
    }
    
    public func getJSON<T:Decodable>(urlString: String, completion: @escaping (Result<T, APIError>) -> Void) {
        
        guard let url = URL(string: "https://itunes.apple.com/search?term=\(urlString)") else {
            completion(.failure(.error("Error. Invalid URL.")))
            return
        }
        
        let request = URLRequest(url: url)
        
        URLSession.shared.dataTask(with: request) { (data, response, error) in
            if let error = error {
                completion(.failure(.error("Error: \(error.localizedDescription)...")))
                return
            }
            
            guard let data = data else {
                completion(.failure(.error("Error. Data is corrupt.")))
                return
            }
            
            let decoder = JSONDecoder()
            do {
                let decodeData = try decoder.decode(T.self, from: data)
                completion(.success(decodeData))
                return
            } catch _ {
                completion(.failure(.error("Error: \(error?.localizedDescription ?? "Problem...")")))
                return
            }
        }.resume()
    }
}
