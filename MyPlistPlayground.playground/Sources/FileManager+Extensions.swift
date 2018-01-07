import Foundation

public extension FileManager {
// Returns a URL that points to the document folder of this playground.
    static var documentDirectoryURL: URL {
        return try! FileManager.default.url(
            for: .documentDirectory,
            in: .userDomainMask,
            appropriateFor: nil,
            create: false
        )
    }
}
