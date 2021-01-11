import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc_factory.dart';

import 'get_service.dart';
import 'model.dart';

// note this must be separated folder
class TestExampleScreen extends StatelessWidget {
  const TestExampleScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(providers: [
      BlocProvider<SampleBloc>(
          create: (context) => SampleBloc(repo: createNetworRepoSample()))
    ], child: TestBlocContent());
  }
}

class TestBlocContent extends StatelessWidget {
  const TestBlocContent({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder(
      bloc: BlocProvider.of<SampleBloc>(context)
        ..add(SeExecute<SampleRequestArgs>(SampleRequestArgs("sample"))),
      builder: (_, state) {
        if (state is SeFailed) {
          return Text('error');
        }
        if (state is SeLoaded<SampleViewModel>) {
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
          BlocProvider.of<SampleBloc>(context).add(SeExecute<SampleRequestArgs>(
              SampleRequestArgs("param sample ca be object: " +
                  Random().nextInt(1000).toString())));
        },
      ),
    );
  }
}
