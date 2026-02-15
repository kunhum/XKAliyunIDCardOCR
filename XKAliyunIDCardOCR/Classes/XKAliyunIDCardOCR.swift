//
//  XKAliyunIDCardOCR.swift
//  XKAliyunIDCardOCR
//
//  Created by Kenneth Tse on 2026/2/14.
//


import Foundation

open class XKAliyunIDCardOCR {
    
    // MARK: - OCR Type
    public enum OCRType {
        case idCard
        case driverLicense
        case vehicleLicense

        var url: String {
            switch self {
            case .idCard:
                return "https://cardpack.market.alicloudapi.com/rest/160601/ocr/ocr_idcard.json"
            case .driverLicense:
                return "https://cardpack.market.alicloudapi.com/rest/160601/ocr/ocr_driver_license.json"
            case .vehicleLicense:
                return "https://cardpack.market.alicloudapi.com/rest/160601/ocr/ocr_vehicle.json"
            }
        }
    }
    
    public enum IDCardFace: String {
        case front = "face"
        case back = "back"
    }

    public static let shared = XKAliyunIDCardOCR()

    private init() {}

    // Base64 encoded APPCODE
    private let appCodeBase64 = "NTk3NWMxZTcyODdkNDE3ZWJiY2Y2NjkzMTg5NjU0YzE="
    private var appCode: String {
        Data(base64Encoded: appCodeBase64)
            .flatMap { String(data: $0, encoding: .utf8) } ?? ""
    }

}

public extension XKAliyunIDCardOCR {
    
    func recognize(
        type: OCRType,
        imageURL: String,
        side: String? = nil
    ) async throws -> Data {

        guard let url = URL(string: type.url) else {
            throw URLError(.badURL)
        }

        // JSON Body
        var body: [String: Any] = [
            "image": imageURL
        ]

        if let side = side {
            body["configure"] = [
                "side": side
            ]
        }

        let jsonData = try JSONSerialization.data(withJSONObject: body)

        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.httpBody = jsonData

        request.setValue("APPCODE \(appCode)", forHTTPHeaderField: "Authorization")
        request.setValue("application/json; charset=UTF-8", forHTTPHeaderField: "Content-Type")

        let (data, response) = try await URLSession.shared.data(for: request)

        guard let http = response as? HTTPURLResponse else {
            throw URLError(.badServerResponse)
        }

        guard http.statusCode == 200 else {
            let error = String(data: data, encoding: .utf8) ?? ""
            throw NSError(domain: "OCR", code: http.statusCode, userInfo: [
                NSLocalizedDescriptionKey: error
            ])
        }
        // String(data: data, encoding: .utf8) ?? ""
        return data
    }
    
    func parseFrontIDCard(_ jsonData: Data) -> XKFrontIDCardInfo? {
        try? JSONDecoder().decode(XKFrontIDCardInfo.self, from: jsonData)
    }
    
    func parseBackIDCard(_ jsonData: Data) -> XKBackIDCardInfo? {
        try? JSONDecoder().decode(XKBackIDCardInfo.self, from: jsonData)
    }
    
    func parseDriverLicenseFront(_ jsonData: Data) -> XKDriverLicenseFront? {
        try? JSONDecoder().decode(XKDriverLicenseFront.self, from: jsonData)
    }
    
    func parseDriverLicenseBack(_ jsonData: Data) -> XKDriverLicenseBack? {
        try? JSONDecoder().decode(XKDriverLicenseBack.self, from: jsonData)
    }
    
    func parseVehicleLicenseFront(_ jsonData: Data) -> XKVehicleLicenseFront? {
        try? JSONDecoder().decode(XKVehicleLicenseFront.self, from: jsonData)
    }
    
    func parseVehicleLicenseBack(_ jsonData: Data) -> XKVehicleLicenseBack? {
        try? JSONDecoder().decode(XKVehicleLicenseBack.self, from: jsonData)
    }
    
}
