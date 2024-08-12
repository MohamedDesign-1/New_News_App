import 'package:flutter/material.dart';
import 'package:newnewsapp/api/api_manger.dart';
import 'package:newnewsapp/models/SourceResponse.dart';
import 'package:newnewsapp/style/app_color.dart';
import 'package:newnewsapp/style/app_theme.dart';
import 'package:newnewsapp/widgets/tab_widget.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = 'home_screen';
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('News App' ,),
      ),
      body: FutureBuilder<SourceResponse?>(
      future: ApiManger.getSources(),
      builder: (context , snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(
              color: AppColors.greenColor,
            ),
          );
        } else if (snapshot.hasError) {
          Column(
            children: [
              Text('Something went wrong'),
              ElevatedButton(onPressed: (){
                ApiManger.getSources();
                setState(() {});
              }, child: Text('Try Again' , style: ThemeApp.lightTheme.textTheme.titleMedium,))
            ],
          );
        }
        if (snapshot.data!.status != 'ok') {
          return Column(
            children: [
              Text(snapshot.data!.message!),
              ElevatedButton(onPressed: (){
              ApiManger.getSources();
              setState(() {});
              }, child: Text('Try Again', style: ThemeApp.lightTheme.textTheme.titleMedium,))
            ],
          );
        }
        var sourcesList = snapshot.data!.sources!;
        return ListView.builder(
        itemBuilder: (context, index){
          return TabWidget(sourcesList: sourcesList);
        },
        itemCount: 1,
        );
      }
      ),
    );
  }
}
