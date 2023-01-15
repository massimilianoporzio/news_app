import 'package:get_it/get_it.dart';
import 'package:news_app/core/services/api_service.dart';
import 'package:news_app/features/show_news/data/datasources/fetch_from_remote_ds.dart';
import 'package:news_app/features/show_news/domain/repositories/fetch_repo_contract.dart';
import 'package:news_app/features/show_news/domain/usecases/fetch_news.dart';

import '../features/show_news/data/repositories/fetch_repo_impl.dart';

final GetIt sl = GetIt.instance;

//*TUTTI I SERVIZI, REPOSITORIES E DATASOURCES LI REGISTRO COME SINGLETON
//* anche i USE CASEs
//*li registro come apiservice ma l'istanza che ci metto è l'implmentazione
void setupServices() {
  sl.registerSingleton<ApiService>(ApiServiceImpl());
  sl.registerSingleton<FetchRepo>(FetchRepoImpl());
  sl.registerSingleton<FetchFromRemoteDS>(FetchFromRemoteDSImpl());
  sl.registerSingleton<FetchNewsUsecase>(FetchNewsUsecase());
}
