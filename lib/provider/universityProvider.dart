import 'package:flutter/cupertino.dart';

import '../services/universityservice.dart';
import '../Model/universityModel.dart';

class UnivrestyProvider with ChangeNotifier {
  List<UniversityModel> _Universityinfo=[];

  List<UniversityModel> get Universityinfo => _Universityinfo;

  set Universityinfo(List<UniversityModel> value) {
    _Universityinfo = value;
    notifyListeners();
  }

  callUniversityService() async {
    List<UniversityModel> tempList=[];
    var resp = await UniversityServices().getUniversitiesService();
    UniversityModel universityModel=UniversityModel();
    resp.forEach((element) {
      universityModel=UniversityModel.fromJson(element);
      tempList.add(universityModel);
    });
    Universityinfo=tempList;
  }
}
