import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:request_app/bloc/s_view_registration/bloc/s_view_registration_bloc.dart';

class SViewRegistrationToResult extends StatefulWidget {
  const SViewRegistrationToResult({Key? key}) : super(key: key);

  @override
  State<SViewRegistrationToResult> createState() =>
      _SViewRegistrationToResult();
}

class _SViewRegistrationToResult extends State<SViewRegistrationToResult> {
  final SViewRegistrationBloc sViewRegistrationBloc = SViewRegistrationBloc();

  @override
  void initState() {
    sViewRegistrationBloc.add(GenerateView());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 25, 84, 27),
        title: const Text('Zgłoszenia do realizacji'),
      ),
      body: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/background.jpg"),
              fit: BoxFit.cover,
            ),
          ),
          child: buildBlocBuilder()),
    );
  }

  Widget buildBlocBuilder() {
    return BlocProvider(
      create: (_) => sViewRegistrationBloc,
      child: BlocListener<SViewRegistrationBloc, SViewRegistrationState>(
        listener: (context, state) {},
        child: BlocBuilder<SViewRegistrationBloc, SViewRegistrationState>(
          builder: (context, state) {
            if (state is SViewRegistrationInitial) {
              //return ScreenLoading();
            } else if (state is SViewRegistrationLoading) {
              // return ScreenLoading();
            } else if (state is SViewRegistrationLoaded) {
              return buildViet(state.list);
            } else if (state is SViewRegistrationError) {}
            return Container();
          },
        ),
      ),
    );
  }

  Widget buildViet(List list) {
    return SizedBox(child: Row(children: []));
  }
}
