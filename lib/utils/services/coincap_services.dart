import 'package:let_him_cook/model/network/my_response_model.dart';
import 'package:let_him_cook/utils/constants.dart';
import 'package:let_him_cook/utils/services/base_services.dart';

class CoincapServices extends BaseServices {
  Future<MyResponseModel> getCoinCapMarketList(int offset) async {
    String path = "api.coincap.io/v2/assets/bitcoin/markets";
    return callAPI(HttpRequestType.GET, path);
  }
}
