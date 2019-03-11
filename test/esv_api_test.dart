import 'dart:convert';

import 'package:esv_api/esv_api.dart';
import 'package:test/test.dart';

import 'api_key.dart';

void main() {
  var esvApi = ESVAPI(apiKey);

  test('Calling getPassageText with null exception expected', () {
    expect(() async => await esvApi.getPassageText(null), throwsException);
  });

  test('API give correct response', () async {
    // This was copied from the example in the api documentation https://api.esv.org/docs/passage-text/
    var responseText = '''{
  "query": "John 11:35",
  "canonical": "John 11:35",
  "parsed": [
    [
      43011035,
      43011035
    ]
  ],
  "passage_meta": [
    {
      "canonical": "John 11:35",
      "chapter_start": [
        43011001,
        43011057
      ],
      "chapter_end": [
        43011001,
        43011057
      ],
      "prev_verse": 43011034,
      "next_verse": 43011036,
      "prev_chapter": [
        43010001,
        43010042
      ],
      "next_chapter": [
        43012001,
        43012050
      ]
    }
  ],
  "passages": [
    "John 11:35\\n\\n  [35] Jesus wept. (ESV)"
  ]
}''';

    var expectedResposne =
        new PassageTextResponse.fromJson(jsonDecode(responseText));
    var actualResponse = await esvApi.getPassageText('John 11:35');

    // compare the response string since there is no equality operator implemented
    expect(actualResponse.toString(), equals(expectedResposne.toString()));
  });

  test('Passing optional parameter changes text', () async {
    var originalResponse = await esvApi.getPassageText('John 11:35');
    var parameterResponse = await esvApi.getPassageText('John 11:35', include_passage_references: false);

    // compare passage text
    expect(originalResponse.passages.first, isNot(equals(parameterResponse.passages.first)));
  });
}
