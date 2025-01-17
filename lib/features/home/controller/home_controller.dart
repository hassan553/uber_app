import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:uber_app/features/home/data/home_repo.dart';

class HomeController extends GetxController {
  HomeRepo homeRepo = HomeRepo();
  bool isLoading = false;
  List<Map<String, dynamic>> list = [];
  TextEditingController textController = TextEditingController();
  getData() async {
    var response = await homeRepo.getData(prompt: textController.text);
    response.fold(
      (l) {},
      (r) {
        list.add({textController.text: r});
      },
    );
    textController.clear();
    update();
  }

  isOnline() async {
    return await InternetConnectionChecker.instance.hasConnection;
  }
}
