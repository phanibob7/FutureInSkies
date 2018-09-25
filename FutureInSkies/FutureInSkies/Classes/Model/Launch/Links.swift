//
//  Links.swift
//  FutureInSkies
//
//  Created by phanindra on 22/09/18.
//  Copyright © 2018 Phanibob. All rights reserved.
//

import Foundation

struct Links: Decodable {
    var missionPatch: String?
    var missionPatchSmall: String?
    var redditCampaign: String?
    var redditLaunch: String?
    var redditRecovery: String?
    var redditMedia: String?
    var presskit: String?
    var articleLink: String?
    var wikipedia: String?
    var videoLink: String?
    var flickrImages: [String]?
    
    private enum CodingKeys: String, CodingKey {
        case missionPatch = "mission_patch"
        case missionPatchSmall = "mission_patch_small"
        case redditCampaign = "reddit_campaign"
        case redditLaunch = "reddit_launch"
        case redditRecovery = "reddit_recovery"
        case redditMedia = "reddit_media"
        case articleLink = "article_link"
        case videoLink = "video_link"
        case flickrImages = "flickr_images"
        case presskit, wikipedia
    }
}

/*
 "mission_patch":"https://images2.imgbox.com/ba/db/3plcm5IB_o.png",
 "mission_patch_small":"https://images2.imgbox.com/2d/d2/jStsqeLC_o.png",
 "reddit_campaign":"https://www.reddit.com/r/spacex/comments/95cte4/telstar_18v_apstar_5c_launch_campaign_thread/",
 "reddit_launch":"https://www.reddit.com/r/spacex/comments/9e7bmq/rspacex_telstar_18v_official_launch_discussion/",
 "reddit_recovery":"https://www.reddit.com/r/spacex/comments/9erxlh/telstar_18_vantage_recovery_thread/",
 "reddit_media":"https://www.reddit.com/r/spacex/comments/9ebkqw/rspacex_telstar_18v_media_thread_videos_images/",
 "presskit":"https://www.spacex.com/sites/spacex/files/telstar18vantagepresskit.pdf",
 "article_link":"https://spaceflightnow.com/2018/09/10/spacex-telesat-achieve-repeat-success-with-midnight-hour-launch/",
 "wikipedia":"https://en.wikipedia.org/wiki/Telstar_18V",
 "video_link":"https://www.youtube.com/watch?v=Apw3xqwsG1U",
 "flickr_images":[
 "https://farm2.staticflickr.com/1878/43690848045_492ef182dd_o.jpg",
 "https://farm2.staticflickr.com/1856/43881229604_6d42e838b6_o.jpg",
 "https://farm2.staticflickr.com/1852/43881223704_93777e34af_o.jpg",
 "https://farm2.staticflickr.com/1841/43881217094_558b7b214e_o.jpg",
 "https://farm2.staticflickr.com/1869/43881193934_423eff8c86_o.jpg"
 ]
 */
