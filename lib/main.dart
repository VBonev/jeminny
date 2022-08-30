import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'feature_filter_search/bloc/filter_cubit.dart';
import 'feature_filter_search/repository/filter_repository.dart';
import 'feature_filter_search/ui/filter_search_page.dart';
import 'strings.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => MaterialApp(
        title: Strings.appName,
        theme: ThemeData(
          primarySwatch: Colors.pink,
        ),
        home: BlocProvider(
          create: (context) => FilterCubit(
            const FilterRepository(),
          )..init(),
          child: FilterSearchPage(),
        ),
      );
}
