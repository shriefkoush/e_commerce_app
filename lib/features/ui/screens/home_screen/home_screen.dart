import 'package:e_commerce_app2/core/utils/app_assets.dart';
import 'package:e_commerce_app2/core/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'cubit/home_screen_view_model.dart';
import 'cubit/home_states.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = "homeScreen";

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  HomeScreenViewModel viewModel = HomeScreenViewModel();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeScreenViewModel, HomeStates>(
      bloc: viewModel,
      builder: (context, state) {
        return Scaffold(
          bottomNavigationBar: Theme(
              data: Theme.of(context).copyWith(
                  canvasColor: AppColors.primaryColor),
              child: BottomNavigationBar(
                  currentIndex: viewModel.selectedIndex,
                  onTap: (index) {
                    viewModel.selectedIndex = index;
                    setState(() {});
                  },
                  items: [
                    buildBottomNavBarItem(
                      imageName: AppAssets.homeIcon,
                      selectedImageName: AppAssets.homeSelectedIcon,
                      text: "home",
                      index: 0),
                    buildBottomNavBarItem(
                        imageName: AppAssets.categoryIcon,
                        selectedImageName: AppAssets.categorySelectedIcon,
                        text: "category",
                        index: 1)
                    , buildBottomNavBarItem(
                        imageName: AppAssets.favoriteIcon,
                        selectedImageName: AppAssets.favoriteSelectedIcon,
                        text: "favorite",
                        index: 2)
                    , buildBottomNavBarItem(
                        imageName: AppAssets.profileIcon,
                        selectedImageName: AppAssets.profileSelectedIcon,
                        text: "profile",
                        index: 3)
                  ])),
          body: viewModel.taps[viewModel.selectedIndex],
        );
      },
    );
  }

  BottomNavigationBarItem buildBottomNavBarItem({required String imageName,
    required String selectedImageName,
    required String text, required int index
  }) {
    return BottomNavigationBarItem(
        icon: ImageIcon(AssetImage(
            viewModel.selectedIndex == index ? selectedImageName : imageName
        )), label: text);
  }
}
