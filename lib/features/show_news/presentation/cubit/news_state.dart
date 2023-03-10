part of 'news_cubit.dart';

abstract class NewsState extends Equatable {
  const NewsState();

  @override
  List<Object> get props => [];
}

class NewsInitial extends NewsState {
  final List<NewsInfo> news;

  const NewsInitial({required this.news}) : super();
}

//*SE HO QUALCOSA NEL SEARCH TEXT
class NewsInitialSearch extends NewsState {
  final List<NewsInfo> news;

  const NewsInitialSearch({required this.news}) : super();
}

class NewsLoading extends NewsState {}

class NewsError extends NewsState {}

class NewsEmpty extends NewsState {}
