import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newnewsapp/style/app_color.dart';
import 'package:newnewsapp/style/app_theme.dart';
import 'package:newnewsapp/widgets/news_item.dart';

import '../../di/di.dart';
import '../../models/SourceResponse.dart';
import 'cubit/news_states.dart';
import 'cubit/news_view_model.dart';

class NewsWidget extends StatefulWidget {
  Sources source;

  NewsWidget({required this.source, Key? key}) : super(key: key);

  @override
  State<NewsWidget> createState() => _NewsWidgetState();
}

class _NewsWidgetState extends State<NewsWidget> {
  NewsViewModel viewModel = getIt<NewsViewModel>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    viewModel.getNewsBySourceId(widget.source.id ?? '');
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewsViewModel, NewsStates>(
        bloc: viewModel,
        builder: (context, state) {
          if (state is NewsLoadingState) {
            return const Center(
              child: CircularProgressIndicator(
                color: AppColors.greenColor,
              ),
            );
          } else if (state is NewsErrorState) {
            Column(
              children: [
                Text('Something went wrong'),
                ElevatedButton(
                    onPressed: () {
                      viewModel.getNewsBySourceId(widget.source.id ?? '');
                      setState(() {});
                    },
                    child: Text('Try Again',
                      style: ThemeApp.lightTheme.textTheme.titleMedium,))
              ],
            );
          } else if (state is NewsSuccessState) {
            return ListView.builder(
              itemBuilder: (context, index) {
                return NewsItem(news: state.newsList[index]);
              },
              itemCount: state.newsList.length,
              shrinkWrap: true,
              physics: const ClampingScrollPhysics(),);
          }
          return Center(
            child: CircularProgressIndicator(
              color: AppColors.greenColor,
            ),
          );
        }
    );
  }
}