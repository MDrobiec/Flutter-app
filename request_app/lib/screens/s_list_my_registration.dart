import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:request_app/bloc/s_view_my_registration/bloc/s_view_my_registration_bloc.dart';

class SViewMyRegistration extends StatefulWidget {
  const SViewMyRegistration({Key? key}) : super(key: key);

  @override
  State<SViewMyRegistration> createState() => _SViewMyRegistration();
}

class _SViewMyRegistration extends State<SViewMyRegistration> {
  final SViewMyRegistrationBloc sViewMyRegistrationBloc =
      SViewMyRegistrationBloc();

  @override
  void initState() {
    sViewMyRegistrationBloc.add(GenerateView());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 25, 84, 27),
        title: const Text('Moje zgłoszenia'),
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
      create: (_) => sViewMyRegistrationBloc,
      child: BlocListener<SViewMyRegistrationBloc, SViewMyRegistrationState>(
        listener: (context, state) {},
        child: BlocBuilder<SViewMyRegistrationBloc, SViewMyRegistrationState>(
          builder: (context, state) {
            if (state is SViewMyRegistrationInitial) {
              //return ScreenLoading();
            } else if (state is SViewMyRegistrationLoading) {
              // return ScreenLoading();
            } else if (state is SViewMyRegistrationLoaded) {
              return buildViet(state.list);
            } else if (state is SViewMyRegistrationError) {}
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
