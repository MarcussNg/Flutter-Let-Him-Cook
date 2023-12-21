import 'package:freezed_annotation/freezed_annotation.dart';
part 'coincap_market_model.freezed.dart';
part 'coincap_market_model.g.dart';

@freezed
class CoincapMarketModel with _$CoincapMarketModel {
  factory CoincapMarketModel(
      {String? exchangeId,
      String? baseId,
      String? quoteId,
      String? baseSymbol,
      String? quoteSymbol,
      String? volumeUsd24Hr,
      String? priceUsd,
      String? volumePercent}) = _CoincapMarketModel;

  factory CoincapMarketModel.fromJson(Map<String, dynamic> json) =>
      _$CoincapMarketModelFromJson(json);
}
