import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:request_app/bloc/s_view_user/bloc/s_view_user_bloc.dart';

class SViewUser extends StatefulWidget {
  const SViewUser({Key? key}) : super(key: key);

  @override
  State<SViewUser> createState() => _SViewUser();
}

class _SViewUser extends State<SViewUser> {
  final SViewUserBloc sViewMyRegistrationBloc = SViewUserBloc();

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
        title: const Text('Uzytkownicy'),
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
      child: BlocListener<SViewUserBloc, SViewUserState>(
        listener: (context, state) {},
        child: BlocBuilder<SViewUserBloc, SViewUserState>(
          builder: (context, state) {
            if (state is SViewUserInitial) {
              //return ScreenLoading();
            } else if (state is SViewUserLoading) {
              // return ScreenLoading();
            } else if (state is SViewUserLoaded) {
              return buildViet(state.list);
            } else if (state is SViewUserError) {}
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
