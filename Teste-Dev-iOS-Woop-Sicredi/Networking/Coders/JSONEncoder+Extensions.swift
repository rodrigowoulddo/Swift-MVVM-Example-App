
import Foundation

extension JSONEncoder {
    
    static var encoder: JSONEncoder {
        
        let encoder = JSONEncoder()
        encoder.dateEncodingStrategy = .formatted(DateFormatter.defaultFormatter)
        return encoder
    }
}
