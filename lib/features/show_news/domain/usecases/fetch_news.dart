//*rappresenta il caso d'uso "recupero le news"
import 'package:dartz/dartz.dart';
import 'package:news_app/features/show_news/domain/entities/news_info.dart';
import 'package:news_app/features/show_news/domain/repositories/fetch_repo_contract.dart';

import '../../../../core/failures_successes/faillures.dart';

class FetchNewsUsecase {
  //*dipenda da mio repo fetchRepo
  final FetchRepo fetchRepo;

  FetchNewsUsecase({required this.fetchRepo});
  //*metodo che recupera le news
  Future<Either<Failure, List<NewsInfo>>> fetchNews(String? searchText) {
    return fetchRepo.fetchNews(searchText);
  }
}
