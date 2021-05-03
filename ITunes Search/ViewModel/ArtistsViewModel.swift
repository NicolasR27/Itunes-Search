
import SwiftUI

class ArtistsViewModel: ObservableObject {
    @Published var artists: [ArtistViewModel] = []
    
    func getData(searchString: String) {
        let apiService = APIService.shared
        
        apiService.getJSON(urlString: searchString) { (result: Result<Artist, APIService.APIError>) in
            
            switch result {
            case .success(let artist):
                DispatchQueue.main.async {
                    self.artists = artist.results.map { ArtistViewModel(artist: $0) }
                }
            case .failure(let apiError):
                switch apiError {
                case .error(let errorString):
                    print(errorString)
                }
            }
        }
    }
}
