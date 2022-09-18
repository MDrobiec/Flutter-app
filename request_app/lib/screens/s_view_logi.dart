import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:request_app/bloc/s_view_logi/bloc/s_view_logi_bloc.dart';

class SViewLogi extends StatefulWidget {
  const SViewLogi({Key? key}) : super(key: key);

  @override
  State<SViewLogi> createState() => _SViewLogi();
}

class _SViewLogi extends State<SViewLogi> {
  final SViewLogiBloc sViewLogiBloc = SViewLogiBloc();

  @override
  void initState() {
    sViewLogiBloc.add(GenerateView());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 25, 84, 27),
        title: const Text('Logi aplikacji'),
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
      create: (_) => sViewLogiBloc,
      child: BlocListener<SViewLogiBloc, SViewLogiState>(
        listener: (context, state) {},
        child: BlocBuilder<SViewLogiBloc, SViewLogiState>(
          builder: (context, state) {
            if (state is SViewLogiInitial) {
              //return ScreenLoading();
            } else if (state is SViewLogiLoading) {
              // return ScreenLoading();
            } else if (state is SViewLogiLoaded) {
              return buildViet(state.list);
            } else if (state is SViewLogiError) {}
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
