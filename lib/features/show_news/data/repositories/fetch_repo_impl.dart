//*implementa fetch_repo_contract

import 'package:news_app/core/failures_successes/exceptions.dart';
import 'package:news_app/core/services_locator.dart';
import 'package:news_app/features/show_news/data/datasources/fetch_from_remote_ds.dart';
import 'package:news_app/features/show_news/domain/entities/news_info.dart';
import 'package:news_app/core/failures_successes/faillures.dart';
import 'package:dartz/dartz.dart';
import 'package:news_app/features/show_news/domain/repositories/fetch_repo_contract.dart';

class FetchRepoImpl implements FetchRepo {
  @override
  Future<Either<Failure, List<NewsInfo>>> fetchNews(String? searchText) async {
    //*QUI CHIAMIAMO I DATOSOURCES
    //*se tutto ok resituisco la parte destra di Either
    try {
      final fetchFromRemoteDS = sl<FetchFromRemoteDS>();
      return Right(await fetchFromRemoteDS.fetchNews(searchText));
    } on FetchException catch (e) {
      //*se ho avuto errori che sono stati rigirati come FecthExcpetion
      //*restituisco la parte SINISTRA cioè la FAILURE che costruisico
      //*con il messaggio che trovo nella FecthException
      return Left(FetchFailure(message: e.message));
    }
  }
}
