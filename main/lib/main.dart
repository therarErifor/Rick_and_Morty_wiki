import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Rick and Morty Wiki',
        theme: ThemeData(
          primarySwatch: Colors.amber,
        ),
        home: MainPage());
  }
}

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (_) => CounterBloc(),
        child: BlocBuilder<CounterBloc, State>(builder: (context, state) {
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

abstract class Event {}

class ClickEvent extends Event {}

class ResetEvent extends Event {}

class ImpEvent {}

class CounterBloc extends Bloc<Event, State> {
  int _clickCount = 0;

  CounterBloc() : super(ImpState(0)) {
    on<ClickEvent>(onClick);
    on<ResetEvent>(resetCount);
  }

  void onClick(ClickEvent event, Emitter<State> emitter) {
    _clickCount++;
    emitter(ImpState(_clickCount));
  }

  void resetCount(ResetEvent event, Emitter<State> emitter) {
    _clickCount = 0;
    emitter(ImpState(_clickCount));
  }
}
// class ResetBlock extends Block<Event, State>{
//
// }

abstract class State {}

class ImpState extends State {
  ImpState(this.clickCount);

  final int clickCount;
}

//
// class MyHomePage extends StatefulWidget {
//   const MyHomePage({super.key, required this.title});
//
//   final String title;
//
//   @override
//   State<MyHomePage> createState() => _MyHomePageState();
// }
//
// class _MyHomePageState extends State<MyHomePage> {
//   int _counter = 0;
//   final String _baseUrl = 'rickandmortyapi.com';
//   String reusltURL = '';
//   _ku(){
//
//     final uri = Uri.https(_baseUrl);
//     return uri;
//   }
//
//   void _incrementCounter() {
//     setState(() {
//       reusltURL = _ku();
//       _counter++;
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(widget.title),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             const Text(
//               'You have pushed the button this many times:',
//             ),
//             Text(
//               '$reusltURL',
//               style: Theme.of(context).textTheme.headline4,
//             ),
//           ],
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: _incrementCounter,
//         tooltip: 'Increment',
//         child: const Icon(Icons.add),
//       ), // This trailing comma makes auto-formatting nicer for build methods.
//     );
//   }
// }
