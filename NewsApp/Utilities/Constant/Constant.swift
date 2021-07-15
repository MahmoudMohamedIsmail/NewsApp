//
//  Constant.swift
//
//

import Foundation

struct Constants{
    static let baseURL = "https://newsapi.org/"

    static let api_Key = "" //Enter Your Api_Key
}

enum HTTPHeaderField: String {
    case authentication = "Authorization"
    case contentType = "Content-Type"
    case acceptType = "Accept"
    case acceptEncoding = "Accept-Encoding"
    case acceptLanguage = "Accept-Language"
}

enum ContentType: String {
    case json = "application/x-www-form-urlencoded; charset=utf-8"
    case applicationJson = "application/json"
    case accept = "*/*"
    case acceptEncoding = "gzip;q=1.0, compress;q=0.5"
    case multipart = "multipart/form-data"
}
