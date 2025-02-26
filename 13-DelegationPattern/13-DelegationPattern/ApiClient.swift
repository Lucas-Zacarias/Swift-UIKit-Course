//
//  ApiClient.swift
//  13-DelegationPattern
//
//  Created by Lucas Zacarias on 26/02/2025.
//

import Foundation

struct PokemonModel: Decodable {
    let name: String
    let url: String
}

struct PokemonResponse: Decodable {
    let pokemons: [PokemonModel]
    
    enum CodingKeys: String, CodingKey {
        case results
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.pokemons = try container.decode([PokemonModel].self, forKey: .results)
    }
}

protocol ApiClientDelegate: AnyObject {
    func update(pokemons: PokemonResponse)
}

class ApiClient {
    weak var delegate: ApiClientDelegate?
    
    func getPokemons () {
        let url = URL(string: "https://pokeapi.co/api/v2/pokemon/?offset=0&limit=151")!
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            let dataModel = try! JSONDecoder().decode(PokemonResponse.self, from: data!)
            print("Data model: \(dataModel)")
            self.delegate?.update(pokemons: dataModel)
        }
        task.resume()
    }
}
