import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';

import 'passage_meta.dart';

part 'passage_text_response.g.dart';

@immutable
@JsonSerializable()
class PassageTextResponse {
  final String query;
  final String canonical;
  final List<List<int>> parsed;
  final List<PassageMeta> passage_meta;
  final List<String> passages;
  final String detail;

  PassageTextResponse({
    this.query,
    this.canonical,
    this.parsed,
    this.passage_meta,
    this.passages,
    this.detail,
  });

  factory PassageTextResponse.fromJson(dynamic json) =>
      _$PassageTextResponseFromJson(json);
  dynamic toJson() => _$PassageTextResponseToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}
