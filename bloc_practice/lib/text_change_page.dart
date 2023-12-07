import 'package:bloc_practice/cubit/text_change_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TextChangePage extends StatelessWidget {
  const TextChangePage({super.key});

  @override
  Widget build(BuildContext context) {
    TextChangeCubit changeCubit = BlocProvider.of<TextChangeCubit>(context);
    return Scaffold(
      /// appbar
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Flutter Bloc Cubit'),
      ),

      /// body
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            BlocBuilder<TextChangeCubit, String>(
              builder: (context, textChange) {
                return Text(
                  textChange,
                  style: const TextStyle(
                    fontSize: 50,
                    color: Colors.black,
                    fontWeight: FontWeight.w700,
                  ),
                );
              },
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          changeCubit.updateText();
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
