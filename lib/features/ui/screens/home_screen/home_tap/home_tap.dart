import 'package:e_commerce_app2/core/di/di.dart';
import 'package:e_commerce_app2/core/utils/app_assets.dart';
import 'package:e_commerce_app2/core/utils/app_colors.dart';
import 'package:e_commerce_app2/core/utils/app_styles.dart';
import 'package:e_commerce_app2/features/ui/screens/cart_screen/cart_screen.dart';
import 'package:e_commerce_app2/features/ui/widgets/Category_item_widget.dart';
import 'package:e_commerce_app2/features/ui/widgets/customTextFeild.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'cubit/home_tab_view_model.dart';
import 'cubit/home_tap_states.dart';

class HomeTap extends StatefulWidget {
  @override
  State<HomeTap> createState() => _HomeTapState();

}

class _HomeTapState extends State<HomeTap> {
  HomeTapViewModel viewModel = getIt<HomeTapViewModel>();
 @override
  void initState() {
    // TODO: implement initState
    super.initState();
    viewModel.getAllCategories();
    viewModel.getAllBrands();
  }
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: width * 0.02,
        vertical: height * 0.01,
      ),
      child: Scaffold(
        appBar: AppBar(
          leadingWidth: width * 0.22,
          actions: [
            GestureDetector(
              onTap: (){
                Navigator.pushNamed(context, CartScreen.routeName);
              },
              child: ImageIcon(
                AssetImage(AppAssets.cartIcon),
                color: AppColors.primaryColor,
                size: 35,
              ),
            ),
          ],
          backgroundColor: AppColors.whiteColor,
          leading: Image.asset(AppAssets.routeHomeIcon),
        ),
        backgroundColor: AppColors.whiteColor,
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              CustomTextField(
                borderColor: AppColors.primaryColor,
                prefixIcon: Icon(
                  Icons.search,
                  size: 35,
                  color: AppColors.primaryColor,
                ),
                hintText: "What do you search for ?",
              ),
              SizedBox(height: height * 0.02),
              ImageSlideshow(
                  indicatorColor: AppColors.primaryColor,
                  indicatorPadding: width*0.015,
                  initialPage: 0,
                  indicatorBottomPadding: height*0.01,
                  indicatorRadius: 5,
                  indicatorBackgroundColor: AppColors.whiteColor ,
                  isLoop: true,
                  autoPlayInterval:3000 ,
                  children: viewModel.images.map((url){
                    return  ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                      child:
                      Image.asset(
                          url ,fit: BoxFit.cover,
                      )
                    );}
                  ).toList()
              ),
              SizedBox(height: height * 0.01),
              Text("Categories", style: AppStyles.bold20primary),
              SizedBox(
                height: height * 0.3,
                child: BlocBuilder<HomeTapViewModel, HomeTapStates>(
                  bloc: viewModel,
                  buildWhen: (previous, current) =>
                  current is CategoryLoadingState ||
                      current is CategorySuccessState ||
                      current is CategoryErrorState,
                  builder: (context, state) {
                    if (state is CategorySuccessState) {
                      return GridView.builder(
                        scrollDirection: Axis.horizontal,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisSpacing: height * 0.01,
                          mainAxisSpacing: width * 0.03,
                          crossAxisCount: 2,
                        ),
                        itemBuilder: (context, index) {
                          return CategoryItemWidget(
                            item: state.categoryResponseEntity.data![index],
                          );
                        },
                        itemCount: state.categoryResponseEntity.data!.length,
                      );
                    }
                    else if (state is CategoryErrorState) {
                      return Center(child: Text(state.failures.errorMsg));
                    } else  {
                    return Center(
                    child: CircularProgressIndicator(
                    color: AppColors.primaryColor,
                    ),
                    );
                    }
                  },
                ),
              ),
              SizedBox(height: height * 0.01),
              Text("Brands", style: AppStyles.bold20primary),
              SizedBox(
                height: height * 0.3,
                child: BlocBuilder<HomeTapViewModel, HomeTapStates>(
                  bloc: viewModel,
                  builder: (context, state) {
                    if (state is BrandLoadingState) {
                      return Center(
                        child: CircularProgressIndicator(
                          color: AppColors.primaryColor,
                        ),
                      );
                    } else if (state is BrandErrorState) {
                      return Center(child: Text(state.failures.errorMsg));
                    } else if (state is BrandSuccessState) {
                      return GridView.builder(
                        scrollDirection: Axis.horizontal,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisSpacing: height * 0.01,
                          mainAxisSpacing: width * 0.03,
                          crossAxisCount: 2,
                        ),
                        itemBuilder: (context, index) {
                          return CategoryItemWidget(
                            brand: state.brandResponseEntity.data![index],

                          );
                        },
                        itemCount: state.brandResponseEntity.data?.length,
                      );
                    }
                    return Container();
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
