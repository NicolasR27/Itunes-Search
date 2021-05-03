
import Foundation

struct Artist: Codable {
    struct Result: Codable {
        let trackId: Int
        let artistName: String
        let trackName: String
        let releaseDate: String
        let primaryGenreName: String
        let trackPrice: Double
        let currency: String
        
        enum CodingKeys: String, CodingKey {
            case trackId
            case artistName
            case trackName
            case releaseDate
            case primaryGenreName
            case trackPrice
            case currency
        }
    }
    
    let results:[Result]
}
