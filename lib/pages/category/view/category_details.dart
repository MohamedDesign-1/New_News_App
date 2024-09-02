import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newnewsapp/models/category.dart';
import 'package:newnewsapp/pages/category/cubit/category_details_view_model.dart';
import '../../../di/di.dart';
import '../../../style/app_color.dart';
import '../../../style/app_theme.dart';
import '../../../widgets/tab_widget.dart';
import '../cubit/source_states.dart';

class CategoryDetails extends StatefulWidget {
  final Category category;
  CategoryDetails({required this.category});

  @override
  State<CategoryDetails> createState() => _CategoryDetailsState();
}

class _CategoryDetailsState extends State<CategoryDetails> {
  CategoryDetailsViewModel viewModel = getIt<CategoryDetailsViewModel>();

  @override
  void initState() {
    super.initState();
    viewModel.getSources(widget.category.id);
  }


  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CategoryDetailsViewModel, SourceStates>(
        bloc: viewModel,
        builder: (context, state) {
          if (state is SourceLoadingState) {
            return const Center(
              child: CircularProgressIndicator(
                color: AppColors.greenColor,
              ),
            );
          } else if (state is SourceErrorState) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(state.errorMassage),
                ElevatedButton(
                  onPressed: () {
                    viewModel.getSources(widget.category.id);
                  },
                  child: Text(
                    'Try Again',
                    style: ThemeApp.lightTheme.textTheme.titleMedium,
                  ),
                ),
              ],
            );
          } else if (state is SourceSuccessState) {
            return TabWidget(sourcesList: state.sourcesList);
          }  else {
            return const Center(
              child: CircularProgressIndicator(
                color: AppColors.greenColor,
              ),
            );
          }
        }
    );
  }
}
