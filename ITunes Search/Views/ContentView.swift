import SwiftUI

struct ContentView: View {
    
    @StateObject private var artistsViewModel = ArtistsViewModel()
    @State var searchText: String = ""
    
    var body: some View {
        NavigationView{
            VStack {
                
                HStack {
                    TextField("Search", text: $searchText)
                        .padding(7)
                        .background(Color(.systemGray6))
                        .cornerRadius(8)
                    Button(action: {
                        loadData(searchString: searchText)
                    }, label: {
                        Image(systemName:"magnifyingglass")
                    })
                }
                
                Group {
                    if let artists = artistsViewModel.artists {
                        List {
                            ForEach(artists, id:\.id) { artist in
                                VStack {
                                    Text("\(artist.name)")
                                    Text("\(artist.price)")
                                    Text("\(artist.genre)")
                                    Text("\(artist.Date)")
                                }
                            }
                        }
                        .listStyle(PlainListStyle())
                    }
                }
            }
            .navigationTitle("Search Artist")
            .padding()
        }
    }
    
    func loadData(searchString: String){
        let formatedSearchString = searchString.replacingOccurrences(of: " ", with: "+")
        artistsViewModel.getData(searchString: formatedSearchString)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

