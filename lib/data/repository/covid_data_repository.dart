import 'package:isomanbangkit/data/model/covid_data_model.dart';
import 'package:isomanbangkit/data/provider/covid_data_provider.dart';

class CovidDataRepository {
  CovidDataProvider provider;
  CovidDataRepository({required this.provider});

  Future<CovidDataModel> getCovidDataSummary() {
    return provider.getCovidDataSummary();
  }
}
