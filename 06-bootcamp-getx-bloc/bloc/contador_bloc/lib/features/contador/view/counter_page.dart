import 'package:contador_bloc/core/core.dart';
import 'package:contador_bloc/features/contador/bloc/counter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterPage extends StatelessWidget {
  const CounterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Contador BLoC', style: AppTextStyles.appBarTitle),
        backgroundColor: AppColors.primary,
      ),
      body: Center(
        child: BlocBuilder<CounterBloc, CounterState>(
          builder: (context, state) {
            return Text(state.value.toString(), style: AppTextStyles.counter);
          },
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            heroTag: 'reset_btn',
            onPressed: () {
              context.read<CounterBloc>().add(ResetPressed());
            },
            child: Icon(Icons.refresh),
          ),
          SizedBox(width: 190),
          FloatingActionButton(
            heroTag: 'decrement_btn',
            onPressed: () {
              context.read<CounterBloc>().add(DecrementPressed());
            },
            child: Icon(Icons.remove),
          ),
          SizedBox(width: 10),
          FloatingActionButton(
            heroTag: 'increment_btn',
            onPressed: () {
              context.read<CounterBloc>().add(IncrementPressed());
            },
            child: Icon(Icons.add),
          ),
        ],
      ),
    );
  }
}
