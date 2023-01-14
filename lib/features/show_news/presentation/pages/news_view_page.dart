import 'package:flutter/material.dart';
import 'package:news_app/core/constants/palette.dart';

class NewsViewPage extends StatelessWidget {
  const NewsViewPage({super.key});

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
              const Text(
                'News Title',
                style: TextStyle(
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
                child: Image.network(
                  'https://www.smartworld.it/wp-content/uploads/2021/09/apple-final-2021-hd-alternativa-1280x720.jpg',
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              const Text(
                '01/01/2023',
                style: TextStyle(
                  color: Palette.lightGrey,
                  fontSize: 14,
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              const Text(
                'Author Name, Publisher name',
                style: TextStyle(
                  color: Palette.lightGrey,
                  fontSize: 14,
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              const Text(
                'Sint voluptate aliqua magna ipsum culpa dolor nulla non mollit sunt aliqua. Culpa sunt pariatur officia nisi aliquip laboris eiusmod irure laborum irure ut do. Voluptate id magna aliquip reprehenderit laborum aliquip occaecat magna excepteur sit cupidatat enim anim. Esse officia qui incididunt enim sunt dolor ad ullamco incididunt magna mollit anim commodo magna.Sint cupidatat deserunt reprehenderit fugiat pariatur sint. Labore duis adipisicing dolor deserunt non mollit nulla elit. Fugiat duis deserunt Lorem aliqua eiusmod aliqua Lorem ipsum. Reprehenderit et officia Lorem cillum et ipsum nostrud tempor elit. Id fugiat deserunt consequat officia ut tempor dolore laboris ea nulla ea fugiat. Anim aliqua nulla aliquip minim fugiat deserunt aute sit nulla magna id labore.',
                style: TextStyle(
                    color: Palette.deepBlue,
                    fontSize: 16,
                    fontWeight: FontWeight.bold),
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
