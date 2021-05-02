
import SwiftUI

struct ContentView: View {
    
    @State var results = [Result]()
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
                
                Spacer()
                
                Group {
                    if results.count > 0 {
                        List(results, id:\.trackId) { item in
                            VStack(alignment: .leading) {
                                Text(item.artistName)
                                    .font(.headline)
                                Text(item.primaryGenreName)
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
        guard let url = URL(string: "https://itunes.apple.com/search?term=\(formatedSearchString)")
        else {
            print("invalid url")
            return
        }
        
        let request = URLRequest(url: url)
        URLSession.shared.dataTask(with: request) { data,reponse,error in
            if let data = data {
                if let decodedResponse = try?
                    JSONDecoder().decode(Response.self,from:data){
                    DispatchQueue.main.async {
                        self.results = decodedResponse.results
                    }
                    return
                }
            }
            print("fetch failed:\(error?.localizedDescription ?? "unknown")")
        }.resume()
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
