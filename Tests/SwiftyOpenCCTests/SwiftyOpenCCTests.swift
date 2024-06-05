import XCTest
@testable import SwiftyOpenCC

final class SwiftyOpenCCTests: XCTestCase 
{
    override func setUpWithError() throws
    {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        // Arrange
        
        // Act
        
        // Assert
    }
    
    func testConvertFromRemoteContent() async throws
    {
        // Arrange
        let url = URL(string: "https://cdn.jsdelivr.net/npm/opencc-js@1.0.5/dist/umd/full.js")!
        
        // Act
        let openCC = try await OpenCC.load(from: url)
        
        // Assert
        let result: String = openCC.converter("開放中文轉換 JavaScript 版", from: "tw", to: "cn")
        let expect: String = "开放中文转换 JavaScript 版"
        
        XCTAssertEqual(result, expect)
    }
}
