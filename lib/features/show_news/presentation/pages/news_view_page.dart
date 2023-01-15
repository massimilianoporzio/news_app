import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:news_app/core/constants/palette.dart';
import 'package:news_app/features/show_news/domain/entities/news_info.dart';
import 'package:intl/date_symbol_data_local.dart';

class NewsViewPage extends StatelessWidget {
  //*passo il model
  final NewsInfo newsInfo;
  const NewsViewPage({super.key, required this.newsInfo});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios_new_rounded,
            color: Palette.deepBlue,
            size: 20,
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        backgroundColor: Palette.background,
        elevation: 0,
      ),
      backgroundColor: Palette.background,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: [
              Text(
                newsInfo.title ?? '-- No Title --',
                style: const TextStyle(
                    color: Palette.deepBlue,
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 16,
              ),
              Container(
                height: 300,
                color: Palette.lightGrey,
                child: newsInfo.imageURL != null
                    ? Image.network(
                        newsInfo.imageURL!,
                        fit: BoxFit.cover,
                      )
                    : const SizedBox(),
              ),
              const SizedBox(
                height: 16,
              ),
              Text(
                _getDateInDDMMYYFormat(newsInfo.dateTime),
                style: const TextStyle(
                  color: Palette.lightGrey,
                  fontSize: 14,
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              Text(
                newsInfo.author ?? 'No author',
                style: const TextStyle(
                  color: Palette.lightGrey,
                  fontSize: 14,
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              Text(
                newsInfo.content ?? 'Sorry no content',
                style: const TextStyle(
                    color: Palette.deepBlue,
                    fontSize: 16,
                    fontWeight: FontWeight.bold),
                maxLines: 1000,
              ),
              const SizedBox(
                height: 32,
              )
            ],
          ),
        ),
      ),
    );
  }
}

String _getDateInDDMMYYFormat(DateTime dateTime) {
  initializeDateFormatting();
  final DateFormat formatter = DateFormat('dd/MM/yyyy', 'it');
  return formatter.format(dateTime);
}
