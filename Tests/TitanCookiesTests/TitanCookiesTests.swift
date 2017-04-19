import XCTest
import TitanCookies
import TitanCore

final class TitanCookiesTests: XCTestCase {
  func testSaneCookieParsingCase() {
    let cookieValue = "session=123456; other_cookie=97654"
    let request = Request(method: "", path: "", body: "", headers: [("coOkiE", cookieValue)])
    XCTAssertEqual(request.cookies, ["session":"123456", "other_cookie": "97654"])
  }
  func testDegradesGracefully() {
    let request = Request(method: "", path: "", body: "", headers: [("coOkiE", "something/whatever this is a cookie;;;hello=cookie")])

    XCTAssertEqual(request.cookies, ["hello": "cookie"])
  }
}
