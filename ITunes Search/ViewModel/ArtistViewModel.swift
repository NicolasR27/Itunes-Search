
import Foundation


struct ArtistViewModel {
    let artist: Artist.Result
    
    private static var dateFormatterToDate: DateFormatter {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        return dateFormatter
    }
    
    private static var dateFormatterToString: DateFormatter {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd MMM, yyyy"
        return dateFormatter
    }
        
    var id: Int {
        return artist.trackId
    }
    
    var name: String {
        return artist.artistName
    }
    
    var track: String {
        return artist.trackName
    }
    
    var price: String {
        return "\(artist.trackPrice) \(artist.currency)"
    }
    
    var genre: String {
        return artist.primaryGenreName
    }
    
    var Date: String {
        
        if let convertedDate = Self.dateFormatterToDate.date(from: artist.releaseDate) {
       
            return Self.dateFormatterToString.string(from: convertedDate)
        }
       
         return artist.releaseDate
    }
}
