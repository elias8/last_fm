import 'dart:convert';

final Map<String, dynamic> albumDetailResponse = jsonDecode('''
{
    "album": {
        "artist": "The Weeknd",
        "mbid": "08791ceb-9f2a-4f48-9fb7-9eab2df6fc6e",
        "tags": {
            "tag": [
                {
                    "url": "https://www.last.fm/tag/rnb",
                    "name": "rnb"
                },
                {
                    "url": "https://www.last.fm/tag/lana+del+rey",
                    "name": "lana del rey"
                },
                {
                    "url": "https://www.last.fm/tag/canadian",
                    "name": "canadian"
                },
                {
                    "url": "https://www.last.fm/tag/dance",
                    "name": "dance"
                },
                {
                    "url": "https://www.last.fm/tag/pop",
                    "name": "pop"
                }
            ]
        },
        "playcount": "37159991",
        "image": [
            {
                "size": "small",
                "#text": "https://lastfm.freetls.fastly.net/i/u/34s/dfd01019404313399f77999285f78aa9.png"
            },
            {
                "size": "medium",
                "#text": "https://lastfm.freetls.fastly.net/i/u/64s/dfd01019404313399f77999285f78aa9.png"
            },
            {
                "size": "large",
                "#text": "https://lastfm.freetls.fastly.net/i/u/174s/dfd01019404313399f77999285f78aa9.png"
            },
            {
                "size": "extralarge",
                "#text": "https://lastfm.freetls.fastly.net/i/u/300x300/dfd01019404313399f77999285f78aa9.png"
            },
            {
                "size": "mega",
                "#text": "https://lastfm.freetls.fastly.net/i/u/300x300/dfd01019404313399f77999285f78aa9.png"
            },
            {
                "size": "",
                "#text": "https://lastfm.freetls.fastly.net/i/u/300x300/dfd01019404313399f77999285f78aa9.png"
            }
        ],
        "tracks": {
            "track": [
                {
                    "streamable": {
                        "fulltrack": "0",
                        "#text": "0"
                    },
                    "duration": 230,
                    "url": "https://www.last.fm/music/The+Weeknd+&+Daft+Punk/Starboy/Starboy",
                    "name": "Starboy",
                    "@attr": {
                        "rank": 1
                    },
                    "artist": {
                        "url": "https://www.last.fm/music/The+Weeknd+&+Daft+Punk",
                        "name": "The Weeknd & Daft Punk",
                        "mbid": ""
                    }
                },
                {
                    "streamable": {
                        "fulltrack": "0",
                        "#text": "0"
                    },
                    "duration": 249,
                    "url": "https://www.last.fm/music/The+Weeknd/Starboy/Party+Monster",
                    "name": "Party Monster",
                    "@attr": {
                        "rank": 2
                    },
                    "artist": {
                        "url": "https://www.last.fm/music/The+Weeknd",
                        "name": "The Weeknd",
                        "mbid": "c8b03190-306c-4120-bb0b-6f2ebfc06ea9"
                    }
                },
                {
                    "streamable": {
                        "fulltrack": "0",
                        "#text": "0"
                    },
                    "duration": 220,
                    "url": "https://www.last.fm/music/The+Weeknd/Starboy/False+Alarm",
                    "name": "False Alarm",
                    "@attr": {
                        "rank": 3
                    },
                    "artist": {
                        "url": "https://www.last.fm/music/The+Weeknd",
                        "name": "The Weeknd",
                        "mbid": "c8b03190-306c-4120-bb0b-6f2ebfc06ea9"
                    }
                },
                {
                    "streamable": {
                        "fulltrack": "0",
                        "#text": "0"
                    },
                    "duration": 218,
                    "url": "https://www.last.fm/music/The+Weeknd/Starboy/Reminder",
                    "name": "Reminder",
                    "@attr": {
                        "rank": 4
                    },
                    "artist": {
                        "url": "https://www.last.fm/music/The+Weeknd",
                        "name": "The Weeknd",
                        "mbid": "c8b03190-306c-4120-bb0b-6f2ebfc06ea9"
                    }
                },
                {
                    "streamable": {
                        "fulltrack": "0",
                        "#text": "0"
                    },
                    "duration": 232,
                    "url": "https://www.last.fm/music/The+Weeknd/Starboy/Rockin%27",
                    "name": "Rockin'",
                    "@attr": {
                        "rank": 5
                    },
                    "artist": {
                        "url": "https://www.last.fm/music/The+Weeknd",
                        "name": "The Weeknd",
                        "mbid": "c8b03190-306c-4120-bb0b-6f2ebfc06ea9"
                    }
                },
                {
                    "streamable": {
                        "fulltrack": "0",
                        "#text": "0"
                    },
                    "duration": 265,
                    "url": "https://www.last.fm/music/The+Weeknd/Starboy/Secrets",
                    "name": "Secrets",
                    "@attr": {
                        "rank": 6
                    },
                    "artist": {
                        "url": "https://www.last.fm/music/The+Weeknd",
                        "name": "The Weeknd",
                        "mbid": "c8b03190-306c-4120-bb0b-6f2ebfc06ea9"
                    }
                },
                {
                    "streamable": {
                        "fulltrack": "0",
                        "#text": "0"
                    },
                    "duration": 206,
                    "url": "https://www.last.fm/music/The+Weeknd/Starboy/True+Colors",
                    "name": "True Colors",
                    "@attr": {
                        "rank": 7
                    },
                    "artist": {
                        "url": "https://www.last.fm/music/The+Weeknd",
                        "name": "The Weeknd",
                        "mbid": "c8b03190-306c-4120-bb0b-6f2ebfc06ea9"
                    }
                },
                {
                    "streamable": {
                        "fulltrack": "0",
                        "#text": "0"
                    },
                    "duration": 111,
                    "url": "https://www.last.fm/music/The+Weeknd+feat.+Lana+Del+Rey/Starboy/Stargirl+Interlude",
                    "name": "Stargirl Interlude",
                    "@attr": {
                        "rank": 8
                    },
                    "artist": {
                        "url": "https://www.last.fm/music/The+Weeknd+feat.+Lana+Del+Rey",
                        "name": "The Weeknd feat. Lana Del Rey",
                        "mbid": "c8b03190-306c-4120-bb0b-6f2ebfc06ea9"
                    }
                },
                {
                    "streamable": {
                        "fulltrack": "0",
                        "#text": "0"
                    },
                    "duration": 231,
                    "url": "https://www.last.fm/music/The+Weeknd+feat.+Kendrick+Lamar/Starboy/Sidewalks",
                    "name": "Sidewalks",
                    "@attr": {
                        "rank": 9
                    },
                    "artist": {
                        "url": "https://www.last.fm/music/The+Weeknd+feat.+Kendrick+Lamar",
                        "name": "The Weeknd feat. Kendrick Lamar",
                        "mbid": ""
                    }
                },
                {
                    "streamable": {
                        "fulltrack": "0",
                        "#text": "0"
                    },
                    "duration": 237,
                    "url": "https://www.last.fm/music/The+Weeknd/Starboy/Six+Feet+Under",
                    "name": "Six Feet Under",
                    "@attr": {
                        "rank": 10
                    },
                    "artist": {
                        "url": "https://www.last.fm/music/The+Weeknd",
                        "name": "The Weeknd",
                        "mbid": "c8b03190-306c-4120-bb0b-6f2ebfc06ea9"
                    }
                },
                {
                    "streamable": {
                        "fulltrack": "0",
                        "#text": "0"
                    },
                    "duration": 223,
                    "url": "https://www.last.fm/music/The+Weeknd/Starboy/Love+to+Lay",
                    "name": "Love to Lay",
                    "@attr": {
                        "rank": 11
                    },
                    "artist": {
                        "url": "https://www.last.fm/music/The+Weeknd",
                        "name": "The Weeknd",
                        "mbid": "c8b03190-306c-4120-bb0b-6f2ebfc06ea9"
                    }
                },
                {
                    "streamable": {
                        "fulltrack": "0",
                        "#text": "0"
                    },
                    "duration": 220,
                    "url": "https://www.last.fm/music/The+Weeknd/Starboy/A+Lonely+Night",
                    "name": "A Lonely Night",
                    "@attr": {
                        "rank": 12
                    },
                    "artist": {
                        "url": "https://www.last.fm/music/The+Weeknd",
                        "name": "The Weeknd",
                        "mbid": "c8b03190-306c-4120-bb0b-6f2ebfc06ea9"
                    }
                },
                {
                    "streamable": {
                        "fulltrack": "0",
                        "#text": "0"
                    },
                    "duration": 197,
                    "url": "https://www.last.fm/music/The+Weeknd/Starboy/Attention",
                    "name": "Attention",
                    "@attr": {
                        "rank": 13
                    },
                    "artist": {
                        "url": "https://www.last.fm/music/The+Weeknd",
                        "name": "The Weeknd",
                        "mbid": "c8b03190-306c-4120-bb0b-6f2ebfc06ea9"
                    }
                },
                {
                    "streamable": {
                        "fulltrack": "0",
                        "#text": "0"
                    },
                    "duration": 221,
                    "url": "https://www.last.fm/music/The+Weeknd/Starboy/Ordinary+Life",
                    "name": "Ordinary Life",
                    "@attr": {
                        "rank": 14
                    },
                    "artist": {
                        "url": "https://www.last.fm/music/The+Weeknd",
                        "name": "The Weeknd",
                        "mbid": "c8b03190-306c-4120-bb0b-6f2ebfc06ea9"
                    }
                },
                {
                    "streamable": {
                        "fulltrack": "0",
                        "#text": "0"
                    },
                    "duration": 198,
                    "url": "https://www.last.fm/music/The+Weeknd/Starboy/Nothing+Without+You",
                    "name": "Nothing Without You",
                    "@attr": {
                        "rank": 15
                    },
                    "artist": {
                        "url": "https://www.last.fm/music/The+Weeknd",
                        "name": "The Weeknd",
                        "mbid": "c8b03190-306c-4120-bb0b-6f2ebfc06ea9"
                    }
                },
                {
                    "streamable": {
                        "fulltrack": "0",
                        "#text": "0"
                    },
                    "duration": 321,
                    "url": "https://www.last.fm/music/The+Weeknd+&+Future/Starboy/All+I+Know",
                    "name": "All I Know",
                    "@attr": {
                        "rank": 16
                    },
                    "artist": {
                        "url": "https://www.last.fm/music/The+Weeknd+&+Future",
                        "name": "The Weeknd & Future",
                        "mbid": ""
                    }
                },
                {
                    "streamable": {
                        "fulltrack": "0",
                        "#text": "0"
                    },
                    "duration": 260,
                    "url": "https://www.last.fm/music/The+Weeknd/Starboy/Die+for+You",
                    "name": "Die for You",
                    "@attr": {
                        "rank": 17
                    },
                    "artist": {
                        "url": "https://www.last.fm/music/The+Weeknd",
                        "name": "The Weeknd",
                        "mbid": "c8b03190-306c-4120-bb0b-6f2ebfc06ea9"
                    }
                },
                {
                    "streamable": {
                        "fulltrack": "0",
                        "#text": "0"
                    },
                    "duration": 269,
                    "url": "https://www.last.fm/music/The+Weeknd+Feat.+Daft+Punk/Starboy/I+Feel+It+Coming",
                    "name": "I Feel It Coming",
                    "@attr": {
                        "rank": 18
                    },
                    "artist": {
                        "url": "https://www.last.fm/music/The+Weeknd+Feat.+Daft+Punk",
                        "name": "The Weeknd Feat. Daft Punk",
                        "mbid": "c8b03190-306c-4120-bb0b-6f2ebfc06ea9"
                    }
                }
            ]
        },
        "url": "https://www.last.fm/music/The+Weeknd/Starboy",
        "name": "Starboy",
        "listeners": "999441",
        "wiki": {
            "published": "08 Aug 2018, 12:33",
            "summary": "Starboy",
            "content": "Starboy"
        }
    }
}
''');

final Map<String, dynamic> albumNotFoundResponse = jsonDecode('''
{
    "message": "Album not found",
    "error": 6
}
''');

final Map<String, dynamic> artistNotFound = jsonDecode('''
{
    "error": 6,
    "message": "The artist you supplied could not be found",
    "links": []
}
''');

final Map<String, dynamic> topAlbumsResponse = jsonDecode('''
    {
    "topalbums": {
        "album": [
            {
                "name": "Believe",
                "playcount": 3601432,
                "mbid": "63b3a8ca-26f2-4e2b-b867-647a6ec2bebd",
                "url": "https://www.last.fm/music/Cher/Believe",
                "artist": {
                    "name": "Cher",
                    "mbid": "bfcc6d75-a6a5-4bc6-8282-47aec8531818",
                    "url": "https://www.last.fm/music/Cher"
                },
                "image": [
                    {
                        "#text": "https://lastfm.freetls.fastly.net/i/u/34s/3b54885952161aaea4ce2965b2db1638.png",
                        "size": "small"
                    },
                    {
                        "#text": "https://lastfm.freetls.fastly.net/i/u/64s/3b54885952161aaea4ce2965b2db1638.png",
                        "size": "medium"
                    },
                    {
                        "#text": "https://lastfm.freetls.fastly.net/i/u/174s/3b54885952161aaea4ce2965b2db1638.png",
                        "size": "large"
                    },
                    {
                        "#text": "https://lastfm.freetls.fastly.net/i/u/300x300/3b54885952161aaea4ce2965b2db1638.png",
                        "size": "extralarge"
                    }
                ]
            },
            {
                "name": "The Very Best of Cher",
                "playcount": 1719435,
                "mbid": "a7e2dad7-e733-4bee-9db1-b31e3183eaf5",
                "url": "https://www.last.fm/music/Cher/The+Very+Best+of+Cher",
                "artist": {
                    "name": "Cher",
                    "mbid": "bfcc6d75-a6a5-4bc6-8282-47aec8531818",
                    "url": "https://www.last.fm/music/Cher"
                },
                "image": [
                    {
                        "#text": "https://lastfm.freetls.fastly.net/i/u/34s/0fd942f7e629a01ec2d067e41464ff5d.png",
                        "size": "small"
                    },
                    {
                        "#text": "https://lastfm.freetls.fastly.net/i/u/64s/0fd942f7e629a01ec2d067e41464ff5d.png",
                        "size": "medium"
                    },
                    {
                        "#text": "https://lastfm.freetls.fastly.net/i/u/174s/0fd942f7e629a01ec2d067e41464ff5d.png",
                        "size": "large"
                    },
                    {
                        "#text": "https://lastfm.freetls.fastly.net/i/u/300x300/0fd942f7e629a01ec2d067e41464ff5d.png",
                        "size": "extralarge"
                    }
                ]
            },
            {
                "name": "Heart of Stone",
                "playcount": 1152917,
                "mbid": "7468fc70-9cba-4bad-a2a8-4201221f54fe",
                "url": "https://www.last.fm/music/Cher/Heart+of+Stone",
                "artist": {
                    "name": "Cher",
                    "mbid": "bfcc6d75-a6a5-4bc6-8282-47aec8531818",
                    "url": "https://www.last.fm/music/Cher"
                },
                "image": [
                    {
                        "#text": "https://lastfm.freetls.fastly.net/i/u/34s/89241b4c5ecb65d744a147f6cc33b34c.png",
                        "size": "small"
                    },
                    {
                        "#text": "https://lastfm.freetls.fastly.net/i/u/64s/89241b4c5ecb65d744a147f6cc33b34c.png",
                        "size": "medium"
                    },
                    {
                        "#text": "https://lastfm.freetls.fastly.net/i/u/174s/89241b4c5ecb65d744a147f6cc33b34c.png",
                        "size": "large"
                    },
                    {
                        "#text": "https://lastfm.freetls.fastly.net/i/u/300x300/89241b4c5ecb65d744a147f6cc33b34c.png",
                        "size": "extralarge"
                    }
                ]
            },
            {
                "name": "Cher's Greatest Hits: 1965-1992",
                "playcount": 530532,
                "url": "https://www.last.fm/music/Cher/Cher%27s+Greatest+Hits:+1965-1992",
                "artist": {
                    "name": "Cher",
                    "mbid": "bfcc6d75-a6a5-4bc6-8282-47aec8531818",
                    "url": "https://www.last.fm/music/Cher"
                },
                "image": [
                    {
                        "#text": "https://lastfm.freetls.fastly.net/i/u/34s/0232e085741c6b7dfb8ccd6cdcbbad0e.png",
                        "size": "small"
                    },
                    {
                        "#text": "https://lastfm.freetls.fastly.net/i/u/64s/0232e085741c6b7dfb8ccd6cdcbbad0e.png",
                        "size": "medium"
                    },
                    {
                        "#text": "https://lastfm.freetls.fastly.net/i/u/174s/0232e085741c6b7dfb8ccd6cdcbbad0e.png",
                        "size": "large"
                    },
                    {
                        "#text": "https://lastfm.freetls.fastly.net/i/u/300x300/0232e085741c6b7dfb8ccd6cdcbbad0e.png",
                        "size": "extralarge"
                    }
                ]
            },
            {
                "name": "It's a Man's World",
                "playcount": 544959,
                "mbid": "e4e7db8a-2622-47d3-80a5-91534d523ac5",
                "url": "https://www.last.fm/music/Cher/It%27s+a+Man%27s+World",
                "artist": {
                    "name": "Cher",
                    "mbid": "bfcc6d75-a6a5-4bc6-8282-47aec8531818",
                    "url": "https://www.last.fm/music/Cher"
                },
                "image": [
                    {
                        "#text": "https://lastfm.freetls.fastly.net/i/u/34s/0c8f97586cbb46a3875ee70eaa7e7cb0.png",
                        "size": "small"
                    },
                    {
                        "#text": "https://lastfm.freetls.fastly.net/i/u/64s/0c8f97586cbb46a3875ee70eaa7e7cb0.png",
                        "size": "medium"
                    },
                    {
                        "#text": "https://lastfm.freetls.fastly.net/i/u/174s/0c8f97586cbb46a3875ee70eaa7e7cb0.png",
                        "size": "large"
                    },
                    {
                        "#text": "https://lastfm.freetls.fastly.net/i/u/300x300/0c8f97586cbb46a3875ee70eaa7e7cb0.png",
                        "size": "extralarge"
                    }
                ]
            },
            {
                "name": "The Greatest Hits",
                "playcount": 548775,
                "mbid": "023af53b-2a8f-467e-aadc-307b3372ecc2",
                "url": "https://www.last.fm/music/Cher/The+Greatest+Hits",
                "artist": {
                    "name": "Cher",
                    "mbid": "bfcc6d75-a6a5-4bc6-8282-47aec8531818",
                    "url": "https://www.last.fm/music/Cher"
                },
                "image": [
                    {
                        "#text": "https://lastfm.freetls.fastly.net/i/u/34s/2563ce273c65e39dfe7ea691752237fe.png",
                        "size": "small"
                    },
                    {
                        "#text": "https://lastfm.freetls.fastly.net/i/u/64s/2563ce273c65e39dfe7ea691752237fe.png",
                        "size": "medium"
                    },
                    {
                        "#text": "https://lastfm.freetls.fastly.net/i/u/174s/2563ce273c65e39dfe7ea691752237fe.png",
                        "size": "large"
                    },
                    {
                        "#text": "https://lastfm.freetls.fastly.net/i/u/300x300/2563ce273c65e39dfe7ea691752237fe.png",
                        "size": "extralarge"
                    }
                ]
            },
            {
                "name": "Living Proof",
                "playcount": 770595,
                "mbid": "182a2ec8-f717-4e06-a88e-604db80ab4aa",
                "url": "https://www.last.fm/music/Cher/Living+Proof",
                "artist": {
                    "name": "Cher",
                    "mbid": "bfcc6d75-a6a5-4bc6-8282-47aec8531818",
                    "url": "https://www.last.fm/music/Cher"
                },
                "image": [
                    {
                        "#text": "https://lastfm.freetls.fastly.net/i/u/34s/5adc1f1fe42943fe2f3341534863fd2d.png",
                        "size": "small"
                    },
                    {
                        "#text": "https://lastfm.freetls.fastly.net/i/u/64s/5adc1f1fe42943fe2f3341534863fd2d.png",
                        "size": "medium"
                    },
                    {
                        "#text": "https://lastfm.freetls.fastly.net/i/u/174s/5adc1f1fe42943fe2f3341534863fd2d.png",
                        "size": "large"
                    },
                    {
                        "#text": "https://lastfm.freetls.fastly.net/i/u/300x300/5adc1f1fe42943fe2f3341534863fd2d.png",
                        "size": "extralarge"
                    }
                ]
            },
            {
                "name": "Love Hurts",
                "playcount": 438275,
                "mbid": "d52885f4-5444-4361-a1f3-ac4d079b603d",
                "url": "https://www.last.fm/music/Cher/Love+Hurts",
                "artist": {
                    "name": "Cher",
                    "mbid": "bfcc6d75-a6a5-4bc6-8282-47aec8531818",
                    "url": "https://www.last.fm/music/Cher"
                },
                "image": [
                    {
                        "#text": "https://lastfm.freetls.fastly.net/i/u/34s/94c0865342e8938d6146715c71e0d6ed.png",
                        "size": "small"
                    },
                    {
                        "#text": "https://lastfm.freetls.fastly.net/i/u/64s/94c0865342e8938d6146715c71e0d6ed.png",
                        "size": "medium"
                    },
                    {
                        "#text": "https://lastfm.freetls.fastly.net/i/u/174s/94c0865342e8938d6146715c71e0d6ed.png",
                        "size": "large"
                    },
                    {
                        "#text": "https://lastfm.freetls.fastly.net/i/u/300x300/94c0865342e8938d6146715c71e0d6ed.png",
                        "size": "extralarge"
                    }
                ]
            },
            {
                "name": "Half Breed",
                "playcount": 140674,
                "mbid": "95945817-ebd8-4d3e-bb5f-fcb22de001ca",
                "url": "https://www.last.fm/music/Cher/Half+Breed",
                "artist": {
                    "name": "Cher",
                    "mbid": "bfcc6d75-a6a5-4bc6-8282-47aec8531818",
                    "url": "https://www.last.fm/music/Cher"
                },
                "image": [
                    {
                        "#text": "https://lastfm.freetls.fastly.net/i/u/34s/75bfb65988650dd70014a64dc1c60380.png",
                        "size": "small"
                    },
                    {
                        "#text": "https://lastfm.freetls.fastly.net/i/u/64s/75bfb65988650dd70014a64dc1c60380.png",
                        "size": "medium"
                    },
                    {
                        "#text": "https://lastfm.freetls.fastly.net/i/u/174s/75bfb65988650dd70014a64dc1c60380.png",
                        "size": "large"
                    },
                    {
                        "#text": "https://lastfm.freetls.fastly.net/i/u/300x300/75bfb65988650dd70014a64dc1c60380.png",
                        "size": "extralarge"
                    }
                ]
            },
            {
                "name": "Dancing Queen",
                "playcount": 761828,
                "url": "https://www.last.fm/music/Cher/Dancing+Queen",
                "artist": {
                    "name": "Cher",
                    "mbid": "bfcc6d75-a6a5-4bc6-8282-47aec8531818",
                    "url": "https://www.last.fm/music/Cher"
                },
                "image": [
                    {
                        "#text": "https://lastfm.freetls.fastly.net/i/u/34s/6a1e5db8a6831635bcba07652d48431f.png",
                        "size": "small"
                    },
                    {
                        "#text": "https://lastfm.freetls.fastly.net/i/u/64s/6a1e5db8a6831635bcba07652d48431f.png",
                        "size": "medium"
                    },
                    {
                        "#text": "https://lastfm.freetls.fastly.net/i/u/174s/6a1e5db8a6831635bcba07652d48431f.png",
                        "size": "large"
                    },
                    {
                        "#text": "https://lastfm.freetls.fastly.net/i/u/300x300/6a1e5db8a6831635bcba07652d48431f.png",
                        "size": "extralarge"
                    }
                ]
            },
            {
                "name": "The Best of Cher",
                "playcount": 72905,
                "mbid": "0128541a-3b4e-4bb9-8b82-344ab851c6de",
                "url": "https://www.last.fm/music/Cher/The+Best+of+Cher",
                "artist": {
                    "name": "Cher",
                    "mbid": "bfcc6d75-a6a5-4bc6-8282-47aec8531818",
                    "url": "https://www.last.fm/music/Cher"
                },
                "image": [
                    {
                        "#text": "https://lastfm.freetls.fastly.net/i/u/34s/1deb74dacf0e4112aee7c01afdb0349d.png",
                        "size": "small"
                    },
                    {
                        "#text": "https://lastfm.freetls.fastly.net/i/u/64s/1deb74dacf0e4112aee7c01afdb0349d.png",
                        "size": "medium"
                    },
                    {
                        "#text": "https://lastfm.freetls.fastly.net/i/u/174s/1deb74dacf0e4112aee7c01afdb0349d.png",
                        "size": "large"
                    },
                    {
                        "#text": "https://lastfm.freetls.fastly.net/i/u/300x300/1deb74dacf0e4112aee7c01afdb0349d.png",
                        "size": "extralarge"
                    }
                ]
            },
            {
                "name": "Cher",
                "playcount": 365814,
                "mbid": "368fc15c-e01c-4ad8-8fb3-26c44c695c84",
                "url": "https://www.last.fm/music/Cher/Cher",
                "artist": {
                    "name": "Cher",
                    "mbid": "bfcc6d75-a6a5-4bc6-8282-47aec8531818",
                    "url": "https://www.last.fm/music/Cher"
                },
                "image": [
                    {
                        "#text": "https://lastfm.freetls.fastly.net/i/u/34s/0f332eee8d8b9387dcb6d8d4ac1b5560.png",
                        "size": "small"
                    },
                    {
                        "#text": "https://lastfm.freetls.fastly.net/i/u/64s/0f332eee8d8b9387dcb6d8d4ac1b5560.png",
                        "size": "medium"
                    },
                    {
                        "#text": "https://lastfm.freetls.fastly.net/i/u/174s/0f332eee8d8b9387dcb6d8d4ac1b5560.png",
                        "size": "large"
                    },
                    {
                        "#text": "https://lastfm.freetls.fastly.net/i/u/300x300/0f332eee8d8b9387dcb6d8d4ac1b5560.png",
                        "size": "extralarge"
                    }
                ]
            },
            {
                "name": "Burlesque Original Motion Picture Soundtrack",
                "playcount": 202109,
                "url": "https://www.last.fm/music/Cher/Burlesque+Original+Motion+Picture+Soundtrack",
                "artist": {
                    "name": "Cher",
                    "mbid": "bfcc6d75-a6a5-4bc6-8282-47aec8531818",
                    "url": "https://www.last.fm/music/Cher"
                },
                "image": [
                    {
                        "#text": "https://lastfm.freetls.fastly.net/i/u/34s/4c74915a7be542ad84673b8ac9d98905.png",
                        "size": "small"
                    },
                    {
                        "#text": "https://lastfm.freetls.fastly.net/i/u/64s/4c74915a7be542ad84673b8ac9d98905.png",
                        "size": "medium"
                    },
                    {
                        "#text": "https://lastfm.freetls.fastly.net/i/u/174s/4c74915a7be542ad84673b8ac9d98905.png",
                        "size": "large"
                    },
                    {
                        "#text": "https://lastfm.freetls.fastly.net/i/u/300x300/4c74915a7be542ad84673b8ac9d98905.png",
                        "size": "extralarge"
                    }
                ]
            },
            {
                "name": "Gypsys, Tramps & Thieves",
                "playcount": 228763,
                "mbid": "ac1d49a5-611e-4895-921d-83cbec6d1df6",
                "url": "https://www.last.fm/music/Cher/Gypsys,+Tramps+&+Thieves",
                "artist": {
                    "name": "Cher",
                    "mbid": "bfcc6d75-a6a5-4bc6-8282-47aec8531818",
                    "url": "https://www.last.fm/music/Cher"
                },
                "image": [
                    {
                        "#text": "https://lastfm.freetls.fastly.net/i/u/34s/3f66a799fede4cdb967e7cf67940894b.png",
                        "size": "small"
                    },
                    {
                        "#text": "https://lastfm.freetls.fastly.net/i/u/64s/3f66a799fede4cdb967e7cf67940894b.png",
                        "size": "medium"
                    },
                    {
                        "#text": "https://lastfm.freetls.fastly.net/i/u/174s/3f66a799fede4cdb967e7cf67940894b.png",
                        "size": "large"
                    },
                    {
                        "#text": "https://lastfm.freetls.fastly.net/i/u/300x300/3f66a799fede4cdb967e7cf67940894b.png",
                        "size": "extralarge"
                    }
                ]
            },
            {
                "name": "Take Me Home & Prisoner",
                "playcount": 51951,
                "url": "https://www.last.fm/music/Cher/Take+Me+Home+&+Prisoner",
                "artist": {
                    "name": "Cher",
                    "mbid": "bfcc6d75-a6a5-4bc6-8282-47aec8531818",
                    "url": "https://www.last.fm/music/Cher"
                },
                "image": [
                    {
                        "#text": "https://lastfm.freetls.fastly.net/i/u/34s/007759bbe10642db8f023e4c276ba6f3.png",
                        "size": "small"
                    },
                    {
                        "#text": "https://lastfm.freetls.fastly.net/i/u/64s/007759bbe10642db8f023e4c276ba6f3.png",
                        "size": "medium"
                    },
                    {
                        "#text": "https://lastfm.freetls.fastly.net/i/u/174s/007759bbe10642db8f023e4c276ba6f3.png",
                        "size": "large"
                    },
                    {
                        "#text": "https://lastfm.freetls.fastly.net/i/u/300x300/007759bbe10642db8f023e4c276ba6f3.png",
                        "size": "extralarge"
                    }
                ]
            },
            {
                "name": "Greatest Hits",
                "playcount": 115040,
                "mbid": "ec3f4f8d-1852-4407-9969-7baba18e6e37",
                "url": "https://www.last.fm/music/Cher/Greatest+Hits",
                "artist": {
                    "name": "Cher",
                    "mbid": "bfcc6d75-a6a5-4bc6-8282-47aec8531818",
                    "url": "https://www.last.fm/music/Cher"
                },
                "image": [
                    {
                        "#text": "https://lastfm.freetls.fastly.net/i/u/34s/86ce1440a83d40118b545afafca6ac34.png",
                        "size": "small"
                    },
                    {
                        "#text": "https://lastfm.freetls.fastly.net/i/u/64s/86ce1440a83d40118b545afafca6ac34.png",
                        "size": "medium"
                    },
                    {
                        "#text": "https://lastfm.freetls.fastly.net/i/u/174s/86ce1440a83d40118b545afafca6ac34.png",
                        "size": "large"
                    },
                    {
                        "#text": "https://lastfm.freetls.fastly.net/i/u/300x300/86ce1440a83d40118b545afafca6ac34.png",
                        "size": "extralarge"
                    }
                ]
            },
            {
                "name": "Gold",
                "playcount": 200560,
                "mbid": "9880981e-90ba-4767-9473-4d058bcd099f",
                "url": "https://www.last.fm/music/Cher/Gold",
                "artist": {
                    "name": "Cher",
                    "mbid": "bfcc6d75-a6a5-4bc6-8282-47aec8531818",
                    "url": "https://www.last.fm/music/Cher"
                },
                "image": [
                    {
                        "#text": "https://lastfm.freetls.fastly.net/i/u/34s/006f407fc9e04060d2d4ec0cc567e4e6.png",
                        "size": "small"
                    },
                    {
                        "#text": "https://lastfm.freetls.fastly.net/i/u/64s/006f407fc9e04060d2d4ec0cc567e4e6.png",
                        "size": "medium"
                    },
                    {
                        "#text": "https://lastfm.freetls.fastly.net/i/u/174s/006f407fc9e04060d2d4ec0cc567e4e6.png",
                        "size": "large"
                    },
                    {
                        "#text": "https://lastfm.freetls.fastly.net/i/u/300x300/006f407fc9e04060d2d4ec0cc567e4e6.png",
                        "size": "extralarge"
                    }
                ]
            },
            {
                "name": "Closer to the Truth",
                "playcount": 777692,
                "url": "https://www.last.fm/music/Cher/Closer+to+the+Truth",
                "artist": {
                    "name": "Cher",
                    "mbid": "bfcc6d75-a6a5-4bc6-8282-47aec8531818",
                    "url": "https://www.last.fm/music/Cher"
                },
                "image": [
                    {
                        "#text": "https://lastfm.freetls.fastly.net/i/u/34s/4eed0361b0916ddb22ed26b511f61d82.png",
                        "size": "small"
                    },
                    {
                        "#text": "https://lastfm.freetls.fastly.net/i/u/64s/4eed0361b0916ddb22ed26b511f61d82.png",
                        "size": "medium"
                    },
                    {
                        "#text": "https://lastfm.freetls.fastly.net/i/u/174s/4eed0361b0916ddb22ed26b511f61d82.png",
                        "size": "large"
                    },
                    {
                        "#text": "https://lastfm.freetls.fastly.net/i/u/300x300/4eed0361b0916ddb22ed26b511f61d82.png",
                        "size": "extralarge"
                    }
                ]
            },
            {
                "name": "Gimme! Gimme! Gimme! (A Man After Midnight)",
                "playcount": 133428,
                "url": "https://www.last.fm/music/Cher/Gimme%21+Gimme%21+Gimme%21+(A+Man+After+Midnight)",
                "artist": {
                    "name": "Cher",
                    "mbid": "bfcc6d75-a6a5-4bc6-8282-47aec8531818",
                    "url": "https://www.last.fm/music/Cher"
                },
                "image": [
                    {
                        "#text": "https://lastfm.freetls.fastly.net/i/u/34s/720c2418d2c2c67d060ba600a18d72de.png",
                        "size": "small"
                    },
                    {
                        "#text": "https://lastfm.freetls.fastly.net/i/u/64s/720c2418d2c2c67d060ba600a18d72de.png",
                        "size": "medium"
                    },
                    {
                        "#text": "https://lastfm.freetls.fastly.net/i/u/174s/720c2418d2c2c67d060ba600a18d72de.png",
                        "size": "large"
                    },
                    {
                        "#text": "https://lastfm.freetls.fastly.net/i/u/300x300/720c2418d2c2c67d060ba600a18d72de.png",
                        "size": "extralarge"
                    }
                ]
            },
            {
                "name": "Strong Enough",
                "playcount": 78476,
                "mbid": "92aa86fd-f1c9-4b74-b2d7-711f9765e936",
                "url": "https://www.last.fm/music/Cher/Strong+Enough",
                "artist": {
                    "name": "Cher",
                    "mbid": "bfcc6d75-a6a5-4bc6-8282-47aec8531818",
                    "url": "https://www.last.fm/music/Cher"
                },
                "image": [
                    {
                        "#text": "https://lastfm.freetls.fastly.net/i/u/34s/f84c7c1a7f0040b2ac7e8554ab60e0d4.png",
                        "size": "small"
                    },
                    {
                        "#text": "https://lastfm.freetls.fastly.net/i/u/64s/f84c7c1a7f0040b2ac7e8554ab60e0d4.png",
                        "size": "medium"
                    },
                    {
                        "#text": "https://lastfm.freetls.fastly.net/i/u/174s/f84c7c1a7f0040b2ac7e8554ab60e0d4.png",
                        "size": "large"
                    },
                    {
                        "#text": "https://lastfm.freetls.fastly.net/i/u/300x300/f84c7c1a7f0040b2ac7e8554ab60e0d4.png",
                        "size": "extralarge"
                    }
                ]
            },
            {
                "name": "Closer To the Truth (Deluxe Version)",
                "playcount": 486755,
                "mbid": "4003e2bb-e868-431f-a086-f53d557606c9",
                "url": "https://www.last.fm/music/Cher/Closer+To+the+Truth+(Deluxe+Version)",
                "artist": {
                    "name": "Cher",
                    "mbid": "bfcc6d75-a6a5-4bc6-8282-47aec8531818",
                    "url": "https://www.last.fm/music/Cher"
                },
                "image": [
                    {
                        "#text": "https://lastfm.freetls.fastly.net/i/u/34s/60cb3aa538f918b5251210ce41578cd8.png",
                        "size": "small"
                    },
                    {
                        "#text": "https://lastfm.freetls.fastly.net/i/u/64s/60cb3aa538f918b5251210ce41578cd8.png",
                        "size": "medium"
                    },
                    {
                        "#text": "https://lastfm.freetls.fastly.net/i/u/174s/60cb3aa538f918b5251210ce41578cd8.png",
                        "size": "large"
                    },
                    {
                        "#text": "https://lastfm.freetls.fastly.net/i/u/300x300/60cb3aa538f918b5251210ce41578cd8.png",
                        "size": "extralarge"
                    }
                ]
            },
            {
                "name": "(null)",
                "playcount": 144031,
                "url": "https://www.last.fm/music/Cher/(null)",
                "artist": {
                    "name": "Cher",
                    "mbid": "bfcc6d75-a6a5-4bc6-8282-47aec8531818",
                    "url": "https://www.last.fm/music/Cher"
                },
                "image": [
                    {
                        "#text": "",
                        "size": "small"
                    },
                    {
                        "#text": "",
                        "size": "medium"
                    },
                    {
                        "#text": "",
                        "size": "large"
                    },
                    {
                        "#text": "",
                        "size": "extralarge"
                    }
                ]
            },
            {
                "name": "Take Me Home",
                "playcount": 120906,
                "mbid": "9cd2ad21-ad13-4490-bc58-22943cd89380",
                "url": "https://www.last.fm/music/Cher/Take+Me+Home",
                "artist": {
                    "name": "Cher",
                    "mbid": "bfcc6d75-a6a5-4bc6-8282-47aec8531818",
                    "url": "https://www.last.fm/music/Cher"
                },
                "image": [
                    {
                        "#text": "https://lastfm.freetls.fastly.net/i/u/34s/00d3e4fce6d8ac005b060c1c75554eb1.png",
                        "size": "small"
                    },
                    {
                        "#text": "https://lastfm.freetls.fastly.net/i/u/64s/00d3e4fce6d8ac005b060c1c75554eb1.png",
                        "size": "medium"
                    },
                    {
                        "#text": "https://lastfm.freetls.fastly.net/i/u/174s/00d3e4fce6d8ac005b060c1c75554eb1.png",
                        "size": "large"
                    },
                    {
                        "#text": "https://lastfm.freetls.fastly.net/i/u/300x300/00d3e4fce6d8ac005b060c1c75554eb1.png",
                        "size": "extralarge"
                    }
                ]
            },
            {
                "name": "The Best of Cher (The Imperial Recordings: 1965-1968)",
                "playcount": 78527,
                "url": "https://www.last.fm/music/Cher/The+Best+of+Cher+(The+Imperial+Recordings:+1965-1968)",
                "artist": {
                    "name": "Cher",
                    "mbid": "bfcc6d75-a6a5-4bc6-8282-47aec8531818",
                    "url": "https://www.last.fm/music/Cher"
                },
                "image": [
                    {
                        "#text": "https://lastfm.freetls.fastly.net/i/u/34s/a71d30221df988721bdee846ea87161a.png",
                        "size": "small"
                    },
                    {
                        "#text": "https://lastfm.freetls.fastly.net/i/u/64s/a71d30221df988721bdee846ea87161a.png",
                        "size": "medium"
                    },
                    {
                        "#text": "https://lastfm.freetls.fastly.net/i/u/174s/a71d30221df988721bdee846ea87161a.png",
                        "size": "large"
                    },
                    {
                        "#text": "https://lastfm.freetls.fastly.net/i/u/300x300/a71d30221df988721bdee846ea87161a.png",
                        "size": "extralarge"
                    }
                ]
            },
            {
                "name": "Greatest Hits: If I Could Turn Back Time",
                "playcount": 19376,
                "mbid": "2fba163f-011f-4c8e-a133-78b397443e78",
                "url": "https://www.last.fm/music/Cher/Greatest+Hits:+If+I+Could+Turn+Back+Time",
                "artist": {
                    "name": "Cher",
                    "mbid": "bfcc6d75-a6a5-4bc6-8282-47aec8531818",
                    "url": "https://www.last.fm/music/Cher"
                },
                "image": [
                    {
                        "#text": "https://lastfm.freetls.fastly.net/i/u/34s/425369dec8f044e88893adf2f7c7486b.png",
                        "size": "small"
                    },
                    {
                        "#text": "https://lastfm.freetls.fastly.net/i/u/64s/425369dec8f044e88893adf2f7c7486b.png",
                        "size": "medium"
                    },
                    {
                        "#text": "https://lastfm.freetls.fastly.net/i/u/174s/425369dec8f044e88893adf2f7c7486b.png",
                        "size": "large"
                    },
                    {
                        "#text": "https://lastfm.freetls.fastly.net/i/u/300x300/425369dec8f044e88893adf2f7c7486b.png",
                        "size": "extralarge"
                    }
                ]
            },
            {
                "name": "All I Really Want to Do",
                "playcount": 117196,
                "mbid": "5e37a247-b02f-4c29-8349-0655091051ac",
                "url": "https://www.last.fm/music/Cher/All+I+Really+Want+to+Do",
                "artist": {
                    "name": "Cher",
                    "mbid": "bfcc6d75-a6a5-4bc6-8282-47aec8531818",
                    "url": "https://www.last.fm/music/Cher"
                },
                "image": [
                    {
                        "#text": "https://lastfm.freetls.fastly.net/i/u/34s/42fff15cfd6ce40dbc921e3b6c2bf089.png",
                        "size": "small"
                    },
                    {
                        "#text": "https://lastfm.freetls.fastly.net/i/u/64s/42fff15cfd6ce40dbc921e3b6c2bf089.png",
                        "size": "medium"
                    },
                    {
                        "#text": "https://lastfm.freetls.fastly.net/i/u/174s/42fff15cfd6ce40dbc921e3b6c2bf089.png",
                        "size": "large"
                    },
                    {
                        "#text": "https://lastfm.freetls.fastly.net/i/u/300x300/42fff15cfd6ce40dbc921e3b6c2bf089.png",
                        "size": "extralarge"
                    }
                ]
            },
            {
                "name": "Burlesque",
                "playcount": 164053,
                "url": "https://www.last.fm/music/Cher/Burlesque",
                "artist": {
                    "name": "Cher",
                    "mbid": "bfcc6d75-a6a5-4bc6-8282-47aec8531818",
                    "url": "https://www.last.fm/music/Cher"
                },
                "image": [
                    {
                        "#text": "https://lastfm.freetls.fastly.net/i/u/34s/0a2760c4699a483086c8eba8ebc5eca1.png",
                        "size": "small"
                    },
                    {
                        "#text": "https://lastfm.freetls.fastly.net/i/u/64s/0a2760c4699a483086c8eba8ebc5eca1.png",
                        "size": "medium"
                    },
                    {
                        "#text": "https://lastfm.freetls.fastly.net/i/u/174s/0a2760c4699a483086c8eba8ebc5eca1.png",
                        "size": "large"
                    },
                    {
                        "#text": "https://lastfm.freetls.fastly.net/i/u/300x300/0a2760c4699a483086c8eba8ebc5eca1.png",
                        "size": "extralarge"
                    }
                ]
            },
            {
                "name": "Bang Bang: The Early Years",
                "playcount": 44699,
                "url": "https://www.last.fm/music/Cher/Bang+Bang:+The+Early+Years",
                "artist": {
                    "name": "Cher",
                    "mbid": "bfcc6d75-a6a5-4bc6-8282-47aec8531818",
                    "url": "https://www.last.fm/music/Cher"
                },
                "image": [
                    {
                        "#text": "https://lastfm.freetls.fastly.net/i/u/34s/e2655b999d0a4b0e993b31479bf23dd0.png",
                        "size": "small"
                    },
                    {
                        "#text": "https://lastfm.freetls.fastly.net/i/u/64s/e2655b999d0a4b0e993b31479bf23dd0.png",
                        "size": "medium"
                    },
                    {
                        "#text": "https://lastfm.freetls.fastly.net/i/u/174s/e2655b999d0a4b0e993b31479bf23dd0.png",
                        "size": "large"
                    },
                    {
                        "#text": "https://lastfm.freetls.fastly.net/i/u/300x300/e2655b999d0a4b0e993b31479bf23dd0.png",
                        "size": "extralarge"
                    }
                ]
            },
            {
                "name": "Love Hurts (UK Mid Price)",
                "playcount": 27700,
                "url": "https://www.last.fm/music/Cher/Love+Hurts+(UK+Mid+Price)",
                "artist": {
                    "name": "Cher",
                    "mbid": "bfcc6d75-a6a5-4bc6-8282-47aec8531818",
                    "url": "https://www.last.fm/music/Cher"
                },
                "image": [
                    {
                        "#text": "https://lastfm.freetls.fastly.net/i/u/34s/e337c09cf7c18b7294ba81b2317397d2.png",
                        "size": "small"
                    },
                    {
                        "#text": "https://lastfm.freetls.fastly.net/i/u/64s/e337c09cf7c18b7294ba81b2317397d2.png",
                        "size": "medium"
                    },
                    {
                        "#text": "https://lastfm.freetls.fastly.net/i/u/174s/e337c09cf7c18b7294ba81b2317397d2.png",
                        "size": "large"
                    },
                    {
                        "#text": "https://lastfm.freetls.fastly.net/i/u/300x300/e337c09cf7c18b7294ba81b2317397d2.png",
                        "size": "extralarge"
                    }
                ]
            },
            {
                "name": "Fernando (From Mamma Mia! Here We Go Again)",
                "playcount": 36064,
                "url": "https://www.last.fm/music/Cher/Fernando+(From+%22Mamma+Mia%21+Here+We+Go+Again%22)",
                "artist": {
                    "name": "Cher",
                    "mbid": "bfcc6d75-a6a5-4bc6-8282-47aec8531818",
                    "url": "https://www.last.fm/music/Cher"
                },
                "image": [
                    {
                        "#text": "https://lastfm.freetls.fastly.net/i/u/34s/a1f4e8c6fd31f2c333d510b097ce40f0.png",
                        "size": "small"
                    },
                    {
                        "#text": "https://lastfm.freetls.fastly.net/i/u/64s/a1f4e8c6fd31f2c333d510b097ce40f0.png",
                        "size": "medium"
                    },
                    {
                        "#text": "https://lastfm.freetls.fastly.net/i/u/174s/a1f4e8c6fd31f2c333d510b097ce40f0.png",
                        "size": "large"
                    },
                    {
                        "#text": "https://lastfm.freetls.fastly.net/i/u/300x300/a1f4e8c6fd31f2c333d510b097ce40f0.png",
                        "size": "extralarge"
                    }
                ]
            },
            {
                "name": "If I Could Turn Back Time - Cher's Greatest Hits",
                "playcount": 57501,
                "url": "https://www.last.fm/music/Cher/If+I+Could+Turn+Back+Time+-+Cher%27s+Greatest+Hits",
                "artist": {
                    "name": "Cher",
                    "mbid": "bfcc6d75-a6a5-4bc6-8282-47aec8531818",
                    "url": "https://www.last.fm/music/Cher"
                },
                "image": [
                    {
                        "#text": "https://lastfm.freetls.fastly.net/i/u/34s/ff9b25b827134d87b5dee238f8e8c922.png",
                        "size": "small"
                    },
                    {
                        "#text": "https://lastfm.freetls.fastly.net/i/u/64s/ff9b25b827134d87b5dee238f8e8c922.png",
                        "size": "medium"
                    },
                    {
                        "#text": "https://lastfm.freetls.fastly.net/i/u/174s/ff9b25b827134d87b5dee238f8e8c922.png",
                        "size": "large"
                    },
                    {
                        "#text": "https://lastfm.freetls.fastly.net/i/u/300x300/ff9b25b827134d87b5dee238f8e8c922.png",
                        "size": "extralarge"
                    }
                ]
            },
            {
                "name": "The Very Best of Cher [Warner Bros #1]",
                "playcount": 79332,
                "url": "https://www.last.fm/music/Cher/The+Very+Best+of+Cher+%5BWarner+Bros+%231%5D",
                "artist": {
                    "name": "Cher",
                    "mbid": "bfcc6d75-a6a5-4bc6-8282-47aec8531818",
                    "url": "https://www.last.fm/music/Cher"
                },
                "image": [
                    {
                        "#text": "https://lastfm.freetls.fastly.net/i/u/34s/3642566fa36747fba307b0fbcd916bb7.png",
                        "size": "small"
                    },
                    {
                        "#text": "https://lastfm.freetls.fastly.net/i/u/64s/3642566fa36747fba307b0fbcd916bb7.png",
                        "size": "medium"
                    },
                    {
                        "#text": "https://lastfm.freetls.fastly.net/i/u/174s/3642566fa36747fba307b0fbcd916bb7.png",
                        "size": "large"
                    },
                    {
                        "#text": "https://lastfm.freetls.fastly.net/i/u/300x300/3642566fa36747fba307b0fbcd916bb7.png",
                        "size": "extralarge"
                    }
                ]
            },
            {
                "name": "20th Century Masters: The Millennium Collection: Best Of Cher",
                "playcount": 45237,
                "url": "https://www.last.fm/music/Cher/20th+Century+Masters:+The+Millennium+Collection:+Best+Of+Cher",
                "artist": {
                    "name": "Cher",
                    "mbid": "bfcc6d75-a6a5-4bc6-8282-47aec8531818",
                    "url": "https://www.last.fm/music/Cher"
                },
                "image": [
                    {
                        "#text": "https://lastfm.freetls.fastly.net/i/u/34s/1e7a7c7c7f4243ddbe44e2010d39da6a.png",
                        "size": "small"
                    },
                    {
                        "#text": "https://lastfm.freetls.fastly.net/i/u/64s/1e7a7c7c7f4243ddbe44e2010d39da6a.png",
                        "size": "medium"
                    },
                    {
                        "#text": "https://lastfm.freetls.fastly.net/i/u/174s/1e7a7c7c7f4243ddbe44e2010d39da6a.png",
                        "size": "large"
                    },
                    {
                        "#text": "https://lastfm.freetls.fastly.net/i/u/300x300/1e7a7c7c7f4243ddbe44e2010d39da6a.png",
                        "size": "extralarge"
                    }
                ]
            },
            {
                "name": "3614 Jackson Highway",
                "playcount": 85931,
                "mbid": "a67bf28f-d1f5-4fcc-b408-4ef625402dc2",
                "url": "https://www.last.fm/music/Cher/3614+Jackson+Highway",
                "artist": {
                    "name": "Cher",
                    "mbid": "bfcc6d75-a6a5-4bc6-8282-47aec8531818",
                    "url": "https://www.last.fm/music/Cher"
                },
                "image": [
                    {
                        "#text": "https://lastfm.freetls.fastly.net/i/u/34s/2dce13542818469fa9d873569ed36374.png",
                        "size": "small"
                    },
                    {
                        "#text": "https://lastfm.freetls.fastly.net/i/u/64s/2dce13542818469fa9d873569ed36374.png",
                        "size": "medium"
                    },
                    {
                        "#text": "https://lastfm.freetls.fastly.net/i/u/174s/2dce13542818469fa9d873569ed36374.png",
                        "size": "large"
                    },
                    {
                        "#text": "https://lastfm.freetls.fastly.net/i/u/300x300/2dce13542818469fa9d873569ed36374.png",
                        "size": "extralarge"
                    }
                ]
            },
            {
                "name": "A Different Kind of Love Song",
                "playcount": 16092,
                "mbid": "f8912620-c18c-446b-9183-c558935b7689",
                "url": "https://www.last.fm/music/Cher/A+Different+Kind+of+Love+Song",
                "artist": {
                    "name": "Cher",
                    "mbid": "bfcc6d75-a6a5-4bc6-8282-47aec8531818",
                    "url": "https://www.last.fm/music/Cher"
                },
                "image": [
                    {
                        "#text": "https://lastfm.freetls.fastly.net/i/u/34s/043c5e02bac471e8e23d1e55145079c0.png",
                        "size": "small"
                    },
                    {
                        "#text": "https://lastfm.freetls.fastly.net/i/u/64s/043c5e02bac471e8e23d1e55145079c0.png",
                        "size": "medium"
                    },
                    {
                        "#text": "https://lastfm.freetls.fastly.net/i/u/174s/043c5e02bac471e8e23d1e55145079c0.png",
                        "size": "large"
                    },
                    {
                        "#text": "https://lastfm.freetls.fastly.net/i/u/300x300/043c5e02bac471e8e23d1e55145079c0.png",
                        "size": "extralarge"
                    }
                ]
            },
            {
                "name": "All Or Nothing",
                "playcount": 19590,
                "mbid": "28e23680-1c42-4d87-83ae-d74752538d3c",
                "url": "https://www.last.fm/music/Cher/All+Or+Nothing",
                "artist": {
                    "name": "Cher",
                    "mbid": "bfcc6d75-a6a5-4bc6-8282-47aec8531818",
                    "url": "https://www.last.fm/music/Cher"
                },
                "image": [
                    {
                        "#text": "https://lastfm.freetls.fastly.net/i/u/34s/5ab99d48a9dd91ec9bc3f1861932c5e3.png",
                        "size": "small"
                    },
                    {
                        "#text": "https://lastfm.freetls.fastly.net/i/u/64s/5ab99d48a9dd91ec9bc3f1861932c5e3.png",
                        "size": "medium"
                    },
                    {
                        "#text": "https://lastfm.freetls.fastly.net/i/u/174s/5ab99d48a9dd91ec9bc3f1861932c5e3.png",
                        "size": "large"
                    },
                    {
                        "#text": "https://lastfm.freetls.fastly.net/i/u/300x300/5ab99d48a9dd91ec9bc3f1861932c5e3.png",
                        "size": "extralarge"
                    }
                ]
            },
            {
                "name": "Song for the Lonely",
                "playcount": 16540,
                "mbid": "cd4de50c-905a-4045-89a3-6576cc2f4f5b",
                "url": "https://www.last.fm/music/Cher/Song+for+the+Lonely",
                "artist": {
                    "name": "Cher",
                    "mbid": "bfcc6d75-a6a5-4bc6-8282-47aec8531818",
                    "url": "https://www.last.fm/music/Cher"
                },
                "image": [
                    {
                        "#text": "https://lastfm.freetls.fastly.net/i/u/34s/11b14ef18e1d4dacb2f58d42287e1cc0.png",
                        "size": "small"
                    },
                    {
                        "#text": "https://lastfm.freetls.fastly.net/i/u/64s/11b14ef18e1d4dacb2f58d42287e1cc0.png",
                        "size": "medium"
                    },
                    {
                        "#text": "https://lastfm.freetls.fastly.net/i/u/174s/11b14ef18e1d4dacb2f58d42287e1cc0.png",
                        "size": "large"
                    },
                    {
                        "#text": "https://lastfm.freetls.fastly.net/i/u/300x300/11b14ef18e1d4dacb2f58d42287e1cc0.png",
                        "size": "extralarge"
                    }
                ]
            },
            {
                "name": "Dark Lady",
                "playcount": 115007,
                "mbid": "aa119742-4d13-408a-a453-be54bc79ba61",
                "url": "https://www.last.fm/music/Cher/Dark+Lady",
                "artist": {
                    "name": "Cher",
                    "mbid": "bfcc6d75-a6a5-4bc6-8282-47aec8531818",
                    "url": "https://www.last.fm/music/Cher"
                },
                "image": [
                    {
                        "#text": "https://lastfm.freetls.fastly.net/i/u/34s/28fe29bb838bbbc910b326a37e7018de.png",
                        "size": "small"
                    },
                    {
                        "#text": "https://lastfm.freetls.fastly.net/i/u/64s/28fe29bb838bbbc910b326a37e7018de.png",
                        "size": "medium"
                    },
                    {
                        "#text": "https://lastfm.freetls.fastly.net/i/u/174s/28fe29bb838bbbc910b326a37e7018de.png",
                        "size": "large"
                    },
                    {
                        "#text": "https://lastfm.freetls.fastly.net/i/u/300x300/28fe29bb838bbbc910b326a37e7018de.png",
                        "size": "extralarge"
                    }
                ]
            },
            {
                "name": "Closer to the Truth (Deluxe Edition)",
                "playcount": 84433,
                "url": "https://www.last.fm/music/Cher/Closer+to+the+Truth+(Deluxe+Edition)",
                "artist": {
                    "name": "Cher",
                    "mbid": "bfcc6d75-a6a5-4bc6-8282-47aec8531818",
                    "url": "https://www.last.fm/music/Cher"
                },
                "image": [
                    {
                        "#text": "https://lastfm.freetls.fastly.net/i/u/34s/39218b7f49f849f1833732dfc48f623b.png",
                        "size": "small"
                    },
                    {
                        "#text": "https://lastfm.freetls.fastly.net/i/u/64s/39218b7f49f849f1833732dfc48f623b.png",
                        "size": "medium"
                    },
                    {
                        "#text": "https://lastfm.freetls.fastly.net/i/u/174s/39218b7f49f849f1833732dfc48f623b.png",
                        "size": "large"
                    },
                    {
                        "#text": "https://lastfm.freetls.fastly.net/i/u/300x300/39218b7f49f849f1833732dfc48f623b.png",
                        "size": "extralarge"
                    }
                ]
            },
            {
                "name": "Mamma Mia! Here We Go Again (Original Motion Picture Soundtrack)",
                "playcount": 40734,
                "url": "https://www.last.fm/music/Cher/Mamma+Mia%21+Here+We+Go+Again+(Original+Motion+Picture+Soundtrack)",
                "artist": {
                    "name": "Cher",
                    "mbid": "bfcc6d75-a6a5-4bc6-8282-47aec8531818",
                    "url": "https://www.last.fm/music/Cher"
                },
                "image": [
                    {
                        "#text": "https://lastfm.freetls.fastly.net/i/u/34s/95b24a325896087b372e7f64832a4ead.png",
                        "size": "small"
                    },
                    {
                        "#text": "https://lastfm.freetls.fastly.net/i/u/64s/95b24a325896087b372e7f64832a4ead.png",
                        "size": "medium"
                    },
                    {
                        "#text": "https://lastfm.freetls.fastly.net/i/u/174s/95b24a325896087b372e7f64832a4ead.png",
                        "size": "large"
                    },
                    {
                        "#text": "https://lastfm.freetls.fastly.net/i/u/300x300/95b24a325896087b372e7f64832a4ead.png",
                        "size": "extralarge"
                    }
                ]
            },
            {
                "name": "Burlesque (Original Motion Picture Soundtrack)",
                "playcount": 87120,
                "url": "https://www.last.fm/music/Cher/Burlesque+(Original+Motion+Picture+Soundtrack)",
                "artist": {
                    "name": "Cher",
                    "mbid": "bfcc6d75-a6a5-4bc6-8282-47aec8531818",
                    "url": "https://www.last.fm/music/Cher"
                },
                "image": [
                    {
                        "#text": "https://lastfm.freetls.fastly.net/i/u/34s/9ef4eaedbae04430bfc78e23c5d3ee2b.png",
                        "size": "small"
                    },
                    {
                        "#text": "https://lastfm.freetls.fastly.net/i/u/64s/9ef4eaedbae04430bfc78e23c5d3ee2b.png",
                        "size": "medium"
                    },
                    {
                        "#text": "https://lastfm.freetls.fastly.net/i/u/174s/9ef4eaedbae04430bfc78e23c5d3ee2b.png",
                        "size": "large"
                    },
                    {
                        "#text": "https://lastfm.freetls.fastly.net/i/u/300x300/9ef4eaedbae04430bfc78e23c5d3ee2b.png",
                        "size": "extralarge"
                    }
                ]
            },
            {
                "name": "SOS",
                "playcount": 36744,
                "url": "https://www.last.fm/music/Cher/SOS",
                "artist": {
                    "name": "Cher",
                    "mbid": "bfcc6d75-a6a5-4bc6-8282-47aec8531818",
                    "url": "https://www.last.fm/music/Cher"
                },
                "image": [
                    {
                        "#text": "https://lastfm.freetls.fastly.net/i/u/34s/69dc16655f09609fe2eb558c30f1da1b.png",
                        "size": "small"
                    },
                    {
                        "#text": "https://lastfm.freetls.fastly.net/i/u/64s/69dc16655f09609fe2eb558c30f1da1b.png",
                        "size": "medium"
                    },
                    {
                        "#text": "https://lastfm.freetls.fastly.net/i/u/174s/69dc16655f09609fe2eb558c30f1da1b.png",
                        "size": "large"
                    },
                    {
                        "#text": "https://lastfm.freetls.fastly.net/i/u/300x300/69dc16655f09609fe2eb558c30f1da1b.png",
                        "size": "extralarge"
                    }
                ]
            },
            {
                "name": "The Sonny Side of Chér",
                "playcount": 36464,
                "mbid": "555c4b26-a6f8-4fcb-8407-3909e035f003",
                "url": "https://www.last.fm/music/Cher/The+Sonny+Side+of+Ch%C3%A9r",
                "artist": {
                    "name": "Cher",
                    "mbid": "bfcc6d75-a6a5-4bc6-8282-47aec8531818",
                    "url": "https://www.last.fm/music/Cher"
                },
                "image": [
                    {
                        "#text": "https://lastfm.freetls.fastly.net/i/u/34s/0afae15dd27103b089c3e5508dce2266.png",
                        "size": "small"
                    },
                    {
                        "#text": "https://lastfm.freetls.fastly.net/i/u/64s/0afae15dd27103b089c3e5508dce2266.png",
                        "size": "medium"
                    },
                    {
                        "#text": "https://lastfm.freetls.fastly.net/i/u/174s/0afae15dd27103b089c3e5508dce2266.png",
                        "size": "large"
                    },
                    {
                        "#text": "https://lastfm.freetls.fastly.net/i/u/300x300/0afae15dd27103b089c3e5508dce2266.png",
                        "size": "extralarge"
                    }
                ]
            },
            {
                "name": "Half-Breed",
                "playcount": 56587,
                "url": "https://www.last.fm/music/Cher/Half-Breed",
                "artist": {
                    "name": "Cher",
                    "mbid": "bfcc6d75-a6a5-4bc6-8282-47aec8531818",
                    "url": "https://www.last.fm/music/Cher"
                },
                "image": [
                    {
                        "#text": "https://lastfm.freetls.fastly.net/i/u/34s/05b07f097a3a8720cdbc83a48ea9e047.png",
                        "size": "small"
                    },
                    {
                        "#text": "https://lastfm.freetls.fastly.net/i/u/64s/05b07f097a3a8720cdbc83a48ea9e047.png",
                        "size": "medium"
                    },
                    {
                        "#text": "https://lastfm.freetls.fastly.net/i/u/174s/05b07f097a3a8720cdbc83a48ea9e047.png",
                        "size": "large"
                    },
                    {
                        "#text": "https://lastfm.freetls.fastly.net/i/u/300x300/05b07f097a3a8720cdbc83a48ea9e047.png",
                        "size": "extralarge"
                    }
                ]
            },
            {
                "name": "The Music's No Good Without You",
                "playcount": 13765,
                "mbid": "efbb6230-96ce-4820-b8ca-ac5fc73300c2",
                "url": "https://www.last.fm/music/Cher/The+Music%27s+No+Good+Without+You",
                "artist": {
                    "name": "Cher",
                    "mbid": "bfcc6d75-a6a5-4bc6-8282-47aec8531818",
                    "url": "https://www.last.fm/music/Cher"
                },
                "image": [
                    {
                        "#text": "https://lastfm.freetls.fastly.net/i/u/34s/95cc30c02ff6868132b5ac0281ee03b0.png",
                        "size": "small"
                    },
                    {
                        "#text": "https://lastfm.freetls.fastly.net/i/u/64s/95cc30c02ff6868132b5ac0281ee03b0.png",
                        "size": "medium"
                    },
                    {
                        "#text": "https://lastfm.freetls.fastly.net/i/u/174s/95cc30c02ff6868132b5ac0281ee03b0.png",
                        "size": "large"
                    },
                    {
                        "#text": "https://lastfm.freetls.fastly.net/i/u/300x300/95cc30c02ff6868132b5ac0281ee03b0.png",
                        "size": "extralarge"
                    }
                ]
            },
            {
                "name": "Woman's World",
                "playcount": 59703,
                "mbid": "5c3a4ee5-3add-4b87-abb3-d4ab7fa50f69",
                "url": "https://www.last.fm/music/Cher/Woman%27s+World",
                "artist": {
                    "name": "Cher",
                    "mbid": "bfcc6d75-a6a5-4bc6-8282-47aec8531818",
                    "url": "https://www.last.fm/music/Cher"
                },
                "image": [
                    {
                        "#text": "https://lastfm.freetls.fastly.net/i/u/34s/c175ef57aa5a4c338817df9ea83add31.png",
                        "size": "small"
                    },
                    {
                        "#text": "https://lastfm.freetls.fastly.net/i/u/64s/c175ef57aa5a4c338817df9ea83add31.png",
                        "size": "medium"
                    },
                    {
                        "#text": "https://lastfm.freetls.fastly.net/i/u/174s/c175ef57aa5a4c338817df9ea83add31.png",
                        "size": "large"
                    },
                    {
                        "#text": "https://lastfm.freetls.fastly.net/i/u/300x300/c175ef57aa5a4c338817df9ea83add31.png",
                        "size": "extralarge"
                    }
                ]
            },
            {
                "name": "The Best Of Cher Volume 2 20th Century Masters The Millennium Collection",
                "playcount": 28890,
                "url": "https://www.last.fm/music/Cher/The+Best+Of+Cher+Volume+2+20th+Century+Masters+The+Millennium+Collection",
                "artist": {
                    "name": "Cher",
                    "mbid": "bfcc6d75-a6a5-4bc6-8282-47aec8531818",
                    "url": "https://www.last.fm/music/Cher"
                },
                "image": [
                    {
                        "#text": "https://lastfm.freetls.fastly.net/i/u/34s/29a3ac97918143f0b3b4e5c3cc2a448f.png",
                        "size": "small"
                    },
                    {
                        "#text": "https://lastfm.freetls.fastly.net/i/u/64s/29a3ac97918143f0b3b4e5c3cc2a448f.png",
                        "size": "medium"
                    },
                    {
                        "#text": "https://lastfm.freetls.fastly.net/i/u/174s/29a3ac97918143f0b3b4e5c3cc2a448f.png",
                        "size": "large"
                    },
                    {
                        "#text": "https://lastfm.freetls.fastly.net/i/u/300x300/29a3ac97918143f0b3b4e5c3cc2a448f.png",
                        "size": "extralarge"
                    }
                ]
            },
            {
                "name": "The Ultimate Collection",
                "playcount": 32262,
                "url": "https://www.last.fm/music/Cher/The+Ultimate+Collection",
                "artist": {
                    "name": "Cher",
                    "mbid": "bfcc6d75-a6a5-4bc6-8282-47aec8531818",
                    "url": "https://www.last.fm/music/Cher"
                },
                "image": [
                    {
                        "#text": "https://lastfm.freetls.fastly.net/i/u/34s/921e01612db09e7981ff3d265def2fea.png",
                        "size": "small"
                    },
                    {
                        "#text": "https://lastfm.freetls.fastly.net/i/u/64s/921e01612db09e7981ff3d265def2fea.png",
                        "size": "medium"
                    },
                    {
                        "#text": "https://lastfm.freetls.fastly.net/i/u/174s/921e01612db09e7981ff3d265def2fea.png",
                        "size": "large"
                    },
                    {
                        "#text": "https://lastfm.freetls.fastly.net/i/u/300x300/921e01612db09e7981ff3d265def2fea.png",
                        "size": "extralarge"
                    }
                ]
            },
            {
                "name": "Believe (Remixes)",
                "playcount": 16778,
                "url": "https://www.last.fm/music/Cher/Believe+(Remixes)",
                "artist": {
                    "name": "Cher",
                    "mbid": "bfcc6d75-a6a5-4bc6-8282-47aec8531818",
                    "url": "https://www.last.fm/music/Cher"
                },
                "image": [
                    {
                        "#text": "https://lastfm.freetls.fastly.net/i/u/34s/57958796b69146d6691daeb715ada96c.png",
                        "size": "small"
                    },
                    {
                        "#text": "https://lastfm.freetls.fastly.net/i/u/64s/57958796b69146d6691daeb715ada96c.png",
                        "size": "medium"
                    },
                    {
                        "#text": "https://lastfm.freetls.fastly.net/i/u/174s/57958796b69146d6691daeb715ada96c.png",
                        "size": "large"
                    },
                    {
                        "#text": "https://lastfm.freetls.fastly.net/i/u/300x300/57958796b69146d6691daeb715ada96c.png",
                        "size": "extralarge"
                    }
                ]
            },
            {
                "name": "Chronicles",
                "playcount": 24386,
                "url": "https://www.last.fm/music/Cher/Chronicles",
                "artist": {
                    "name": "Cher",
                    "mbid": "bfcc6d75-a6a5-4bc6-8282-47aec8531818",
                    "url": "https://www.last.fm/music/Cher"
                },
                "image": [
                    {
                        "#text": "https://lastfm.freetls.fastly.net/i/u/34s/8919a1d5af0449859556c9adeed956fe.png",
                        "size": "small"
                    },
                    {
                        "#text": "https://lastfm.freetls.fastly.net/i/u/64s/8919a1d5af0449859556c9adeed956fe.png",
                        "size": "medium"
                    },
                    {
                        "#text": "https://lastfm.freetls.fastly.net/i/u/174s/8919a1d5af0449859556c9adeed956fe.png",
                        "size": "large"
                    },
                    {
                        "#text": "https://lastfm.freetls.fastly.net/i/u/300x300/8919a1d5af0449859556c9adeed956fe.png",
                        "size": "extralarge"
                    }
                ]
            }
        ],
        "@attr": {
            "artist": "Cher",
            "page": "1",
            "perPage": "50",
            "totalPages": "746",
            "total": "37263"
        }
    }
}
''');
