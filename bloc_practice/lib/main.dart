// import 'package:bloc_practice/bloc/counter_bloc.dart';
// import 'package:bloc_practice/counter_page.dart';
// import 'package:bloc_practice/cubit/counter_cubit.dart';
// import 'package:bloc_practice/cubit/text_change_cubit.dart';
import 'package:bloc_practice/screens/multi_data_page.dart';
import 'package:bloc_practice/screens/posts_page.dart';
import 'package:bloc_practice/screens/single_post_page.dart';
import 'package:flutter/material.dart';

// import 'package:flutter_bloc/flutter_bloc.dart';
//
// import 'home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // return MultiBlocProvider(
    //   providers: [
    //     BlocProvider(
    //       create: (BuildContext context) => CounterCubit(),
    //     ),
    //     BlocProvider(
    //       create: (BuildContext context) => TextChangeCubit(),
    //     ),
    //     BlocProvider(
    //       create: (BuildContext context) => CounterBloc(),
    //     ),
    //   ],
    //   child: MaterialApp(
    //     title: 'Flutter Demo',
    //     theme: ThemeData(
    //       colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
    //       useMaterial3: true,
    //     ),
    //     home: const CounterPage(),
    //   ),
    // );
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.deepPurple,
        ),
        useMaterial3: true,
      ),
      //home: const SinglePostPage(),
      home: const PostsPage(),
    );
  }
}
