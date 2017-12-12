import TitanCore

public extension RequestType {
  public var cookies: [String:String] {
    guard let cookieHeader = headers.first(where: { (name, _) -> Bool in
      let normalized = name.lowercased()
      return normalized == "cookie"
    }) else { return [:] }
    return cookieHeader.value.characters.split(separator: ";").map { chars -> String.CharacterView in
      return chars.drop(while: { (char: Character) in // Trim leading spaces
        return char == " "
      })
      }.reduce([String:String]()) { (dict, chars) -> [String:String] in
        let pair = chars.split(separator: "=")
        guard let name = pair.first, let value = pair.indices.contains(1) ? pair[1] : nil else {
          return dict
        }
        var d = dict
        d[String(name)] = String(value)
        return d
    }
  }
}

public extension ResponseType {
  public func setCookie(_ name: String, value: String) -> ResponseType {
    var newResp = self.copy()
    newResp.headers.append(("Set-Cookie", "\(name)=\(value)"))
    return newResp
  }
}

