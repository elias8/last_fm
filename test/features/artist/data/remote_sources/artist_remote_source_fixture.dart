import 'dart:convert';

final Map<String, dynamic> artistSearchResult = jsonDecode('''
{
  "results": {
    "opensearch:Query": {
      "#text": "",
      "role": "request",
      "searchTerms": "Cher",
      "startPage": "1"
    },
    "opensearch:totalResults": "70716",
    "opensearch:startIndex": "0",
    "opensearch:itemsPerPage": "30",
    "artistmatches": {
      "artist": [
        {
          "name": "Cher",
          "listeners": "1312493",
          "mbid": "bfcc6d75-a6a5-4bc6-8282-47aec8531818",
          "url": "https://www.last.fm/music/Cher",
          "streamable": "0",
          "image": [
            {
              "#text":
                  "https://lastfm.freetls.fastly.net/i/u/34s/2a96cbd8b46e442fc41c2b86b821562f.png",
              "size": "small"
            },
            {
              "#text":
                  "https://lastfm.freetls.fastly.net/i/u/64s/2a96cbd8b46e442fc41c2b86b821562f.png",
              "size": "medium"
            },
            {
              "#text":
                  "https://lastfm.freetls.fastly.net/i/u/174s/2a96cbd8b46e442fc41c2b86b821562f.png",
              "size": "large"
            },
            {
              "#text":
                  "https://lastfm.freetls.fastly.net/i/u/300x300/2a96cbd8b46e442fc41c2b86b821562f.png",
              "size": "extralarge"
            },
            {
              "#text":
                  "https://lastfm.freetls.fastly.net/i/u/300x300/2a96cbd8b46e442fc41c2b86b821562f.png",
              "size": "mega"
            }
          ]
        },
        {
          "name": "Cheryl Cole",
          "listeners": "631379",
          "mbid": "2d499150-1c42-4ffb-a90c-1cc635519d33",
          "url": "https://www.last.fm/music/Cheryl+Cole",
          "streamable": "0",
          "image": [
            {
              "#text":
                  "https://lastfm.freetls.fastly.net/i/u/34s/2a96cbd8b46e442fc41c2b86b821562f.png",
              "size": "small"
            },
            {
              "#text":
                  "https://lastfm.freetls.fastly.net/i/u/64s/2a96cbd8b46e442fc41c2b86b821562f.png",
              "size": "medium"
            },
            {
              "#text":
                  "https://lastfm.freetls.fastly.net/i/u/174s/2a96cbd8b46e442fc41c2b86b821562f.png",
              "size": "large"
            },
            {
              "#text":
                  "https://lastfm.freetls.fastly.net/i/u/300x300/2a96cbd8b46e442fc41c2b86b821562f.png",
              "size": "extralarge"
            },
            {
              "#text":
                  "https://lastfm.freetls.fastly.net/i/u/300x300/2a96cbd8b46e442fc41c2b86b821562f.png",
              "size": "mega"
            }
          ]
        }
      ]
    },
    "@attr": {"for": "Cher"}
  }
}
''');
