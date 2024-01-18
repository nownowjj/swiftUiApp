//
//  URL_TYPE.swift
//  E4Pay
//
//  Created by 20-N311 on 1/14/24.
//

import Foundation

enum RequestUrl: String {
    
    case DAUM_API = "https://nownowjj.github.io/daumApi/"
    case NAVER_PAGE = "https://www.naver.com"
    
    // MARK: - INTRO , LOGIN
    case CHECK_UUID = "http://192.168.10.150:48080/member/checkuuid"
    
    // MARK: - BANK
    case BANKLIST = "http://192.168.10.150:48080/system/getFncInst?instClCd=100"

    // MARK: - CERT
    case COOL_SMS_REQUEST = "http://192.168.10.150:48080/member/getcool-sms"

    // MARK: - CERT
    case REGISTER = "http://192.168.10.150:48080/member/register"

    
}
