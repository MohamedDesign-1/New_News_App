import 'package:flutter/material.dart';
import '../pages/web_view/news_web_view.dart';
import '../style/app_color.dart';
import '../style/app_theme.dart';

class CustomBtn extends StatelessWidget {
  final String? url;

  const CustomBtn({required this.url, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if (url != null) {
          Navigator.push(context, MaterialPageRoute(builder: (context) => NewsWebView(url: url!),
            ),
          );
        }
      },
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(24),
        decoration: BoxDecoration(
          color: AppColors.greenColor,
          borderRadius: BorderRadius.circular(4),
        ),
        child: Text(
          'View Full Article',
          style: ThemeApp.lightTheme.textTheme.titleLarge!.copyWith(color: AppColors.whiteColor),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
