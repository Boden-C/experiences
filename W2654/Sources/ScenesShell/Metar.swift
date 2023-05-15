import Foundation

class Metar: CustomStringConvertible {
    let raw_text: String?
    let station_id: String?
    let observation_time: String?
    let latitude: Double?
    let longitude: Double?
    let temp_c: Double?
    let dewpoint_c: Double?
    let wind_dir_degrees: Int?
    let wind_speed_kt: Int?
    let wind_gust_kt: Int?
    let visibility_statute_mi: Double?
    let altim_in_hg: Double?
    let sea_level_pressure_mb: Double?
    let corrected: Bool?
    let auto: Bool?
    let auto_station: Bool?
    let maintenance_indicator_on: Bool?
    let no_signal: Bool?
    let lightning_sensor_off: Bool?
    let freezing_rain_sensor_off: Bool?
    let present_weather_sensor_off: Bool?
    let wx_string: String?
    let sky_cover1: String?
    let cloud_base_ft_agl1: Int?
    let sky_cover2: String?
    let cloud_base_ft_agl2: Int?
    let sky_cover3: String?
    let cloud_base_ft_agl3: Int?
    let sky_cover4: String?
    let cloud_base_ft_agl4: Int?
    let flight_category: String?
    let three_hr_pressure_tendency_mb: Double?
    let maxT_c: Double?
    let minT_c: Double?
    let maxT24hr_c: Double?
    let minT24hr_c: Double?
    let precip_in: Double?
    let pcp3hr_in: Double?
    let pcp6hr_in: Double?
    let pcp24hr_in: Double?
    let snow_in: Double?
    let vert_vis_ft: Int?
    let metar_type: String?
    let elevation_m: Double?

    init(
        raw_text: String?, station_id: String?, observation_time: String?, latitude: Double?,
        longitude: Double?, temp_c: Double?, dewpoint_c: Double?, wind_dir_degrees: Int?,
        wind_speed_kt: Int?, wind_gust_kt: Int?, visibility_statute_mi: Double?,
        altim_in_hg: Double?, sea_level_pressure_mb: Double?, corrected: Bool?, auto: Bool?,
        auto_station: Bool?, maintenance_indicator_on: Bool?, no_signal: Bool?,
        lightning_sensor_off: Bool?, freezing_rain_sensor_off: Bool?,
        present_weather_sensor_off: Bool?, wx_string: String?, sky_cover1: String?,
        cloud_base_ft_agl1: Int?, sky_cover2: String?, cloud_base_ft_agl2: Int?,
        sky_cover3: String?, cloud_base_ft_agl3: Int?, sky_cover4: String?,
        cloud_base_ft_agl4: Int?, flight_category: String?, three_hr_pressure_tendency_mb: Double?,
        maxT_c: Double?, minT_c: Double?, maxT24hr_c: Double?, minT24hr_c: Double?,
        precip_in: Double?, pcp3hr_in: Double?, pcp6hr_in: Double?, pcp24hr_in: Double?,
        snow_in: Double?, vert_vis_ft: Int?, metar_type: String?, elevation_m: Double?
    ) {
        self.raw_text = raw_text
        self.station_id = station_id
        self.observation_time = observation_time
        self.latitude = latitude
        self.longitude = longitude
        self.temp_c = temp_c
        self.dewpoint_c = dewpoint_c
        self.wind_dir_degrees = wind_dir_degrees
        self.wind_speed_kt = wind_speed_kt
        self.wind_gust_kt = wind_gust_kt
        self.visibility_statute_mi = visibility_statute_mi
        self.altim_in_hg = altim_in_hg
        self.sea_level_pressure_mb = sea_level_pressure_mb
        self.corrected = corrected
        self.auto = auto
        self.auto_station = auto_station
        self.maintenance_indicator_on = maintenance_indicator_on
        self.no_signal = no_signal
        self.lightning_sensor_off = lightning_sensor_off
        self.freezing_rain_sensor_off = freezing_rain_sensor_off
        self.present_weather_sensor_off = present_weather_sensor_off
        self.wx_string = wx_string
        self.sky_cover1 = sky_cover1
        self.cloud_base_ft_agl1 = cloud_base_ft_agl1
        self.sky_cover2 = sky_cover2
        self.cloud_base_ft_agl2 = cloud_base_ft_agl2
        self.sky_cover3 = sky_cover3
        self.cloud_base_ft_agl3 = cloud_base_ft_agl3
        self.sky_cover4 = sky_cover4
        self.cloud_base_ft_agl4 = cloud_base_ft_agl4
        self.flight_category = flight_category
        self.three_hr_pressure_tendency_mb = three_hr_pressure_tendency_mb
        self.maxT_c = maxT_c
        self.minT_c = minT_c
        self.maxT24hr_c = maxT24hr_c
        self.minT24hr_c = minT24hr_c
        self.precip_in = precip_in
        self.pcp3hr_in = pcp3hr_in
        self.pcp6hr_in = pcp6hr_in
        self.pcp24hr_in = pcp24hr_in
        self.snow_in = snow_in
        self.vert_vis_ft = vert_vis_ft
        self.metar_type = metar_type
        self.elevation_m = elevation_m
    }

    init(
        raw_text: String?, station_id: String?, observation_time: String?, latitude: String?,
        longitude: String?, temp_c: String?, dewpoint_c: String?, wind_dir_degrees: String?,
        wind_speed_kt: String?, wind_gust_kt: String?, visibility_statute_mi: String?,
        altim_in_hg: String?, sea_level_pressure_mb: String?, corrected: String?, auto: String?,
        auto_station: String?, maintenance_indicator_on: String?, no_signal: String?,
        lightning_sensor_off: String?, freezing_rain_sensor_off: String?,
        present_weather_sensor_off: String?, wx_string: String?, sky_cover1: String?,
        cloud_base_ft_agl1: String?, sky_cover2: String?, cloud_base_ft_agl2: String?,
        sky_cover3: String?, cloud_base_ft_agl3: String?, sky_cover4: String?,
        cloud_base_ft_agl4: String?, flight_category: String?, three_hr_pressure_tendency_mb: String?,
        maxT_c: String?, minT_c: String?, maxT24hr_c: String?, minT24hr_c: String?,
        precip_in: String?, pcp3hr_in: String?, pcp6hr_in: String?, pcp24hr_in: String?,
        snow_in: String?, vert_vis_ft: String?, metar_type: String?, elevation_m: String?
    ) {
        func extractInt(_ string: String?) -> Int? {
            if let nonNil = string {
                if let number = Int(nonNil) {
                    return number
                } else {
                    print("Could not extract an int from \(nonNil), returning nil")
                    return nil
                }
            } else {
                return nil
            }
        }
        func extractDouble(_ string: String?) -> Double? {
            if let nonNil = string {
                if let number = Double(nonNil) {
                    return number
                } else {
                    print("Could not extract an int from \(nonNil), returning nil")
                    return nil
                }
            } else {
                return nil
            }
        }
        func extractBool(_ string: String?) -> Bool? {
            if let nonNil = string {
                if nonNil.uppercased().contains("TRUE") {
                    return true
                } else if nonNil.uppercased().contains("FALSE") {
                    return false
                } else {
                    print("Could not extract a bool from \(nonNil), returning nil")
                    return nil
                }
            } else {
                return nil
            }
        }

        self.raw_text = raw_text
        self.station_id = station_id
        self.observation_time = observation_time
        self.latitude = extractDouble(latitude)
        self.longitude = extractDouble(longitude)
        self.temp_c = extractDouble(temp_c)
        self.dewpoint_c = extractDouble(dewpoint_c)
        self.wind_dir_degrees = extractInt(wind_dir_degrees)
        self.wind_speed_kt = extractInt(wind_speed_kt)
        self.wind_gust_kt = extractInt(wind_gust_kt)
        self.visibility_statute_mi = extractDouble(visibility_statute_mi)
        self.altim_in_hg = extractDouble(altim_in_hg)
        self.sea_level_pressure_mb = extractDouble(sea_level_pressure_mb)
        self.corrected = extractBool(corrected)
        self.auto = extractBool(auto)
        self.auto_station = extractBool(auto_station)
        self.maintenance_indicator_on = extractBool(maintenance_indicator_on)
        self.no_signal = extractBool(no_signal)
        self.lightning_sensor_off = extractBool(lightning_sensor_off)
        self.freezing_rain_sensor_off = extractBool(freezing_rain_sensor_off)
        self.present_weather_sensor_off = extractBool(present_weather_sensor_off)
        self.wx_string = wx_string
        self.sky_cover1 = sky_cover1
        self.cloud_base_ft_agl1 = extractInt(cloud_base_ft_agl1)
        self.sky_cover2 = sky_cover2
        self.cloud_base_ft_agl2 = extractInt(cloud_base_ft_agl2)
        self.sky_cover3 = sky_cover3
        self.cloud_base_ft_agl3 = extractInt(cloud_base_ft_agl3)
        self.sky_cover4 = sky_cover4
        self.cloud_base_ft_agl4 = extractInt(cloud_base_ft_agl4)
        self.flight_category = flight_category
        self.three_hr_pressure_tendency_mb = extractDouble(three_hr_pressure_tendency_mb)
        self.maxT_c = extractDouble(maxT_c)
        self.minT_c = extractDouble(minT_c)
        self.maxT24hr_c = extractDouble(maxT24hr_c)
        self.minT24hr_c = extractDouble(minT24hr_c)
        self.precip_in = extractDouble(precip_in)
        self.pcp3hr_in = extractDouble(pcp3hr_in)
        self.pcp6hr_in = extractDouble(pcp6hr_in)
        self.pcp24hr_in = extractDouble(pcp24hr_in)
        self.snow_in = extractDouble(snow_in)
        self.vert_vis_ft = extractInt(vert_vis_ft)
        self.metar_type = metar_type
        self.elevation_m = extractDouble(elevation_m)
    }

    init?(string:String) {
        func extractInt(_ string: String?) -> Int? {
            if let nonNil = string {
                if let number = Int(nonNil) {
                    return number
                } else {
                    print("Could not extract an int from \(nonNil), returning nil")
                    return nil
                }
            } else {
                return nil
            }
        }
        func extractDouble(_ string: String?) -> Double? {
            if let nonNil = string {
                if let number = Double(nonNil) {
                    return number
                } else {
                    print("Could not extract an int from \(nonNil), returning nil")
                    return nil
                }
            } else {
                return nil
            }
        }
        func extractBool(_ string: String?) -> Bool? {
            if let nonNil = string {
                if nonNil.uppercased().contains("TRUE") {
                    return true
                } else if nonNil.uppercased().contains("FALSE") {
                    return false
                } else {
                    print("Could not extract a bool from \(nonNil), returning nil")
                    return nil
                }
            } else {
                return nil
            }
        }

        let fields = string.components(separatedBy: ",").map({$0.isEmpty ? nil : String($0)})
        if (fields.count < 43) {
            print("Could not parse \(string)")
            return nil
        }
        self.raw_text = fields[0]
        self.station_id = fields[1]
        self.observation_time = fields[2]
        self.latitude = extractDouble(fields[3])
        self.longitude = extractDouble(fields[4])
        self.temp_c = extractDouble(fields[5])
        self.dewpoint_c = extractDouble(fields[6])
        self.wind_dir_degrees = extractInt(fields[7])
        self.wind_speed_kt = extractInt(fields[8])
        self.wind_gust_kt = extractInt(fields[9])
        self.visibility_statute_mi = extractDouble(fields[10])
        self.altim_in_hg = extractDouble(fields[11])
        self.sea_level_pressure_mb = extractDouble(fields[12])
        self.corrected = extractBool(fields[13])
        self.auto = extractBool(fields[14])
        self.auto_station = extractBool(fields[15])
        self.maintenance_indicator_on = extractBool(fields[16])
        self.no_signal = extractBool(fields[17])
        self.lightning_sensor_off = extractBool(fields[18])
        self.freezing_rain_sensor_off = extractBool(fields[19])
        self.present_weather_sensor_off = extractBool(fields[20])
        self.wx_string = fields[21]
        self.sky_cover1 = fields[22]
        self.cloud_base_ft_agl1 = extractInt(fields[23])
        self.sky_cover2 = fields[24]
        self.cloud_base_ft_agl2 = extractInt(fields[25])
        self.sky_cover3 = fields[26]
        self.cloud_base_ft_agl3 = extractInt(fields[27])
        self.sky_cover4 = fields[28]
        self.cloud_base_ft_agl4 = extractInt(fields[29])
        self.flight_category = fields[30]
        self.three_hr_pressure_tendency_mb = extractDouble(fields[31])
        self.maxT_c = extractDouble(fields[32])
        self.minT_c = extractDouble(fields[33])
        self.maxT24hr_c = extractDouble(fields[34])
        self.minT24hr_c = extractDouble(fields[35])
        self.precip_in = extractDouble(fields[36])
        self.pcp3hr_in = extractDouble(fields[37])
        self.pcp6hr_in = extractDouble(fields[38])
        self.pcp24hr_in = extractDouble(fields[39])
        self.snow_in = extractDouble(fields[40])
        self.vert_vis_ft = extractInt(fields[41])
        self.metar_type = fields[42]
        self.elevation_m = extractDouble(fields[43])
    }

    init(raw_text:String) {
        let fields = raw_text.components(separatedBy: .whitespaces)
        
        var index = 0
        
        self.raw_text = raw_text
        self.metar_type = { () in
            if (fields[index] == "METAR" || fields[index] == "SPECI") {
                index += 1
                return fields[index-1]
            } else {
                return nil    
            }
        }()
        self.station_id = { () in
            if (fields[index].count == 4) {
                index += 1
                return fields[index-1]
            } else {
                return nil    
            }
        }()
        self.observation_time = { () in
            if (fields[index].count == 7) {
                index += 1
                return fields[index-1]
            } else {
                return nil    
            }
        }()
        self.auto = { () in
            if (fields[index] == "AUTO") {
                index += 1
                return true
            } else {
                return nil    
            }
        }()
        self.corrected = { () in
            if (fields[index] == "COR") {
                index += 1
                return true
            } else {
                return nil    
            }
        }()
        if (fields[index].hasSuffix("KT")) {
            var wind = fields[index]

            self.wind_dir_degrees = Int(wind.prefix(3)) ?? nil
            wind.removeFirst(3)
            self.wind_speed_kt = Int(wind.prefix(2)) ?? nil
            wind.removeFirst(2)
            self.wind_gust_kt = { () in
                if wind.prefix(1) == "G" {
                    wind.removeFirst(1)
                    return Int(wind.prefix(2)) ?? nil
                } else { return nil }
            }()

            index += 1
        } else {
            self.wind_dir_degrees = nil
            self.wind_speed_kt = nil
            self.wind_gust_kt = nil
        }
        self.visibility_statute_mi = { () in
            if let visibilitySubstring = (Double(fields[index].dropLast(2)) ?? nil) {
                if fields[index].hasSuffix("SM") {
                    index += 1
                    return visibilitySubstring
                } else {
                    return visibilitySubstring / 1609.0
                }
            } else {
                return nil
            }
        }()

        let weatherPrefixes = ["SKC", "NCD", "CLR", "NSC", "FEW", "SCT", "BKN", "OVC", "TCU", "CB", "VV"]

        self.wx_string = { () in
            if !(weatherPrefixes.contains(where: fields[index].hasPrefix)) {
                index += 1
                return fields[index-1]
            } else {
                return nil    
            }
        }()
        if (weatherPrefixes.contains(where: fields[index].hasPrefix)) {
            
            self.cloud_base_ft_agl1 = Int(fields[index].suffix(3)) ?? nil
            self.sky_cover1 = String(fields[index].dropLast(3))

            index += 1
        } else {   

            self.cloud_base_ft_agl1 = nil
            self.sky_cover1 = nil

        }
        if (weatherPrefixes.contains(where: fields[index].hasPrefix)) {
            
            self.cloud_base_ft_agl2 = Int(fields[index].suffix(3)) ?? nil
            self.sky_cover2 = String(fields[index].dropLast(3))

            index += 1
        } else {   

            self.cloud_base_ft_agl2 = nil
            self.sky_cover2 = nil

        }
        if (weatherPrefixes.contains(where: fields[index].hasPrefix)) {
            
            self.cloud_base_ft_agl3 = Int(fields[index].suffix(3)) ?? nil
            self.sky_cover3 = String(fields[index].dropLast(3))

            index += 1
        } else {   

            self.cloud_base_ft_agl3 = nil
            self.sky_cover3 = nil

        }
        if (weatherPrefixes.contains(where: fields[index].hasPrefix)) {
            
            self.cloud_base_ft_agl4 = Int(fields[index].suffix(3)) ?? nil
            self.sky_cover4 = String(fields[index].dropLast(3))

            index += 1
        } else {   

            self.cloud_base_ft_agl4 = nil
            self.sky_cover4 = nil

        }
        
        self.temp_c = Double(fields[index]) ?? nil
        index += 1
        self.dewpoint_c = Double(fields[index]) ?? nil
        index += 1
        self.altim_in_hg = Double(fields[index]) ?? nil
        
        //The rest is not included in the raw_text
        self.latitude = nil
        self.longitude = nil
        self.sea_level_pressure_mb = nil
        self.auto_station = nil
        self.maintenance_indicator_on = nil
        self.no_signal = nil
        self.lightning_sensor_off = nil
        self.freezing_rain_sensor_off = nil
        self.present_weather_sensor_off = nil
        self.flight_category = nil
        self.three_hr_pressure_tendency_mb = nil
        self.maxT_c = nil
        self.minT_c = nil
        self.maxT24hr_c = nil
        self.minT24hr_c = nil
        self.precip_in = nil
        self.pcp3hr_in = nil
        self.pcp6hr_in = nil
        self.pcp24hr_in = nil
        self.snow_in = nil
        self.vert_vis_ft = nil
        self.elevation_m = nil
    }

    var description: String {
        let mirror = Mirror(reflecting: self)
        var str = ""
        for child in mirror.children {
            if let label = child.label, let value = child.value as? CustomStringConvertible {
                str += "\(label): \(value), "
            }
        }
        if str.count >= 2 {
            str = String(str.prefix(str.count - 2))
        }
        return str
    }

}

