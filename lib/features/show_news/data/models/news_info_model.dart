import 'package:news_app/features/show_news/domain/entities/news_info.dart';

//*IL MODELLO MI RAPPRESENTA I DATI CHE ARRIVANO DALLA API o DB

class NewsInfoModel extends NewsInfo {
  NewsInfoModel({
    String? title,
    String? authorName,
    String? imageURL,
    String? content,
    String? dateTime,
  }) : super(
          title: title,
          author: authorName,
          imageURL: imageURL,
          content: content,
          dateTime: _getDateTimeInDateTimeFormat(dateTime),
        );
  //*prende stringa nullable in input
  //*restituisce DateTime in uscita
  //*se string è null O se non riesce a fare il parsing
  //*restituisce DateTime.now()
  static _getDateTimeInDateTimeFormat(String? datetime) {
    if (datetime == null) {
      return DateTime.now(); //se da api ho null metto ORA in datetime format
    }
    //return null se non
    final DateTime? parsedDateTime = DateTime.tryParse(datetime);
    //se ci sono errori e in quel campo ci finisce 'Hello'
    return parsedDateTime ?? DateTime.now();
  }

  //*da mappa string,dynamic resituisce un'istanza del mio modello
  //* in pratica da JSON a NewsInfoModel QUESTO DIPENDE DALLE API!!!!
  //!LA ENTITY NEWSINFO NO!
  factory NewsInfoModel.fromMap(Map<String, dynamic> map) {
    return NewsInfoModel(
        title: map['title'],
        authorName: map['author'],
        content: '${map['content']}',
        imageURL: map['urlToImage'],
        dateTime:
            map['publishedAt'] //!dipendono tutte dal JSON che arriva da API
        );
  }
}
