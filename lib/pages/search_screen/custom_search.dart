import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newnewsapp/pages/search_screen/cubit/search_view_model.dart';
import 'package:newnewsapp/widgets/suggestion_widget.dart';

import '../../style/app_theme.dart';
import 'cubit/search_states.dart';

class CustomSearch extends SearchDelegate {
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () {
          query = '';
        },
        icon: Icon(Icons.clear),
      ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () {
        close(context, null);
      },
      icon: Icon(Icons.arrow_back),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    final viewModel = BlocProvider.of<SearchViewModel>(context);
    viewModel.getResults(query);
    return BlocBuilder<SearchViewModel, SearchStates>(
      bloc: viewModel,
      builder: (context, state) {
        if (state is SearchLoadingState) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is SearchErrorState) {
          return Center(child: Text(state.error ?? 'Not Founded'));
        } else if (state is SearchSuccessState) {
          return ListView.builder(
            itemCount: state.newsList.length,
            itemBuilder: (context, index) {
              return SuggestionWidget(
                description: state.newsList[index].description ?? '',
                title: state.newsList[index].title ?? '',
                image: state.newsList[index].urlToImage ?? '',
              );
            },
          );
        }
        return Center(child: Text('No results found.', style: ThemeApp.lightTheme.textTheme.titleLarge,));
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final viewModel = BlocProvider.of<SearchViewModel>(context);
    viewModel.getSuggestions(query);
    return BlocBuilder<SearchViewModel, SearchStates>(
      bloc: viewModel,
      builder: (context, state) {
        if (state is SearchLoadingState) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is SearchErrorState) {
          return Center(child: Text(state.error));
        } else if (state is SearchSuccessState) {
          return ListView.builder(
            itemCount: state.newsList.length,
            itemBuilder: (context, index) {
              return SuggestionWidget(
                description: state.newsList[index].description ?? '',
                title: state.newsList[index].title ?? '',
                image: state.newsList[index].urlToImage ?? '',
              );
            },
          );
        }
        return Center(child: Text('No results found.', style: ThemeApp.lightTheme.textTheme.titleLarge,));
      },
    );
  }
}