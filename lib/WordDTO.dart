import 'dart:convert';

import 'package:freezed_annotation/freezed_annotation.dart';

part 'WordDTO.g.dart';

// flutter pub run build_runner build --delete-conflicting-outputs
@JsonSerializable()
class WordDTO {
  WordDTO(this.uid, this.author, this.content, this.latitude, this.longitude);

  final int? uid;
  final String? author;
  final String? content;
  final double? latitude;
  final double? longitude;

  Map<String, dynamic> toJson() => _$WordDTOToJson(this);

  factory WordDTO.fromJson(Map<String, dynamic> map) => _$WordDTOFromJson(map);



}
