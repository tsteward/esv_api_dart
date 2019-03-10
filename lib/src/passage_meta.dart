import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';

part 'passage_meta.g.dart';

@immutable
@JsonSerializable()
class PassageMeta {
  final String canonical;
  final List<int> chapter_start;
  final List<int> chapter_end;
  final int prev_verse;
  final int next_verse;
  final List<int> prev_chapter;
  final List<int> next_chapter;

  PassageMeta({
    this.canonical,
    this.chapter_start,
    this.chapter_end,
    this.prev_verse,
    this.next_verse,
    this.prev_chapter,
    this.next_chapter,
  });

  factory PassageMeta.fromJson(dynamic json) => _$PassageMetaFromJson(json);
  dynamic toJson() => _$PassageMetaToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}
