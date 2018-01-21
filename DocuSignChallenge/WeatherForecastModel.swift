//
//  WeatherForecastModel.swift
//  DocuSignChallenge
//
//  Created by Joohan Oh on 2018-01-20.
//  Copyright © 2018 Joohan Oh. All rights reserved.
//

import Foundation
import UIKit
import ObjectMapper

/*
 "forecastday" : [
 {
 "period" : 0,
 "title" : "Saturday",
 "fcttext" : "Partly cloudy. Lows overnight in the low 40s.",
 "icon_url" : "http:\/\/icons.wxug.com\/i\/c\/k\/partlycloudy.gif",
 "fcttext_metric" : "Partly cloudy. Low 6C.",
 "pop" : "10",
 "icon" : "partlycloudy"
 },
 {
 "period" : 1,
 "title" : "Saturday Night",
 "fcttext" : "Partly cloudy skies. Low 43F. Winds W at 10 to 15 mph.",
 "icon_url" : "http:\/\/icons.wxug.com\/i\/c\/k\/nt_partlycloudy.gif",
 "fcttext_metric" : "Some clouds. Low 6C. Winds W at 10 to 15 km\/h.",
 "pop" : "10",
 "icon" : "nt_partlycloudy"
 },
 {
 "period" : 2,
 "title" : "Sunday",
 "fcttext" : "Cloudy. High 54F. Winds S at 5 to 10 mph.",
 "icon_url" : "http:\/\/icons.wxug.com\/i\/c\/k\/cloudy.gif",
 "fcttext_metric" : "Cloudy. High 12C. Winds S at 10 to 15 km\/h.",
 "pop" : "10",
 "icon" : "cloudy"
 },
 {
 "period" : 3,
 "title" : "Sunday Night",
 "fcttext" : "Cloudy with periods of rain. Low around 50F. Winds S at 10 to 15 mph. Chance of rain 100%. Rainfall around a half an inch.",
 "icon_url" : "http:\/\/icons.wxug.com\/i\/c\/k\/nt_rain.gif",
 "fcttext_metric" : "Rain. Low near 10C. Winds S at 15 to 25 km\/h. Chance of rain 100%. Rainfall near 12mm.",
 "pop" : "100",
 "icon" : "nt_rain"
 },
 {
 "period" : 4,
 "title" : "Monday",
 "fcttext" : "Showers in the morning, then partly cloudy in the afternoon. High around 55F. Winds WSW at 5 to 10 mph. Chance of rain 50%.",
 "icon_url" : "http:\/\/icons.wxug.com\/i\/c\/k\/chancerain.gif",
 "fcttext_metric" : "Showers in the morning, then partly cloudy in the afternoon. High 13C. Winds WSW at 10 to 15 km\/h. Chance of rain 50%.",
 "pop" : "50",
 "icon" : "chancerain"
 },
 {
 "period" : 5,
 "title" : "Monday Night",
 "fcttext" : "Partly cloudy skies. Low near 45F. Winds light and variable.",
 "icon_url" : "http:\/\/icons.wxug.com\/i\/c\/k\/nt_partlycloudy.gif",
 "fcttext_metric" : "Some clouds early will give way to generally clear conditions overnight. Low 7C. Winds light and variable.",
 "pop" : "10",
 "icon" : "nt_partlycloudy"
 },
 {
 "period" : 6,
 "title" : "Tuesday",
 "fcttext" : "Partly cloudy. High 56F. Winds light and variable.",
 "icon_url" : "http:\/\/icons.wxug.com\/i\/c\/k\/partlycloudy.gif",
 "fcttext_metric" : "Intervals of clouds and sunshine. High 13C. Winds light and variable.",
 "pop" : "10",
 "icon" : "partlycloudy"
 },
 {
 "period" : 7,
 "title" : "Tuesday Night",
 "fcttext" : "Partly cloudy skies in the evening, then becoming cloudy overnight. Low 49F. Winds light and variable.",
 "icon_url" : "http:\/\/icons.wxug.com\/i\/c\/k\/nt_mostlycloudy.gif",
 "fcttext_metric" : "Partly cloudy during the evening followed by cloudy skies overnight. Low 9C. Winds light and variable.",
 "pop" : "10",
 "icon" : "nt_mostlycloudy"
 }
 ]
  */

class WeatherForecastModel: Mappable {
    var day:String!
    var description:String!
    var imageURL: String!
    
    required init?(map: Map){
        
    }
    
    init(){
        
    }
    
    func mapping(map: Map) {
        day <- map["title"]
        imageURL <- map["icon_url"]
        description <- map["fcttext"]
    }
}
