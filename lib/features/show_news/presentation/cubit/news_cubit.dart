import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:news_app/features/show_news/domain/entities/news_info.dart';
import 'package:news_app/features/show_news/domain/usecases/fetch_news.dart';

import '../../../../core/failures_successes/faillures.dart';
import '../../../../core/services_locator.dart';

part 'news_state.dart';

class NewsCubit extends Cubit<NewsState> {
  NewsCubit() : super(const NewsInitial(news: []));
  final FetchNewsUsecase _fetchNewsUsecase = sl<FetchNewsUsecase>();
  void fetchNews(String? searchText) async {
    emit(NewsLoading());
    final Either<Failure, List<NewsInfo>> fetchNewsresult =
        await _fetchNewsUsecase.fetchNews(searchText);
    //* l è funzione quando torna la sinistra Failure
    //* r è la funzione quando torna la destra con le news
    fetchNewsresult.fold((l) {
      emit(NewsError());
    }, (r) {
      emit(NewsInitial(news: r));
    });
  }
}
