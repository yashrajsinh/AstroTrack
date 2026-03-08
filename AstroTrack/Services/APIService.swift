import Foundation
//Singleton of API
class APIService{
    // Why shared (This avoids creating multiple networking objects.)
    static let shared = APIService()
    private init(){}
    //API Key
    let apiKey = "http://api.open-notify.org/iss-now.json"
    
    //MARK: Function to fetch API
    func fetchISSPosition(completion: @escaping (Double, Double) -> Void){
        // Parse API(String) to URL type
        guard let url = URL(string: apiKey) else { return }
        
        //network conncetion
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                print("Error: \(error)")
                return
            }
            guard let data = data else { return }
            do{
                //Serialize Json Obeject
                let json = try JSONSerialization.jsonObject(with: data) as? [String: Any]
                if let position = json?["iss_position"] as? [String: String],
                   let latString = position["latitude"],
                   let lonString = position["longitude"],
                   let latitude = Double(latString),
                   let longitude = Double(lonString){
                    completion(latitude, longitude)
                }
            }catch{
                print("JSON Parse Error : \(error)")
            }
        }.resume()
    }
}
