import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:request_app/bloc/s_view_dashboard/bloc/s_view_dashboard_bloc.dart';
import 'package:request_app/custom/c_button.dart';
import 'package:request_app/custom/c_chart_moje_zgloszenia.dart';
import 'package:request_app/custom/c_chart_nowe_zgloszenia.dart';
import 'package:request_app/custom/c_chart_wolne_zgloszenia.dart';
import 'package:request_app/custom/c_chart_wykonywane_zgloszenia.dart';
import 'package:request_app/custom/c_non_state_text_form.dart';
import 'package:request_app/custom/c_text_form.dart';
import 'package:request_app/main.dart';
import 'package:request_app/models/m_chart_one.dart';
import 'package:request_app/models/m_my_user.dart';
import 'package:request_app/models/m_prawa.dart';
import 'package:request_app/screens/s_list_my_registration.dart';
import 'package:request_app/screens/s_list_registration_to_result.dart';
import 'package:request_app/screens/s_view_add_new_registration.dart';
import 'package:request_app/screens/s_view_logi.dart';
import 'package:request_app/screens/s_view_user.dart';
import 'package:sizer/sizer.dart';
import 'package:charts_flutter/flutter.dart' as charts;

class SViewDashboard extends StatefulWidget {
  const SViewDashboard({Key? key}) : super(key: key);

  @override
  State<SViewDashboard> createState() => _SViewDashboard();
}

class _SViewDashboard extends State<SViewDashboard> {
  final SViewDashboardBloc sViewDashboardBloc = SViewDashboardBloc();
  String haslo = '';
  var storage = const FlutterSecureStorage();

  @override
  void initState() {
    sViewDashboardBloc.add(GenerateView());
    super.initState();
  }

  final List<ChartOne> data = [
    ChartOne(
      day: '1',
      iloscNowychZgloszen: 40000,
      barColor: charts.ColorUtil.fromDartColor(Colors.green),
    ),
    ChartOne(
      day: '2',
      iloscNowychZgloszen: 5000,
      barColor: charts.ColorUtil.fromDartColor(Colors.green),
    ),
    ChartOne(
      day: '3',
      iloscNowychZgloszen: 40000,
      barColor: charts.ColorUtil.fromDartColor(Colors.green),
    ),
    ChartOne(
      day: '4',
      iloscNowychZgloszen: 35000,
      barColor: charts.ColorUtil.fromDartColor(Colors.green),
    ),
    ChartOne(
      day: '5',
      iloscNowychZgloszen: 45000,
      barColor: charts.ColorUtil.fromDartColor(Colors.green),
    ),
  ];

  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => sViewDashboardBloc,
      child: BlocListener<SViewDashboardBloc, SViewDashboardState>(
        listener: (context, state) {},
        child: BlocBuilder<SViewDashboardBloc, SViewDashboardState>(
          builder: (context, state) {
            if (state is SViewDashboardInitial) {
              //return ScreenLoading();
            } else if (state is SViewDashboardLoading) {
              // return ScreenLoading();
            } else if (state is SViewDashboardLoadedZmianaHasla) {
              sViewDashboardBloc.add(GenerateView());
            } else if (state is SViewDashboardLoaded) {
              return Scaffold(
                drawer: Drawer(
                    child: Container(
                        color: const Color.fromARGB(255, 55, 102, 13),
                        child: ListView.builder(
                            scrollDirection: Axis.vertical,
                            shrinkWrap: true,
                            itemCount:
                                state.list == null ? 0 : state.list.length,
                            itemBuilder: (context, index) {
                              MPrawa mPrawa = state.list[index];
                              return Column(children: [
                                ListTile(
                                  onTap: () {
                                    if (mPrawa.idSPrivilages ==
                                        32) //Rejestracja zgłoszenia
                                    {
                                      Navigator.pop(context);
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const SViewNewRegistration()),
                                      );
                                    } else if (mPrawa.idSPrivilages ==
                                        33) //Logi apliakcji
                                    {
                                      Navigator.pop(context);

                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  const SViewLogi()));
                                    } else if (mPrawa.idSPrivilages ==
                                        34) //Moje zgłoszenia
                                    {
                                      Navigator.pop(context);

                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  const SViewMyRegistration()));
                                    } else if (mPrawa.idSPrivilages ==
                                        35) //Zgłoszenia do realizacji
                                    {
                                      Navigator.pop(context);

                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  const SViewRegistrationToResult()));
                                    } else if (mPrawa.idSPrivilages ==
                                        36) //Uzytkownicy
                                    {
                                      Navigator.pop(context);

                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  const SViewUser()));
                                    }
                                  },
                                  contentPadding: EdgeInsets.zero,
                                  title: Container(
                                    height: 5.h,
                                    color: Colors.white,
                                    child: Container(
                                      margin: const EdgeInsets.only(
                                          left: 60.0, right: 20.0, top: 10),
                                      child: Text(mPrawa.namePrivilages,
                                          style: const TextStyle(
                                            color: Colors.black,
                                          )),
                                    ),
                                  ),
                                  tileColor: Colors.white,
                                )
                              ]);
                            }))),
                appBar: AppBar(
                  backgroundColor: const Color.fromARGB(255, 25, 84, 27),
                  title: const Text('Ekran główny'),
                ),
                body: Container(
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage("assets/images/background.jpg"),
                        fit: BoxFit.cover,
                      ),
                    ),
                    child: buildViet(state.listMyUser)),
              );
            } else if (state is SViewDashboardError) {}
            return Container();
          },
        ),
      ),
    );
  }

  Widget buildViet(List list) {
    MMyUser mMyUser = list[0];
    String imie = mMyUser.nameUser;
    String nazwisko = mMyUser.surname;
    String email = mMyUser.email;
    String telefon = mMyUser.phone;

    return SizedBox(
        child: Row(children: [
      Container(
        margin: const EdgeInsets.all(25),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: const Color.fromARGB(153, 194, 193, 193),
          border: const Border(),
        ),
        height: 80.h,
        width: 30.w,
        child: Column(
          children: [
            SizedBox(
              height: 5.h,
            ),
            WCustomNonStateContainer(
                description: 'Imię: ',
                fontsize: 3.sp,
                height: 5.h,
                value: imie,
                valueColor: 0xFFFFFFFF,
                width: 28.w),
            SizedBox(
              height: 1.h,
            ),
            WCustomNonStateContainer(
                description: 'Nazwisko: ',
                fontsize: 3.sp,
                height: 5.h,
                value: nazwisko,
                valueColor: 0xFFFFFFFF,
                width: 28.w),
            SizedBox(
              height: 1.h,
            ),
            WCustomNonStateContainer(
                description: 'Email: ',
                fontsize: 3.sp,
                height: 5.h,
                value: email,
                valueColor: 0xFFFFFFFF,
                width: 28.w),
            SizedBox(
              height: 1.h,
            ),
            WCustomNonStateContainer(
                description: 'Telefon: ',
                fontsize: 3.sp,
                height: 5.h,
                value: telefon,
                valueColor: 0xFFFFFFFF,
                width: 28.w),
            SizedBox(
              height: 40.h,
            ),
            WCustomButton(
              color: 0xFF2196F3,
              fontWeight: 3.sp,
              height: 5.h,
              press: () {
                showDialog(
                    context: context,
                    builder: (ctx) => AlertDialog(
                          title: const Text("Zmiana hasła"),
                          content: WCustomContainerTextFormField(
                            name: '',
                            obscure: false,
                            type: TextInputType.text,
                            valueName: (String value) {
                              setState(() {
                                haslo = value;
                              });
                            },
                          ),
                          actions: <Widget>[
                            ElevatedButton(
                              onPressed: () {
                                Navigator.pop(context);
                                sViewDashboardBloc.add(ZaminaHasla(haslo));
                              },
                              child: const Text("Zatwierdź"),
                            ),
                          ],
                        ));
              },
              text: 'Zmień hasło logowania',
              width: 28.w,
            ),
            SizedBox(
              height: 1.h,
            ),
            WCustomButton(
              color: 0xFFF44336,
              fontWeight: 3.sp,
              height: 5.h,
              press: () {
                storage.write(key: "Authorization", value: null);
                Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(builder: (context) => MyApp()),
                    (Route<dynamic> route) => false);
              },
              text: 'Wyloguj się',
              width: 28.w,
            )
          ],
        ),
      ),
      Column(
        children: [
          Container(
            margin: const EdgeInsets.all(15),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: const Color.fromARGB(153, 194, 193, 193),
              border: const Border(),
            ),
            height: 40.h,
            width: 30.w,
            child: ChartMojeZgloszenia(
              data: data,
            ),
          ),
          Container(
            margin: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: const Color.fromARGB(153, 194, 193, 193),
              border: const Border(),
            ),
            height: 40.h,
            width: 30.w,
            child: ChartNoweZgloszenia(
              data: data,
            ),
          )
        ],
      ),
      Column(
        children: [
          Container(
            margin: const EdgeInsets.all(15),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: const Color.fromARGB(153, 194, 193, 193),
              border: const Border(),
            ),
            height: 40.h,
            width: 30.w,
            child: ChartWolneZgloszenia(
              data: data,
            ),
          ),
          Container(
            margin: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: const Color.fromARGB(153, 194, 193, 193),
              border: const Border(),
            ),
            height: 40.h,
            width: 30.w,
            child: ChartWykonywaneZgloszenia(
              data: data,
            ),
          )
        ],
      )
    ]));
  }
}
