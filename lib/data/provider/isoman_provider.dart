import 'package:isomanbangkit/data/model/isoman_model.dart';
import 'package:sp_util/sp_util.dart';
import 'package:intl/intl.dart';

class IsomanProvider {
  addIsoman() async {
    await SpUtil.getInstance();
    bool isIsoman = SpUtil.getBool("is_isoman", defValue: false)!;
    if (!isIsoman) {
      final DateTime now = DateTime.now();
      final DateFormat formatter = DateFormat('yyyy-MM-dd');
      final String startDate = formatter.format(now);
      final String endDate = formatter.format(now.add(Duration(days: 14)));
      await SpUtil.putString("isoman_start_date", startDate);
      await SpUtil.putString("isoman_end_date", endDate);
    }
  }

  Future<IsomanModel?> getIsoman() async {
    await SpUtil.getInstance();
    bool isIsoman = SpUtil.getBool("is_isoman", defValue: false)!;
    if (isIsoman) {
      DateTime startDate =
          DateTime.parse(SpUtil.getString("isoman_start_date")!);
      DateTime endDate = DateTime.parse(SpUtil.getString("isoman_end_date")!);
      return IsomanModel(startDate: startDate, endDate: endDate);
    }
    return null;
  }

  updateIsoman(String startDate) async {
    await SpUtil.getInstance();
    bool isIsoman = SpUtil.getBool("is_isoman", defValue: false)!;
    if (isIsoman) {
      DateTime time = DateTime.parse(startDate);
      final DateFormat formatter = DateFormat('yyyy-MM-dd');
      final String begin = formatter.format(time);
      final String endDate = formatter.format(time.add(Duration(days: 14)));
      await SpUtil.putString("isoman_start_date", startDate);
      await SpUtil.putString("isoman_end_date", endDate);
    }
  }

  deleteIsoman() async {
    await SpUtil.getInstance();
    await SpUtil.putBool('isIsoman', false);
    await SpUtil.putString("isoman_start_date", "");
    await SpUtil.putString("isoman_end_date", "");
  }
}
