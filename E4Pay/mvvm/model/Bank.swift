//
//  BankInfo.swift
//  E4Pay
//
//  Created by 20-N311 on 1/17/24.
//

import Foundation

// MARK: - BankInfo
struct Bank: Codable {
    let rpsCatgCD, rpsCD, rpsMsg: String
    let lists: [BankList]

    enum CodingKeys: String, CodingKey {
        case rpsCatgCD = "rpsCatgCd"
        case rpsCD = "rpsCd"
        case rpsMsg, lists
    }
}

// MARK: - List
struct BankList: Codable {
    let fsOrtEmpNo, fsOrtDtlDtm, lsOrtEmpNo, lsOrtDtlDtm: JSONNull?
    let instID, instClCD, instCD, instNm: String
    let epsSeq: Int
    let useYn: UseYn
    let imgNm, imgURL: String

    enum CodingKeys: String, CodingKey {
        case fsOrtEmpNo, fsOrtDtlDtm, lsOrtEmpNo, lsOrtDtlDtm
        case instID = "instId"
        case instClCD = "instClCd"
        case instCD = "instCd"
        case instNm, epsSeq, useYn, imgNm
        case imgURL = "imgUrl"
    }
}

enum UseYn: String, Codable {
    case n = "N"
    case y = "Y"
}

// MARK: - Encode/decode helpers

class JSONNull: Codable, Hashable {

    public static func == (lhs: JSONNull, rhs: JSONNull) -> Bool {
        return true
    }

    public var hashValue: Int {
        return 0
    }

    public init() {}

    public required init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if !container.decodeNil() {
            throw DecodingError.typeMismatch(JSONNull.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for JSONNull"))
        }
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encodeNil()
    }
}
