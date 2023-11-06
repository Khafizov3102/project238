//
//  DataStore.swift
//  project238
//
//  Created by Денис Хафизов on 02.11.2023.
//

import Foundation

final class DataStore {
    static let shared = DataStore()
    
    let words = [
        "Quaint",
        "Eclectic",
        "Ubiquitous",
        "Serendipity",
        "Kaleidoscope",
        "Luminous",
        "Mellifluous",
        "Halcyon",
        "Ethereal",
        "Sonder",
        "Bucolic",
        "Ephemeral",
        "Aplomb",
        "Incandescent",
        "Idyllic"
    ]
    
    let translations = [
        "Прелестный",
        "Разнообразный",
        "Всегда",
        "Счастье",
        "Калейдоскоп",
        "Светящийся",
        "Сладкозвучный",
        "Спокойный",
        "Легкий",
        "Созерцание",
        "Деревенский",
        "Мимолетный",
        "Уверенность",
        "Светящийся",
        "Идиллический"]

    let descriptions = [
        "It was quaint and northerly.",
        "I never knew your tastes were so eclectic.",
        "Everything about this room said power, from the faint aroma of fine pipe tobacco to the ubiquitous presidential seal.",
        "Serendipity has been good to me, Charlie.",
        "The quad below was a kaleidoscope of dimly discernible faces.",
        "It was a large, bare room, made luminous by the clean glow of whitewash.",
        "What a mellifluous word.",
        "He saw visions of a halcyon future.",
        "This was a bustling young lady, pale, very pretty, ethereal; all in little light curls, with the air of a spoiled kitten and even a little pink cat's bow on her neck.",
        "Tuesday was a “a healthy reminder, especially to individual investors, that markets don’t go straight up,” Ms. Sonders said.",
        "But there the bucolic comparison ends.",
        "Emotional ties are ephemeral and undependable.",
        "Well, not skillfully, but there was a certain aplomb to my evasiveness.",
        "Sure, close enough and a steelcased rock is incandescent gas a microsecond later.",
        "Island life may seem idyllic but it comes at a price."
    ]
    
    private init() {}
}
