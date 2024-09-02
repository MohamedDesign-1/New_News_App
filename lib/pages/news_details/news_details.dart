import 'package:flutter/material.dart';
import 'package:newnewsapp/models/news_response.dart';
import 'package:newnewsapp/style/app_theme.dart';
import 'package:newnewsapp/widgets/custom_btn.dart';

class NewsDetails extends StatelessWidget {
  static const String routeName = 'news_details';

  const NewsDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final News news = ModalRoute.of(context)!.settings.arguments as News;

    return Scaffold(
      appBar: AppBar(
        title: const Text('News App'),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Image.network(news.urlToImage!),
            const SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Text(
                    news.title ?? '',
                    style: ThemeApp.lightTheme.textTheme.titleLarge!.copyWith(
                      fontWeight: FontWeight.bold,
                      fontSize: 24,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'By: ${news.author ?? 'Unknown'}',
                        style: ThemeApp.lightTheme.textTheme.titleLarge,
                      ),
                      Text(
                        news.publishedAt ?? '',
                        style: ThemeApp.lightTheme.textTheme.titleSmall,
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  Text(
                    news.description ?? 'No description available.',
                    style: ThemeApp.lightTheme.textTheme.titleLarge,
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.03,),
                  CustomBtn(url: news.url),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
