//
//  MockUsersService.swift
//  swiftUItestApp
//
//  Created by Narek Stepanyan on 25.07.2020.
//  Copyright © 2020 NRKK.DEV. All rights reserved.
//

import Foundation
import Combine

struct MockUsersService: UsersDataManager {
    func fetchUsers() -> AnyPublisher<[UserInfo], Never> {
        let json = """
[
   {
      "_id":"5d99e66196ab4577d5522064",
      "firstName":"User",
      "lastName":"First",
      "email":"one@yandex.ru",
      "avatarURL":"http://nrkk.ru/frogogoTestAppAvatars/avatar7.png",
      "updatedAt":"2020-07-25T12:43:11.037Z",
      "createdAt":"2019-10-06T13:04:33.962Z"
   },
   {
      "_id":"5d99e69136269b77d85c9cea",
      "firstName":"User",
      "lastName":"Second",
      "email":"two@yandex.ru",
      "avatarURL":"http://nrkk.ru/frogogoTestAppAvatars/avatar6.png",
      "updatedAt":"2020-07-25T12:43:04.104Z",
      "createdAt":"2019-10-06T13:05:21.778Z"
   },
   {
      "_id":"5d99e76cea48e577dc3e1e00",
      "firstName":"User",
      "lastName":"Third",
      "email":"three@yandex.ru",
      "avatarURL":"http://nrkk.ru/frogogoTestAppAvatars/avatar5.png",
      "updatedAt":"2020-07-25T12:42:57.601Z",
      "createdAt":"2019-10-06T13:09:00.060Z"
   },
   {
      "_id":"5d99e80e656e3677efe562c1",
      "firstName":"User",
      "lastName":"Fourth",
      "email":"four@yandex.ru",
      "avatarURL":"http://nrkk.ru/frogogoTestAppAvatars/avatar4.png",
      "updatedAt":"2020-07-25T12:42:51.373Z",
      "createdAt":"2019-10-06T13:11:42.728Z"
   },
   {
      "_id":"5d99ed7ed58238796ce3ef0c",
      "firstName":"User",
      "lastName":"Fifth",
      "email":"five@yandex.ru",
      "avatarURL":"http://nrkk.ru/frogogoTestAppAvatars/avatar3.png",
      "updatedAt":"2020-07-25T12:42:44.924Z",
      "createdAt":"2019-10-06T13:34:54.759Z"
   },
   {
      "_id":"5f18a18f9132b13218a9fb58",
      "firstName":"User",
      "lastName":"Sixth",
      "email":"six@yandex.ru",
      "avatarURL":"http://nrkk.ru/frogogoTestAppAvatars/avatar2.png",
      "updatedAt":"2020-07-25T12:42:38.255Z",
      "createdAt":"2020-07-22T20:29:03.241Z"
   },
   {
      "_id":"5f1b2f7af46b35331a267289",
      "firstName":"User",
      "lastName":"Seventh",
      "email":"seven@yandex.ru",
      "avatarURL":"http://nrkk.ru/frogogoTestAppAvatars/avatar1.png",
      "updatedAt":"2020-07-25T12:43:41.642Z",
      "createdAt":"2020-07-24T18:59:06.055Z"
   }
]
"""
        let data = json.data(using: .utf8)!
        let result = try? JSONDecoder().decode([UserInfo].self, from: data)
        return Just(result ?? [])
            .eraseToAnyPublisher()
    }
}
