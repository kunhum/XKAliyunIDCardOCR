//
//  Models.swift
//  XKAliyunIDCardOCR
//
//  Created by Kenneth Tse on 2026/2/14.
//

import Foundation
// MARK: - Result
public struct XKFrontIDCardInfo: Codable {
    /// 姓名
    public let name: String
    /// 性别
    public let sex: String
    /// 民族
    public let nationality: String
    /// 出生
    public let birth: String
    /// 地址
    public let address: String
    /// 身份证号
    public let num: String
    /// 是否成功
    public let success: Bool
    /// 请求ID
    public let requestID: String
    /// 图片角度
    public let angle: Int
    /// 是否伪造
    public let isFake: Bool
    /// 身份证区域
    public let cardRegion: [AliOCRPoint]
    /// 人脸区域矩形
    public let faceRect: AliOCRFaceRect?
    /// 人脸区域顶点
    public let faceRectVertices: [AliOCRPoint]?

    enum CodingKeys: String, CodingKey {
        case name
        case sex
        case nationality
        case birth
        case address
        case num
        case success
        case angle
        case isFake = "is_fake"
        case requestID = "request_id"
        case cardRegion = "card_region"
        case faceRect = "face_rect"
        case faceRectVertices = "face_rect_vertices"
    }
}

// MARK: - Point
public struct AliOCRPoint: Codable {
    public let x: Int
    public let y: Int
}

// MARK: - Face Rect
public struct AliOCRFaceRect: Codable {
    public let angle: Int
    public let center: AliOCRPoint
    public let size: AliOCRSize
}

// MARK: - Size
public struct AliOCRSize: Codable {
    public let width: Int
    public let height: Int
}

// MARK: - Result
public struct XKBackIDCardInfo: Codable {

    /// 签发机关
    public let issue: String
    /// 开始日期
    public let startDate: String
    /// 结束日期
    public let endDate: String
    /// 是否成功
    public let success: Bool
    /// 请求ID
    public let requestID: String

    enum CodingKeys: String, CodingKey {
        case issue
        case success
        case startDate = "start_date"
        case endDate = "end_date"
        case requestID = "request_id"
    }
}

public struct XKDriverLicenseFront: Codable {

    /// 姓名
    public let name: String
    /// 性别
    public let sex: String
    /// 国籍
    public let nation: String
    /// 地址
    public let addr: String
    /// 驾驶证号
    public let num: String
    /// 出生日期
    public let birthDate: String
    /// 初次领证日期
    public let issueDate: String
    /// 有效期开始
    public let startDate: String
    /// 有效期结束
    public let endDate: String
    /// 签发机关
    public let issueOrganization: String
    /// 准驾车型
    public let vehicleType: String
    /// 请求ID
    public let requestID: String
    /// 是否成功
    public let success: Bool

    public init(
        name: String,
        sex: String,
        nation: String,
        addr: String,
        num: String,
        birthDate: String,
        issueDate: String,
        startDate: String,
        endDate: String,
        issueOrganization: String,
        vehicleType: String,
        requestID: String,
        success: Bool
    ) {
        self.name = name
        self.sex = sex
        self.nation = nation
        self.addr = addr
        self.num = num
        self.birthDate = birthDate
        self.issueDate = issueDate
        self.startDate = startDate
        self.endDate = endDate
        self.issueOrganization = issueOrganization
        self.vehicleType = vehicleType
        self.requestID = requestID
        self.success = success
    }

    enum CodingKeys: String, CodingKey {
        case name
        case sex
        case nation
        case addr
        case num
        case success
        case birthDate = "birth_date"
        case issueDate = "issue_date"
        case startDate = "start_date"
        case endDate = "end_date"
        case issueOrganization = "issue_organization"
        case vehicleType = "vehicle_type"
        case requestID = "request_id"
    }
}

public struct XKDriverLicenseBack: Codable {

    /// 档案编号
    public let archiveNo: String?

    /// 配置字符串（包含 side=back）
    public let configStr: String?

    /// 姓名
    public let name: String?

    /// 身份证号
    public let num: String?

    /// 副页记录内容（如实习期）
    public let record: String?

    /// 请求ID
    public let requestId: String?

    /// 是否识别成功
    public let success: Bool?

    public init(
        archiveNo: String?,
        configStr: String?,
        name: String?,
        num: String?,
        record: String?,
        requestId: String?,
        success: Bool?
    ) {
        self.archiveNo = archiveNo
        self.configStr = configStr
        self.name = name
        self.num = num
        self.record = record
        self.requestId = requestId
        self.success = success
    }

    enum CodingKeys: String, CodingKey {
        case archiveNo = "archive_no"
        case configStr = "config_str"
        case name
        case num
        case record
        case requestId = "request_id"
        case success
    }
}

public struct XKVehicleLicenseFront: Codable {

    /// 所有人
    public let owner: String?

    /// 住址
    public let addr: String?

    /// 车牌号
    public let plateNum: String?

    /// 车辆类型
    public let vehicleType: String?

    /// 品牌型号
    public let model: String?

    /// 车辆识别代号 (VIN)
    public let vin: String?

    /// 发动机号
    public let engineNum: String?

    /// 注册日期
    public let registerDate: String?

    /// 发证日期
    public let issueDate: String?

    /// 发证机关
    public let issueAuthority: String?

    /// 使用性质
    public let useCharacter: String?

    /// 是否复印件
    public let isCopy: Bool?

    /// 请求ID
    public let requestId: String?

    /// 是否识别成功
    public let success: Bool?

    /// 原始配置字符串
    public let configStr: String?

    public init(
        owner: String?,
        addr: String?,
        plateNum: String?,
        vehicleType: String?,
        model: String?,
        vin: String?,
        engineNum: String?,
        registerDate: String?,
        issueDate: String?,
        issueAuthority: String?,
        useCharacter: String?,
        isCopy: Bool?,
        requestId: String?,
        success: Bool?,
        configStr: String?
    ) {
        self.owner = owner
        self.addr = addr
        self.plateNum = plateNum
        self.vehicleType = vehicleType
        self.model = model
        self.vin = vin
        self.engineNum = engineNum
        self.registerDate = registerDate
        self.issueDate = issueDate
        self.issueAuthority = issueAuthority
        self.useCharacter = useCharacter
        self.isCopy = isCopy
        self.requestId = requestId
        self.success = success
        self.configStr = configStr
    }

    enum CodingKeys: String, CodingKey {
        case owner
        case addr
        case model
        case vin
        case success
        case configStr = "config_str"

        case plateNum = "plate_num"
        case vehicleType = "vehicle_type"
        case engineNum = "engine_num"
        case registerDate = "register_date"
        case issueDate = "issue_date"
        case issueAuthority = "issue_authority"
        case useCharacter = "use_character"
        case isCopy = "is_copy"
        case requestId = "request_id"
    }
}

public struct XKVehicleLicenseBack: Codable {

    /// 核定载客人数
    public let approvedPassengerCapacity: String?

    /// 核定载质量
    public let approvedLoad: String?

    /// 允许载客人数（与 approvedPassengerCapacity 一致）
    public let appprovedPassengerCapacity: String?

    /// 条形码
    public let barcodeNumber: String?

    /// 能源类型
    public let energyType: String?

    /// 文件编号
    public let fileNo: String?

    /// 总质量
    public let grossMass: String?

    /// 检验记录
    public let inspectionRecord: String?

    /// 是否复印件
    public let isCopy: Bool?

    /// 外廓尺寸
    public let overallDimension: String?

    /// 车牌号
    public let plateNum: String?

    /// 请求ID
    public let requestId: String?

    /// 是否识别成功
    public let success: Bool?

    /// 牵引总质量
    public let tractionMass: String?

    /// 整备质量
    public let unladenMass: String?

    /// 原始配置字符串
    public let configStr: String?

    public init(
        approvedPassengerCapacity: String?,
        approvedLoad: String?,
        appprovedPassengerCapacity: String?,
        barcodeNumber: String?,
        energyType: String?,
        fileNo: String?,
        grossMass: String?,
        inspectionRecord: String?,
        isCopy: Bool?,
        overallDimension: String?,
        plateNum: String?,
        requestId: String?,
        success: Bool?,
        tractionMass: String?,
        unladenMass: String?,
        configStr: String?
    ) {
        self.approvedPassengerCapacity = approvedPassengerCapacity
        self.approvedLoad = approvedLoad
        self.appprovedPassengerCapacity = appprovedPassengerCapacity
        self.barcodeNumber = barcodeNumber
        self.energyType = energyType
        self.fileNo = fileNo
        self.grossMass = grossMass
        self.inspectionRecord = inspectionRecord
        self.isCopy = isCopy
        self.overallDimension = overallDimension
        self.plateNum = plateNum
        self.requestId = requestId
        self.success = success
        self.tractionMass = tractionMass
        self.unladenMass = unladenMass
        self.configStr = configStr
    }

    enum CodingKeys: String, CodingKey {
        case approvedPassengerCapacity = "approved_passenger_capacity"
        case approvedLoad = "approved_load"
        case appprovedPassengerCapacity = "appproved_passenger_capacity"
        case barcodeNumber = "barcode_number"
        case energyType = "energy_type"
        case fileNo = "file_no"
        case grossMass = "gross_mass"
        case inspectionRecord = "inspection_record"
        case isCopy = "is_copy"
        case overallDimension = "overall_dimension"
        case plateNum = "plate_num"
        case requestId = "request_id"
        case success
        case tractionMass = "traction_mass"
        case unladenMass = "unladen_mass"
        case configStr = "config_str"
    }
}
