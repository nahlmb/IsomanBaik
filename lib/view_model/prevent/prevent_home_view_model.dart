import 'package:get/get.dart';
import 'package:isomanbangkit/data/model/covid_data_model.dart';
import 'package:isomanbangkit/data/provider/covid_data_provider.dart';
import 'package:isomanbangkit/data/repository/covid_data_repository.dart';

class PreventHomeViewModel extends GetxController {
  var data = CovidDataModel(total: 0, sembuh: 0, meninggal: 0).obs;
  late CovidDataRepository repository;
  PreventHomeViewModel() {
    this.repository = CovidDataRepository(provider: CovidDataProvider());
  }

  getCovidDataSummary() async {
    this.data.value = await repository.getCovidDataSummary();
  }
}
