import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'show_news_event.dart';
part 'show_news_state.dart';

class ShowNewsBloc extends Bloc<ShowNewsEvent, ShowNewsState> {
  ShowNewsBloc() : super(ShowNewsInitial()) {
    on<ShowNewsEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
