import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Model/universityModel.dart';
import '../provider/universityProvider.dart';

class HomePageView extends StatefulWidget {
  const HomePageView({Key? key}) : super(key: key);

  @override
  State<HomePageView> createState() => _HomePageViewState();
}

class _HomePageViewState extends State<HomePageView> {
  @override
  void initState() {
    // TODO: implement initState
    getUniversities();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    List<UniversityModel> unilist = [];
    unilist = context.watch<UnivrestyProvider>().Universityinfo;
    return SafeArea(
      child: Scaffold(
        body: ListView.builder(
            itemCount: unilist.length,
            itemBuilder: (BuildContext context, int index) {
              return ListTile(
                  trailing: Text(
                    "${unilist[index].stateProvince ?? "not avaiable"}",
                    style: TextStyle(color: Colors.green, fontSize: 15),
                  ),
                  title: Text("${unilist[index].name}"));
            }),
      ),
    );
  }

  void getUniversities() {
    context.read<UnivrestyProvider>().callUniversityService();
  }
}
