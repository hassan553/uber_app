import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:uber_app/core/services/network_service/api_service.dart';

final getIt = GetIt.instance;

void setup() {
  getIt.registerLazySingleton<DioImpl>(() => DioImpl());
 // getIt.registerLazySingleton<AuthRepo>(() => AuthRepo());
  getIt.registerLazySingleton<NavigationService>(() => NavigationService());
}

class NavigationService {
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
  Future<dynamic> navigateTo(String routeName) {
    return navigatorKey.currentState!.pushNamed(routeName);
  }
}
