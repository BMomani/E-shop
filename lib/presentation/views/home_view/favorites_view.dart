import 'package:e_shop/presentation/resources/asset_manager.dart';
import 'package:e_shop/presentation/resources/color_manager.dart';
import 'package:e_shop/presentation/resources/font_manager.dart';
import 'package:e_shop/presentation/resources/reusable/animation_route.dart';
import 'package:e_shop/presentation/resources/reusable/rate_bar.dart';
import 'package:e_shop/presentation/resources/text_style_manager.dart';
import 'package:e_shop/presentation/resources/value_manager.dart';
import 'package:e_shop/presentation/view_model/home_view_model.dart';
import 'package:e_shop/presentation/views/home_view/help_views/side_menu.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

class FavoritesView extends StatelessWidget {
  const FavoritesView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () {
            context.read<HomeViewModel>().bottomNavigationChangeActiveItem(0);
          },
          child: Icon(
            Icons.arrow_back,
            color: ColorManager.notificationColor,
          ),
        ),
        title: Text(
          tr("navigationBarFavorites"),
          style: Theme.of(context).textTheme.headline5,
        ),
        actions: [
          GestureDetector(
            onTap: () {
              Navigator.of(context).push(
                AnimationRoute(
                  pageBuilder: (context, animation, secondaryAnimation) =>
                      const SideMenu(),
                ),
              );
            },
            child: SvgPicture.asset(
              ImageManager.list,
              width: AppSizeManager.s16.w,
              height: AppSizeManager.s16.h,
              color: ColorManager.notificationColor,
            ),
          ),
          const SizedBox(
            width: AppPaddingManager.p16,
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: AppPaddingManager.p16,
          vertical: AppPaddingManager.p10,
        ),
        child: ListView.separated(
          itemCount: 10,
          itemBuilder: (BuildContext context, int index) {
            return SizedBox(
              height: AppSizeManager.s140.h,
              child: Card(
                color: ColorManager.white,
                elevation: 4,
                child: Padding(
                  padding: const EdgeInsets.all(AppPaddingManager.p16),
                  child: Row(
                    children: [
                      Image(
                        width: AppSizeManager.s140.w,
                        height: AppSizeManager.s108.h,
                        image: const AssetImage(ImageManager.favImg),
                      ),
                      SizedBox(
                        width: AppSizeManager.s10.w,
                      ),
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                              height: AppSizeManager.s1.h,
                            ),
                            Text(
                              tr("casualPants"),
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                              style: TextStyleManager.getMediumTextStyle(
                                color: ColorManager.primaryFontColor,
                                fontSize: FontSizeManager.s12,
                              ),
                            ),
                            Row(
                              children: [
                                Text(
                                  tr("prise") + ' - ' + tr("prise2"),
                                  style: TextStyleManager.getMediumTextStyle(
                                    color: ColorManager.primaryFontColor
                                        .withOpacity(.5),
                                    fontSize: FontSizeManager.s12.sp,
                                  ),
                                ),
                                const Spacer(),
                                Text(
                                  '-' + tr("discount") + '%',
                                  style: TextStyleManager.getMediumTextStyle(
                                    color: ColorManager.primaryColor,
                                    fontSize: FontSizeManager.s12.sp,
                                  ),
                                ),
                                SizedBox(
                                  width: AppSizeManager.s10.w,
                                ),
                                Text(
                                  tr("actualPrice"),
                                  style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    color: ColorManager
                                        .bottomNavigationTextColor
                                        .withOpacity(.5),
                                    fontSize: FontSizeManager.s12.sp,
                                    decoration: TextDecoration.lineThrough,
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                SizedBox(
                                  width: AppSizeManager.s56.w,
                                  height: AppSizeManager.s20.h,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Expanded(
                                        child: Container(
                                          child: Icon(
                                            Icons.add,
                                            color: ColorManager.counterColor,
                                            size: AppSizeManager.s16.w,
                                          ),
                                          decoration: BoxDecoration(
                                            color: ColorManager.white,
                                            borderRadius:
                                                BorderRadius.circular(5.r),
                                            boxShadow: [
                                              BoxShadow(
                                                spreadRadius: 1.5,
                                                blurRadius: 1,
                                                offset: const Offset(0, 1),
                                                color: ColorManager
                                                    .accentFontColor
                                                    .withOpacity(.2),
                                              ),
                                            ],
                                          ),
                                          width: AppSizeManager.s20.w,
                                          height: AppSizeManager.s20.h,
                                        ),
                                      ),
                                      Expanded(
                                          child: Center(
                                              child: Text(
                                        tr("counter"),
                                      ))),
                                      Expanded(
                                        child: Container(
                                          alignment: Alignment.center,
                                          child: Icon(
                                            Icons.remove,
                                            color: ColorManager.counterColor,
                                            size: AppSizeManager.s16.w,
                                          ),
                                          decoration: BoxDecoration(
                                            color: ColorManager.white,
                                            borderRadius:
                                                BorderRadius.circular(5.r),
                                            boxShadow: [
                                              BoxShadow(
                                                spreadRadius: 1.5,
                                                blurRadius: 1,
                                                offset: const Offset(0, 1),
                                                color: ColorManager
                                                    .accentFontColor
                                                    .withOpacity(.2),
                                              ),
                                            ],
                                          ),
                                          width: AppSizeManager.s20.w,
                                          height: AppSizeManager.s20.h,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Row(
                                  children: [
                                    Text(
                                      tr("rate"),
                                      style:
                                          TextStyleManager.getMediumTextStyle(
                                        color: ColorManager.primaryFontColor
                                            .withOpacity(.5),
                                        fontSize: FontSizeManager.s10.sp,
                                      ),
                                    ),
                                    SizedBox(
                                      width: AppSizeManager.s5.w,
                                    ),
                                    const RateBar(rate: 4, width: 60),
                                  ],
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Text(
                                  tr("addToCart"),
                                  style: TextStyleManager.getMediumTextStyle(
                                    color: ColorManager.primaryFontColor
                                        .withOpacity(.5),
                                    fontSize: FontSizeManager.s10.sp,
                                  ),
                                ),
                                SizedBox(
                                  width: AppSizeManager.s10.w,
                                ),
                                Icon(
                                  Icons.shopping_cart_outlined,
                                  color: ColorManager.primaryColor,
                                  size: 10,
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
          separatorBuilder: (BuildContext context, int index) {
            return SizedBox(
              height: AppSizeManager.s14.h,
            );
          },
        ),
      ),
    );
  }
}
