
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
        //1. Convert String date back to Date format
        if let convertedDate = Self.dateFormatterToDate.date(from: artist.releaseDate) {
        //2. If happens format nicer and give me back as String
            return Self.dateFormatterToString.string(from: convertedDate)
        }
        //3. If something goes wrong still I don't want to crash, so give me back the originall
         return artist.releaseDate
    }
}
