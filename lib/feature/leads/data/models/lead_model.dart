import 'package:freezed_annotation/freezed_annotation.dart';

part 'lead_model.freezed.dart';
part 'lead_model.g.dart';

@freezed
class Lead with _$Lead {
  const factory Lead({
    @Default(0) int id,
    @Default('') String name,
    @Default('') String company,
    @Default('') String phone,
    @Default('') String email,
    @Default('New') String status,
    @Default('Medium') String priority,
    @Default('') String productCategory,
    @Default('') String productModel,
    @Default('Direct') String source,
    @Default('') String createdAt,
  }) = _Lead;

  factory Lead.fromJson(Map<String, dynamic> json) => _$LeadFromJson(json);
}
