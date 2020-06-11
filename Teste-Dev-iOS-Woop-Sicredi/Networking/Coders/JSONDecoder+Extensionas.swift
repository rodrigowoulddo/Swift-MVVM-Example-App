
import Foundation

extension JSONDecoder {
    
    static var decoder: JSONDecoder {
        
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .formatted(DateFormatter.defaultFormatter)
        return decoder
    }
}
