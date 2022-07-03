import 'package:freezed_annotation/freezed_annotation.dart';
part 'definition.freezed.dart';
part 'definition.g.dart';

@freezed
class Definition with _$Definition {
  factory Definition({
    @JsonKey(name: 'id') int? id,
    @JsonKey(name: 'name') String? name,
    @JsonKey(name: 'tableName') String? tableName,
  }) = _Definition;

  factory Definition.fromJson(Map<String, dynamic> json) =>
      _$DefinitionFromJson(json);
  //   Map<String, dynamic> toMap() {
  //   return {'id': id, 'name': name, 'tableName': tableName};
  // }

}
