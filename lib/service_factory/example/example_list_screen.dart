import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc_factory.dart';

import 'get_list_service.dart';
import 'model.dart';

// note this must be separated folder
class TestExampleListScreen extends StatelessWidget {
  const TestExampleListScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(providers: [
      BlocProvider<SampleListBloc>(
          create: (context) =>
              SampleListBloc(repo: createLocalListRepoSample()))
    ], child: TestBlocContent());
  }
}

class TestBlocContent extends StatelessWidget {
  const TestBlocContent({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder(
      bloc: BlocProvider.of<SampleListBloc>(context)
        ..add(
            SeExecute<SampleListRequestArgs>(SampleListRequestArgs("sample"))),
      builder: (_, state) {
        if (state is SeFailed) {
          return Text('error');
        }
        if (state is SeLoaded<List<SampleViewModel>>) {
          print(state.data);
          return Scaffold(
            appBar: AppBar(title: Text('test bloc')),
            body: Repload(),
          );
        }
        return Text('loading');
      },
    );
  }
}

class Repload extends StatelessWidget {
  const Repload({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ElevatedButton(
        child: Text('testing'),
        onPressed: () {
          BlocProvider.of<SampleListBloc>(context).add(
              SeExecute<SampleListRequestArgs>(SampleListRequestArgs(
                  "param sample ca be object: " +
                      Random().nextInt(1000).toString())));
        },
      ),
    );
  }
}
