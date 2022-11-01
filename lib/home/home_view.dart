import 'package:flutter/material.dart';
import 'package:login_test/home/home_data.dart';
import 'package:login_test/home/home_view_model.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<StatefulWidget> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  HomeViewModel? _homeViewModel;
  @override
  void initState() {
    super.initState();
    HomeDataImpl homeDataImpl = HomeDataImpl();
    _homeViewModel = HomeViewModel(homeDataImpl);
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      _homeViewModel?.getDate();
      _homeViewModel?.getData();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Welcome"),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 30,
              ),
              StreamBuilder(
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return Text("${snapshot.data}");
                  }
                  return Container();
                },
                stream: _homeViewModel?.timeSubject.stream,
              ),
              const SizedBox(
                height: 20,
              ),
              StreamBuilder(
                stream: _homeViewModel?.dataSubject,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return ListView.builder(
                      shrinkWrap: true,
                      itemCount: snapshot.data?.length ?? 0,
                      itemBuilder: (context, index) {
                        return Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: const [
                                Text("Name"),
                                Text("Dose"),
                                Text("Strength")
                              ],
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Text(snapshot.data?[index].name ?? ''),
                                Text(snapshot.data?[index].dose ?? ''),
                                Text(snapshot.data?[index].strength ?? ''),
                              ],
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                          ],
                        );
                      },
                    );
                  }
                  return Container();
                },
              )
            ],
          ),
        ));
  }
}
