import 'package:dio/dio.dart';
import 'package:isomanbangkit/data/model/covid_data_model.dart';

class CovidDataProvider {
  final String _baseUrl = "https://apicovid19indonesia-v2.vercel.app/api/";
  late Dio dio;

  CovidDataProvider() {
    dio = Dio(BaseOptions(baseUrl: _baseUrl));
  }

  getCovidDataSummary() async {
    var response = await dio.get('indonesia');
    return CovidDataModel(
        total: response.data['positif'],
        sembuh: response.data['sembuh'],
        meninggal: response.data['meninggal']);
  }
}
