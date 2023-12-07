import 'package:bloc_practice/cubit/counter_cubit.dart';
import 'package:bloc_practice/text_change_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    CounterCubit counterCubit = BlocProvider.of<CounterCubit>(context);
    return Scaffold(
      /// appbar
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Flutter Bloc Cubit'),
      ),

      /// body
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            BlocBuilder<CounterCubit, int>(
              bloc: counterCubit,
              builder: (context, counter) {
                return Text(
                  counter.toString(),
                  style: Theme.of(context).textTheme.headlineMedium,
                );
              },
            ),
          ],
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: () {
              counterCubit.increment();
            },
            tooltip: 'Increment',
            child: const Icon(Icons.add),
          ),
          const SizedBox(height: 16.0),
          FloatingActionButton(
            onPressed: () {
              counterCubit.decrement();
            },
            tooltip: 'Decrement',
            child: const Icon(Icons.minimize),
          ),
          const SizedBox(height: 16.0),
          FloatingActionButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const TextChangePage(),
                ),
              );
            },
            tooltip: 'Next',
            child: const Icon(Icons.navigate_next),
          ),
        ],
      ),
    );
  }
}
