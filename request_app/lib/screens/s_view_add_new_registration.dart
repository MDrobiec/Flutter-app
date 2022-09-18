import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:request_app/bloc/s_view_registration_new/bloc/s_view_registration_details_bloc.dart';

class SViewNewRegistration extends StatefulWidget {
  const SViewNewRegistration({Key? key}) : super(key: key);

  @override
  State<SViewNewRegistration> createState() => _SViewNewRegistration();
}

class _SViewNewRegistration extends State<SViewNewRegistration> {
  final SViewRegistrationDetailsBloc sViewRegistrationDetailsBloc =
      SViewRegistrationDetailsBloc();

  @override
  void initState() {
    sViewRegistrationDetailsBloc.add(GenerateView());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 25, 84, 27),
        title: const Text('Nowe zgłoszenie'),
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
      create: (_) => sViewRegistrationDetailsBloc,
      child: BlocListener<SViewRegistrationDetailsBloc,
          SViewRegistrationDetailsState>(
        listener: (context, state) {},
        child: BlocBuilder<SViewRegistrationDetailsBloc,
            SViewRegistrationDetailsState>(
          builder: (context, state) {
            if (state is SViewRegistrationDetailsInitial) {
              //return ScreenLoading();
            } else if (state is SViewRegistrationDetailsLoading) {
              // return ScreenLoading();
            } else if (state is SViewRegistrationDetailsLoaded) {
              return buildViet(state.list);
            } else if (state is SViewRegistrationDetailsError) {}
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
