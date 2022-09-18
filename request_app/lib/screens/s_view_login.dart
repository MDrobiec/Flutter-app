import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:request_app/bloc/s_view_login/bloc/s_view_login_bloc.dart';
import 'package:request_app/custom/c_button.dart';
import 'package:request_app/custom/c_text_form.dart';
import 'package:sizer/sizer.dart';

class SViewLogin extends StatefulWidget {
  const SViewLogin({Key? key}) : super(key: key);

  @override
  State<SViewLogin> createState() => _SViewLogin();
}

class _SViewLogin extends State<SViewLogin> {
  final SViewLoginBloc sViewLoginBloc = SViewLoginBloc();
  String nameLogin = 'Login';
  String namePassword = 'Hasło';
  String valueLogin = '';
  String valuePassword = '';
  @override
  void initState() {
    sViewLoginBloc.add(GenerateView());

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/background.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: buildBlocBuilder(),
      ),
    );
  }

  Widget buildBlocBuilder() {
    return BlocProvider(
      create: (_) => sViewLoginBloc,
      child: BlocListener<SViewLoginBloc, SViewLoginState>(
        listener: (context, state) {},
        child: BlocBuilder<SViewLoginBloc, SViewLoginState>(
          builder: (context, state) {
            if (state is SViewLoginInitial) {
              //return ScreenLoading();
            } else if (state is SViewLoginLoading) {
              // return ScreenLoading();
            } else if (state is SViewLoginLoaded) {
              return buildViet();
            } else if (state is SViewLoginError) {}
            return Container();
          },
        ),
      ),
    );
  }

  Widget buildViet() => Center(
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.white,
            border: const Border(),
          ),
          height: 400,
          width: 400,
          child: Column(children: [
            SizedBox(
              height: 3.h,
            ),
            SizedBox(
              height: 15.h,
              width: 64.w,
              child: Image(
                image: const AssetImage('assets/images/icon_login.png'),
                width: 64.w,
                fit: BoxFit.contain,
                height: 15.h,
              ),
            ),
            SizedBox(
              height: 2.h,
            ),
            SizedBox(
              child: Text(
                '- Logowanie -',
                style: TextStyle(fontSize: 6.sp),
              ),
            ),
            SizedBox(
              height: 3.h,
            ),
            WCustomContainerTextFormField(
              obscure: false,
              type: TextInputType.text,
              name: nameLogin,
              valueName: (value) {
                valueLogin = value;
              },
            ),
            SizedBox(
              height: 1.h,
            ),
            WCustomContainerTextFormField(
              obscure: true,
              type: TextInputType.text,
              name: namePassword,
              valueName: (value) {
                valuePassword = value;
              },
            ),
            const SizedBox(
              height: 10,
            ),
            WCustomButton(
              color: 0xFF4CAF50,
              fontWeight: 5.sp,
              height: 5.h,
              press: () {
                sViewLoginBloc
                    .add(LoginPassword(valueLogin, valuePassword, context));
              },
              text: 'Zaloguj się',
              width: 25.w,
            )
          ]),
        ),
      );
}
