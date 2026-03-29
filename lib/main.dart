import 'package:e_commerce_app2/core/cached/shared_preference_utils.dart';
import 'package:e_commerce_app2/features/ui/login/login_screen.dart';
import 'package:e_commerce_app2/features/ui/screens/cart_screen/cart_screen.dart';
import 'package:e_commerce_app2/features/ui/screens/home_screen/categories_tap/cubit/Category_tab_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'core/di/di.dart';
import 'core/utils/my_bloc_observer.dart';
import 'features/ui/register/register_screen.dart';
import 'features/ui/screens/home_screen/home_screen.dart';
import 'features/ui/screens/product_details_screen/Product_Details_Screen.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  configureDependencies();
  Bloc.observer = MyBlocObserver();
  await SharedPreferenceUtils.inIt();
  String routeName ;
  var token = SharedPreferenceUtils.getData(key: "token");
  if(token != null){
    routeName = HomeScreen.routeName;
  } else{
    routeName = LoginScreen.routeName;
  }
  runApp( MultiBlocProvider(
      providers: [
        BlocProvider(create: (context)=> getIt<CategoryTapViewModel>())
      ],
      child: MyApp(routeName:routeName ,)));
}

class MyApp extends StatelessWidget {
  String routeName ;
  MyApp({required this.routeName});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: routeName,
      routes : {
        LoginScreen.routeName : (context)=> LoginScreen(),
        RegisterScreen.routeName : (context)=>RegisterScreen(),
        HomeScreen.routeName : (context)=>HomeScreen(),
        ProductDetailsScreen.routeName : (context)=>ProductDetailsScreen(),
        CartScreen.routeName : (context)=>CartScreen(),
      }
    );
  }
}


