import 'package:isomanbangkit/data/model/isoman_model.dart';
import 'package:isomanbangkit/data/provider/isoman_provider.dart';
import 'package:sp_util/sp_util.dart';

class IsomanRepository {
  IsomanProvider provider;
  IsomanRepository({required this.provider});

  Future<IsomanModel?> getIsoman() async {
    return provider.getIsoman();
  }

  addIsoman() {
    return provider.addIsoman();
  }

  updateIsoman(String startDate) {
    return provider.updateIsoman(startDate);
  }

  deleteIsoman() {
    return provider.deleteIsoman();
  }
}
