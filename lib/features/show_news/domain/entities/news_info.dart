class NewsInfo {
  //*alcuni campi potrebbero essere null
  final String? title;
  final String? author;
  final String? imageURL;
  final String? content;
  final DateTime dateTime;

  NewsInfo({
    this.title,
    this.author,
    this.imageURL,
    this.content,
    required this.dateTime,
  });
}
