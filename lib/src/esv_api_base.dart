import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;

import 'passage_text_response.dart';

/// An iterface for making calls to the ESV API.
class ESVAPI {
  static const _urlAuthority = 'api.esv.org';
  static const _urlPath = '/v3/passage/text/';

  String _apiKey;

  ESVAPI(String apiKey) {
    _apiKey = apiKey;
  }

  /// Makes a call to the passage text endpoint. See
  /// [documentation](https://api.esv.org/docs/passage-text/) for
  /// detailed descriptions of each parameter and the response.
  Future<PassageTextResponse> getPassageText(String verse,
      {bool include_passage_references,
      bool include_verse_numbers,
      bool include_first_verse_numbers,
      bool include_footnotes,
      bool include_footnote_body,
      bool include_headings,
      bool include_short_copyright,
      bool include_copyright,
      bool include_passage_horizontal_lines,
      bool include_heading_horizontal_lines,
      int horizontal_line_length,
      bool include_selahs,
      String indent_using,
      int indent_paragraphs,
      bool indent_poetry,
      int indent_poetry_lines,
      int indent_declares,
      int indent_psalm_doxology,
      int line_length}) async {
    if (verse == null) {
      throw Exception('Verse string cannot be null');
    }

    // compile query parameters
    var optionalQueryParams = <String, dynamic>{
      'include-passage-references': include_passage_references,
      'include-verse-numbers': include_verse_numbers,
      'include-first-verse-numbers': include_first_verse_numbers,
      'include-footnotes': include_footnotes,
      'include-footnote-body': include_footnote_body,
      'include-headings': include_headings,
      'include-short-copyright': include_short_copyright,
      'include-copyright': include_copyright,
      'include-passage-horizontal-lines': include_passage_horizontal_lines,
      'include-heading-horizontal-lines': include_heading_horizontal_lines,
      'horizontal-line-length': horizontal_line_length,
      'include-selahs': include_selahs,
      'indent-using': indent_using,
      'indent-paragraphs': indent_paragraphs,
      'indent-poetry': indent_poetry,
      'indent-poetry-lines': indent_poetry_lines,
      'indent-declares': indent_declares,
      'indent-psalm-doxology': indent_psalm_doxology,
      'line-length': line_length
    };

    var queryParams = <String, String>{'q': verse};

    // only send non null optional query parameters in the request
    for (var queryParam in optionalQueryParams.keys) {
      if (optionalQueryParams[queryParam] != null) {
        queryParams[queryParam] = optionalQueryParams[queryParam].toString();
      }
    }

    // make the http request
    var uri = Uri.https(_urlAuthority, _urlPath, queryParams);
    var response =
        await http.get(uri, headers: {"Authorization": "Token $_apiKey"});

    // decode json
    var decoded = jsonDecode(response.body);

    return PassageTextResponse.fromJson(decoded);
  }
}
