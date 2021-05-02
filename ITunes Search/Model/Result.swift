import Foundation

struct Result: Codable {
    let trackId: Int
    let artistName: String
    let trackName: String
    let releaseDate: String
    let primaryGenreName: String
    let trackPrice: Double
    
    enum CodingKeys: String, CodingKey {
        case trackId
        case artistName
        case trackName
        case releaseDate
        case primaryGenreName
        case trackPrice
    }
}

struct Response: Codable {
    let results:[Result]
}

