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
        let result: String = openCC.converter("開放中文轉換 JavaScript 版", from: .traditionalChinese(idom: false), to: .simplifiedChinese)
        let expect: String = "开放中文转换 JavaScript 版"
        
        XCTAssertEqual(result, expect)
    }
    
    func testConvertS2TWithIdom() async throws
    {
        // Arrange
        let url = URL(string: "https://cdn.jsdelivr.net/npm/opencc-js@1.0.5/dist/umd/full.js")!
        
        // Act
        let openCC = try await OpenCC.load(from: url)
        
        // Assert
        let result: String = openCC.converter("自行车", from: .simplifiedChinese, to: .traditionalChinese(idom: true))
        let expect: String = "腳踏車"
        
        XCTAssertEqual(result, expect)
    }
    
    func testConvertTWithIdom2S() async throws
    {
        // Arrange
        let url = URL(string: "https://cdn.jsdelivr.net/npm/opencc-js@1.0.5/dist/umd/full.js")!
        
        // Act
        let openCC = try await OpenCC.load(from: url)
        
        // Assert
        let result: String = openCC.converter("腳踏車", from: .traditionalChinese(idom: true), to: .simplifiedChinese)
        let expect: String = "自行车"
        
        XCTAssertEqual(result, expect)
    }
}
