import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'character_block.dart';
import 'character_events.dart';
import 'character_state.dart';

class CharacterPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (_) => CounterBloc(),
        child:
            BlocBuilder<CounterBloc, CharacterState>(builder: (context, state) {
          var impState = state as ImpState;

          return Scaffold(
              appBar: AppBar(
                title: const Text('Rick and Morty Wiki'),
              ),
              body: Center(
                  child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                      'Hello, click on this button\n to add a number to the counter',
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 20,
                        color: Colors.green,
                      )),
                  SizedBox(height: 50),
                  ElevatedButton(
                      onPressed: () =>
                          context.read<CounterBloc>().add(ClickEvent()),
                      child: Text('${impState.clickCount}')),
                  ElevatedButton(
                      onPressed: () =>
                          context.read<CounterBloc>().add(ResetEvent()),
                      child: Text('Reset the counter'))
                ],
              )));
        }));
  }
}
