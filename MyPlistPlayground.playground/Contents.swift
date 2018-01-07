
/*:
 ## Encoding and Decoding Property list aka plist.
 
 Suppose you have some valuable API keys in your project that you wish to save in a plist.
 */
import Foundation
//: Create a Struct MyKey which conforms to `Codable` Protocol.
struct MyKey: Codable {
    enum Social: String, Codable {
        case twitter, facebook
    }
    init(keyName: String, keyValue: String, type: Social) {
        self.apiKeyName =  keyName
        self.apiKeyValue = keyValue
        self.keyType = type
    }
    let apiKeyName: String
    let apiKeyValue: String
    let keyType: Social
}
//: Create an array of all your API keys that you want to store.
let myKeys = [MyKey(keyName: "facebookAPIKey", keyValue: "ValueOfMyFacebookAPIKey", type: .facebook), MyKey(keyName: "twitterAPIKey", keyValue: "ValueOfMyTwitterAPIKey", type: .twitter)]
//: Create a seperate folder that will contain your plist file containing your key/values.
let documentSubdirectoryURL = URL(
    fileURLWithPath: "MyPlistFolder",
    relativeTo: FileManager.documentDirectoryURL
)
try? FileManager.default.createDirectory(
    at: documentSubdirectoryURL,
    withIntermediateDirectories: false
)
//: As we dive into Encoding/Decoding we might encounter several try catch, so start with a do block.
do {
//: Specify a URL where you want to save the myAPIKeys.plist file with proper extension and pathComponent.
    let plistURL = URL(fileURLWithPath: "myAPIKeys", relativeTo: FileManager.documentDirectoryURL.appendingPathComponent("MyPlistFolder")).appendingPathExtension("plist")
/*:
 * Create an instance of PropertyListEncoder()
 * Specifying outputFormat as `xml` so that you can view it in a source code file format or plist file format.
 * After that, encode your array of keys that you created above
 * And finally, write the encoded Data to your myAPIKeys.plist file.
 * Voila!
*/

    let plistEncoder = PropertyListEncoder()
    plistEncoder.outputFormat = .xml
    let plistData = try plistEncoder.encode(myKeys)
    try plistData.write(to: plistURL)
/*:
* Create an instance of PropertyListDecoder()
* Fetch data from the plistURL
* After that, decode your data by specifying the type of your data. Please note that we had created an array of keys and hence the type will be array of MyKey, i.e [MyKey].self
* Bingo!
*/
    let plistDecoder = PropertyListDecoder()
    let data = try Data.init(contentsOf: plistURL)
    let value = try plistDecoder.decode([MyKey].self, from: data)
} catch {print(error)}
/*:
* Right click on the value of the `FileManager.documentDirectoryURL` and select `open URL`, this will open the directory where you can find your folder and the plist file that you just created
* EUREKA✌🏼
*/
FileManager.documentDirectoryURL
