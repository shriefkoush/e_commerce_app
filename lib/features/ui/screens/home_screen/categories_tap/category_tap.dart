import 'package:e_commerce_app2/core/di/di.dart';
import 'package:e_commerce_app2/core/errors/failures.dart';
import 'package:e_commerce_app2/core/utils/app_colors.dart';
import 'package:e_commerce_app2/core/utils/app_styles.dart';
import 'package:e_commerce_app2/core/utils/flutter_Toast.dart';
import 'package:e_commerce_app2/features/ui/widgets/Product_Item_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/utils/app_assets.dart';
import '../../../widgets/customTextFeild.dart';
import '../../cart_screen/cart_screen.dart';
import '../../product_details_screen/Product_Details_Screen.dart';
import 'cubit/Category_states.dart';
import 'cubit/Category_tab_view_model.dart';
class CategoryTap extends StatelessWidget {
  int num = 0 ;
  CategoryTapViewModel viewModel = getIt<CategoryTapViewModel>();

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Padding(padding: EdgeInsets.symmetric(
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
            child: BlocBuilder<CategoryTapViewModel, ProductState>(
  builder: (context, state) {
    return Stack(
                children:[ ImageIcon(
                  AssetImage(AppAssets.cartIcon),
                  color: AppColors.primaryColor,
                  size: 35,
                ),
                  Positioned(
                    left: 15,
                      right: 0,
                      child: CircleAvatar(
                    backgroundColor: AppColors.greenColor,
                    radius: 12,
                    child:
                  Text(CategoryTapViewModel.get(context).numOfProducts.toString(),style: AppStyles.bold16White),))
                ]
            );
  },
),
          ),
        ],
        backgroundColor: AppColors.whiteColor,
        leading: Image.asset(AppAssets.routeHomeIcon),
      ),
      backgroundColor: AppColors.whiteColor,
      body: Column(children: [
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
        BlocBuilder<CategoryTapViewModel, ProductState>(
          bloc : viewModel..getAllProducts(),
  builder: (context, state) {
            if(state is ProductLoadingState){
              return Center(child: CircularProgressIndicator(
                color: AppColors.primaryColor,
              ),);
            }
            else if(state is ProductErrorState){
              return Center(child: Text(state.failures.errorMsg),);
            }
            else if(state is ProductSuccessState){
              return Expanded(
                child: GridView.builder(gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: height*0.02,
                    crossAxisSpacing: width*0.03,
                    childAspectRatio: 2 / 3.2
                ),
                  itemBuilder: (context,index){
                    return GestureDetector(
                        onTap: (){
                          //todo : navigate
                          Navigator.pushNamed(context, ProductDetailsScreen.routeName,
                          arguments: state.productResponseEntity.data![index]
                          );
                        },
                        child: ProductItemWidget(
                          product: state.productResponseEntity.data![index],));
                  },itemCount: state.productResponseEntity.data!.length,
                ),
              );
            }
            return Container();
  },
)
      ],),

    ),
    );


  }
}
