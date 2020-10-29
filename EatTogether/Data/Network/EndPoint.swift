//
//  EndPoint.swift
//  EatTogether
//
//  Created by 박진수 on 2020/09/03.
//  Copyright © 2020 FourMan. All rights reserved.
//

import Foundation
import Alamofire

protocol EndPointType {
    var baseURL: String { get }
    var url: URL { get }
    var httpMethod: HTTPMethod { get }
    var header: [String:String]? { get }
    var paramEncoding: ParameterEncoding { get }
}

enum EndPoint {
    
}
