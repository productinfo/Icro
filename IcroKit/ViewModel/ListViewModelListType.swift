//
//  Created by martin on 25.11.18.
//  Copyright © 2018 Martin Hartl. All rights reserved.
//

import Foundation

public extension ListViewModel.ListType {
    public var resource: Resource<ItemResponse> {
        switch self {
        case .timeline:
            return Item.all()
        case .photos:
            return Item.photos
        case .mentions:
            return Item.mentions
        case .favorites:
            return Item.favorites
        case .discover:
            return Item.discover
        case .discoverCollection(let category):
            return Item.discoverCollection(for: category)
        case .user(let user):
            return Item.resource(forAuthor: user)
        case .conversation(let item):
            return item.conversation
        case .username(let username):
            return Item.usernamePostURL(for: username)
        }
    }

    public var title: String {
        switch self {
        case .timeline:
            return NSLocalizedString("LISTVIEWMODEL_RESOURCETITLE_TIMELINE", comment: "")
        case .photos:
            return NSLocalizedString("LISTVIEWMODEL_RESOURCETITLE_PHOTOS", comment: "")
        case .mentions:
            return NSLocalizedString("LISTVIEWMODEL_RESOURCETITLE_MENTIONS", comment: "")
        case .favorites:
            return NSLocalizedString("LISTVIEWMODEL_RESOURCETITLE_FAVORITES", comment: "")
        case .discover:
            return NSLocalizedString("LISTVIEWMODEL_RESOURCETITLE_DISCOVER", comment: "")
        case .discoverCollection(let category):
            return NSLocalizedString("LISTVIEWMODEL_RESOURCETITLE_DISCOVER", comment: "") + " - " + category.emoji
        case .user(let user):
            return user.username ?? ""
        case .username(let username):
            return username
        case .conversation:
            return NSLocalizedString("LISTVIEWMODEL_RESOURCETITLE_CONVERSATION", comment: "")
        }
    }

    public var image: XImage? {
        switch self {
        case .timeline:
            return XImage(named: "timeline")
        case .mentions:
            return XImage(named: "mentions")
        case .favorites:
            return XImage(named: "favorites")
        case .discover:
            return XImage(named: "discover")
        case .user, .username:
            return XImage(named: "profile")
        case .conversation, .photos, .discoverCollection:
            return nil
        }
    }

    public var tabTitle: String? {
        switch self {
        case .timeline:
            return NSLocalizedString("TABBARVIEWCONTROLLER_TABTILE_TIMELINE", comment: "")
        case .mentions:
            return NSLocalizedString("TABBARVIEWCONTROLLER_TABTILE_MENTIONS", comment: "")
        case .favorites:
            return NSLocalizedString("TABBARVIEWCONTROLLER_TABTILE_FAVORITES", comment: "")
        case .discover:
            return NSLocalizedString("TABBARVIEWCONTROLLER_TABTILE_DISCOVER", comment: "")
        case .user, .username:
            return NSLocalizedString("TABBARVIEWCONTROLLER_TABTILE_PROFILE", comment: "")
        case .conversation, .photos, .discoverCollection:
            return nil
        }
    }
}