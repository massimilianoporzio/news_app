import 'package:flutter/material.dart';
import 'package:news_app/core/constants/palette.dart';
import 'package:news_app/features/show_news/presentation/pages/news_view_page.dart';

import '../../../domain/entities/news_info.dart';

class NewsCard extends StatelessWidget {
  final NewsInfo newsInfo;
  const NewsCard({super.key, required this.newsInfo});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => NewsViewPage(newsInfo: newsInfo),
          ),
        );
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 16),
        height: 300,
        width: MediaQuery.of(context).size.width,
        child: Stack(children: [
          Container(
            height: 260,
            color: Palette.lightGrey,
            child: newsInfo.imageURL != null
                ? Image.network(
                    newsInfo.imageURL!,
                    fit: BoxFit.cover,
                  )
                : const SizedBox(),
          ),
          Positioned(
            left: 16,
            right: 16,
            bottom: 0,
            child: Container(
              height: 80,
              decoration: const BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                      offset: Offset(0, 2),
                      blurRadius: 4,
                      color: Colors.black12)
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Center(
                  child: Text(
                    newsInfo.title ?? '-- No title --',
                    textAlign: TextAlign.justify,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      color: Palette.deepBlue,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          )
        ]),
      ),
    );
  }
}
