import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../categories_tap/category_tap.dart';
import '../favorite_tap/favorite_tap.dart';
import '../home_tap/home_tap.dart';
import '../profile_tap/profile_tap.dart';
import 'home_states.dart';

class HomeScreenViewModel extends Cubit<HomeStates>{
  HomeScreenViewModel() : super (HomeInitialSate());
  //todo: hold data _ handle logic
  int selectedIndex = 0;

  List<Widget> taps = [
    HomeTap(),
    CategoryTap(),
    FavoriteTap(),
    ProfileTap()
  ];

}