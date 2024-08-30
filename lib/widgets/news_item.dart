import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:newnewsapp/models/news_response.dart';
import 'package:newnewsapp/pages/news_details/news_details.dart';
import 'package:newnewsapp/style/app_color.dart';

import '../style/app_theme.dart';

class NewsItem extends StatelessWidget {
  News news;

  NewsItem({required this.news, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Navigator.pushNamed(context, NewsDetails.routeName , arguments: news);
      },
      child: Container(
        padding: EdgeInsets.all(MediaQuery.of(context).size.height * 0.02),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              clipBehavior: Clip.antiAlias,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
              ),
              child: CachedNetworkImage(
                imageUrl: news.urlToImage ?? '',
                placeholder: (context, url) => Center(
                    child: CircularProgressIndicator(
                  color: AppColors.greenColor,
                )),
                errorWidget: (context, url, error) => Icon(Icons.error),
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.01,),
            Text(
              news.author ?? '',
              style: ThemeApp.lightTheme.textTheme.titleMedium!.copyWith(
                  color: TextColor.textColorGray.withOpacity(0.5), fontSize: 16),
            ),
            Text(
              news.title ?? '',
              style: ThemeApp.lightTheme.textTheme.titleLarge,
            ),
            Text(news.publishedAt ?? '',
              style: ThemeApp.lightTheme.textTheme.titleSmall!
                  .copyWith(color: TextColor.textColorGray.withOpacity(0.4)),
              textAlign: TextAlign.end,
            ),
          ],
        ),
      ),
    );
  }
}
