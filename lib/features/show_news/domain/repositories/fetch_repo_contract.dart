//*contratto ..abstract! mi dà l'interfaccio verso i dati
//* le implementazioni sono nel data domain

import 'package:dartz/dartz.dart';
import 'package:news_app/core/failures_successes/faillures.dart';
import 'package:news_app/features/show_news/domain/entities/news_info.dart';

abstract class FetchRepo {
  //*questo repo dichiara un metodo
  //*e che rest una Future (quindi async)
  //* di O una Failure (errore) O una lista di NewsInfo (mia entity)
  //*in + potrebbe avere una stringa di ricerca come input
  Future<Either<Failure, List<NewsInfo>>> fetchNews(String? searchText);
}
