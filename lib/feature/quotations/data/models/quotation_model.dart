import 'package:freezed_annotation/freezed_annotation.dart';

part 'quotation_model.freezed.dart';
part 'quotation_model.g.dart';

@freezed
class QuotationItem with _$QuotationItem {
  const factory QuotationItem({
    required String id,
    required String name,
    required String description,
    required double quantity,
    required double unitPrice,
    required double taxRate,
    required double discount,
  }) = _QuotationItem;

  factory QuotationItem.fromJson(Map<String, dynamic> json) => _$QuotationItemFromJson(json);
}

@freezed
class QuotationModel with _$QuotationModel {
  const QuotationModel._();

  const factory QuotationModel({
    required String id,
    required String leadId,
    required String customerName,
    required String contactPerson,
    required String email,
    required String phone,
    required String address,
    required DateTime date,
    required DateTime validUntil,
    required List<QuotationItem> items,
    required String notes,
    required String termsAndConditions,
  }) = _QuotationModel;

  factory QuotationModel.fromJson(Map<String, dynamic> json) => _$QuotationModelFromJson(json);

  double get subtotal {
    return items.fold(0, (sum, item) => sum + (item.quantity * item.unitPrice));
  }

  double get totalTax {
    return items.fold(0, (sum, item) {
      final itemTotal = item.quantity * item.unitPrice;
      final discounted = itemTotal - item.discount;
      return sum + (discounted * (item.taxRate / 100));
    });
  }

  double get totalDiscount {
    return items.fold(0, (sum, item) => sum + item.discount);
  }

  double get grandTotal {
    return subtotal - totalDiscount + totalTax;
  }
}
