import 'package:news_app/core/failures_successes/exceptions.dart';
import 'package:news_app/core/services/api_service.dart';
import 'package:news_app/features/show_news/data/models/news_info_model.dart';

abstract class FetchFromRemoteDS {
  //*restituisce lista di
  //* DTO (il mio Model, NON LA ENTITY) quella la rest il repository
  //* o una Failure
  Future<List<NewsInfoModel>> fetchNews(String? searchText);
}

//*QUI UNA SUA IMPLEMENTAZIONE CHE USA APISERVICE
class FetchFromRemoteDSImpl implements FetchFromRemoteDS {
  final ApiService apiService;

  FetchFromRemoteDSImpl({required this.apiService});
  @override
  Future<List<NewsInfoModel>> fetchNews(String? searchText) async {
    try {
      Map<String, dynamic> data = await apiService.getData();
      //prendo solo gli 'articles' (da NewsAPI)
      List listaNews = data['articles'];
      List<Map<String, dynamic>> mapList = [];
      //*ciclo la listaNews e le trasformo in Map<String, dynamic>
      for (var element in listaNews) {
        mapList.add(element as Map<String, dynamic>);
      }
      List<NewsInfoModel> news = [];
      for (var element in mapList) {
        news.add(NewsInfoModel.fromMap(element));
      }
      return news;
    } catch (e) {
      throw FetchException(message: 'Failed to fecth data');
    }
  }
}
