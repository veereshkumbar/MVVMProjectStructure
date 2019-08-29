//
//  Enums.swift
//  RAP
//
//  Created by GLB-254 on 8/20/19.
//  Copyright © 2019 GLB-254. All rights reserved.
//

import Foundation
enum MessageOptions:String{
    case Info
    case Forward
    case Delete
    case Reply
    case Copy
}

enum MessageTypes:String{
    case Text = "0"
    case Image = "1"
    case Video = "2"
    case Document = "3"
    case Contact = "4"
    case Audio = "5"
    case Location = "6"
    case Group_Notifications = "Group_Notifications"
}

enum MessageCellIdentifiers:String{
    case rightTextCell = "rightTextCell"
    case rightImageCell = "rightImageCell"
    case rightDocPdfCell = "rightDocPdfCell"
    case rightDocCell = "rightDocCell"
    case rightContactCell = "rightContactCell"
    case rightAudioCell = "rightAudioCell"
    case groupNotificationsCell = "groupNotificationsCell"
    case leftTextCell = "leftTextCell"
    case leftGroupTextCell = "leftGroupTextCell"
    case leftImageCell = "leftImageCell"
    case leftGroupImageCell = "leftGroupImageCell"
    case leftDocPdfCell = "leftDocPdfCell"
    case leftGroupDocPdfCell = "leftGroupDocPdfCell"
    case leftDocCell = "leftDocCell"
    case leftGroupDocCell = "leftGroupDocCell"
    case leftContactCell = "leftContactCell"
    case leftAudioCell = "leftAudioCell"
    case leftGroupAudioCell = "leftGroupAudioCell"
}
