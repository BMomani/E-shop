import 'package:e_shop/presentation/resources/asset_manager.dart';
import 'package:e_shop/presentation/resources/color_manager.dart';
import 'package:e_shop/presentation/resources/font_manager.dart';
import 'package:e_shop/presentation/resources/reusable/animation_route.dart';
import 'package:e_shop/presentation/resources/reusable/carosul.dart';
import 'package:e_shop/presentation/resources/reusable/dot_indicator.dart';
import 'package:e_shop/presentation/resources/reusable/rate_bar.dart';
import 'package:e_shop/presentation/resources/reusable/search_button.dart';
import 'package:e_shop/presentation/resources/text_style_manager.dart';
import 'package:e_shop/presentation/resources/value_manager.dart';
import 'package:e_shop/presentation/view_model/home_view_model.dart';
import 'package:e_shop/presentation/views/home_view/help_views/notification_view.dart';
import 'package:e_shop/presentation/views/home_view/help_views/offers_view.dart';
import 'package:e_shop/presentation/views/home_view/help_views/product_detail.dart';
import 'package:e_shop/presentation/views/home_view/help_views/search_filter_view.dart';
import 'package:e_shop/presentation/views/home_view/help_views/side_menu.dart';
import 'package:e_shop/presentation/views/home_view/help_views/sub_gategory.dart';
import 'package:e_shop/presentation/views/home_view/help_views/trendy_view.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.only(left: AppPaddingManager.p16),
          child: GestureDetector(
            onTap: () {
              context.read<HomeViewModel>().bottomNavigationChangeActiveItem(4);
            },
            child: CircleAvatar(
              backgroundImage: const AssetImage(ImageManager.profileImg),
              radius: AppSizeManager.s16.w,
            ),
          ),
        ),
        actions: [
          GestureDetector(
              onTap: () {
                Navigator.of(context).push(
                  AnimationRoute(
                    pageBuilder: (context, animation1, animation2) =>
                        NotificationView(),
                  ),
                );
              },
              child: SvgPicture.asset(
                ImageManager.notification,
                width: AppSizeManager.s14.w,
                height: AppSizeManager.s16.h,
                color: ColorManager.notificationColor,
              )),
          SizedBox(
            width: AppSizeManager.s10.w,
          ),
          GestureDetector(
            onTap: () {
              Navigator.of(context).push(
                AnimationRoute(
                  pageBuilder: (context, animation1, animation2) =>
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
        child: SingleChildScrollView(
          child: Column(
            children: [
              Text(
                tr("findYourFavoriteProductsOnEShopCommerce"),
                style: TextStyleManager.getSemiBoldTextStyle(
                  color: ColorManager.primaryFontColor,
                  letterSpacing: 0,
                  fontSize: FontSizeManager.s25.sp,
                ),
              ),
              SizedBox(
                height: AppSizeManager.s20.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const SearchButton(),
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(
                        AnimationRoute(
                          pageBuilder: (context, animation1, animation2) =>
                              const FilterView(),
                        ),
                      );
                    },
                    child: Container(
                      height: AppSizeManager.s40.h,
                      width: AppSizeManager.s48.w,
                      decoration: BoxDecoration(
                        color: ColorManager.textButtonColor.withOpacity(.26),
                        borderRadius: BorderRadius.circular(
                          10.r,
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(AppPaddingManager.p10),
                        child: SvgPicture.asset(ImageManager.filter),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: AppSizeManager.s20.h,
              ),
              Consumer<HomeViewModel>(
                builder: (context, home, child) => Carousel(
                    height: AppSizeManager.s240.h,
                    items: [
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(
                            AnimationRoute(
                              pageBuilder: (context, animation1, animation2) =>
                                  const SubCategory(),
                            ),
                          );
                        },
                        child: Container(
                          decoration: const BoxDecoration(
                              image: DecorationImage(
                            image: AssetImage(
                              ImageManager.banner,
                            ),
                          )),
                          child: Padding(
                            padding: EdgeInsets.only(
                              left: AppSizeManager.s10.w,
                              bottom: AppSizeManager.s24.h,
                              top: AppSizeManager.s25.h,
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  color: ColorManager.offerColor,
                                  width:
                                      MediaQuery.of(context).size.width * 0.42,
                                  child: SizedBox(
                                    height: AppSizeManager.s120,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          tr("welcome"),
                                          style: TextStyleManager
                                              .getMediumTextStyle(
                                                  color: ColorManager
                                                      .homeCarouselTextColor,
                                                  fontSize:
                                                      FontSizeManager.s16.sp),
                                        ),
                                        SizedBox(
                                          height: AppSizeManager.s13.h,
                                        ),
                                        Expanded(
                                          child: Text(
                                            tr("offer"),
                                            style: TextStyleManager
                                                .getBoldTextStyle(
                                                    color: ColorManager
                                                        .primaryColor,
                                                    fontSize:
                                                        FontSizeManager.s38.sp),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Container(
                                  height: AppSizeManager.s10.h,
                                  width: AppSizeManager.s30.w,
                                  color: ColorManager.offerColor,
                                  child: DotIndicator(
                                    dotsCount: 3,
                                    index: home.carouselIndex,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(
                            AnimationRoute(
                              pageBuilder: (context, animation1, animation2) =>
                                  const SubCategory(),
                            ),
                          );
                        },
                        child: Container(
                          decoration: const BoxDecoration(
                              image: DecorationImage(
                            image: AssetImage(
                              ImageManager.banner,
                            ),
                          )),
                          child: Padding(
                            padding: EdgeInsets.only(
                              left: AppSizeManager.s10.w,
                              bottom: AppSizeManager.s24.h,
                              top: AppSizeManager.s25.h,
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  color: ColorManager.offerColor,
                                  width:
                                      MediaQuery.of(context).size.width * 0.42,
                                  child: SizedBox(
                                    height: AppSizeManager.s120,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          tr("welcome"),
                                          style: TextStyleManager
                                              .getMediumTextStyle(
                                                  color: ColorManager
                                                      .homeCarouselTextColor,
                                                  fontSize:
                                                      FontSizeManager.s16.sp),
                                        ),
                                        SizedBox(
                                          height: AppSizeManager.s13.h,
                                        ),
                                        Expanded(
                                          child: Text(
                                            tr("offer"),
                                            style: TextStyleManager
                                                .getBoldTextStyle(
                                                    color: ColorManager
                                                        .primaryColor,
                                                    fontSize:
                                                        FontSizeManager.s38.sp),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Container(
                                  height: AppSizeManager.s10.h,
                                  width: AppSizeManager.s30.w,
                                  color: ColorManager.offerColor,
                                  child: DotIndicator(
                                    dotsCount: 3,
                                    index: home.carouselIndex,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(
                            AnimationRoute(
                              pageBuilder: (context, animation1, animation2) =>
                                  const SubCategory(),
                            ),
                          );
                        },
                        child: Container(
                          decoration: const BoxDecoration(
                              image: DecorationImage(
                            image: AssetImage(
                              ImageManager.banner,
                            ),
                          )),
                          child: Padding(
                            padding: EdgeInsets.only(
                              left: AppSizeManager.s10.w,
                              bottom: AppSizeManager.s24.h,
                              top: AppSizeManager.s25.h,
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  color: ColorManager.offerColor,
                                  width:
                                      MediaQuery.of(context).size.width * 0.42,
                                  child: SizedBox(
                                    height: AppSizeManager.s120,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          tr("welcome"),
                                          style: TextStyleManager
                                              .getMediumTextStyle(
                                                  color: ColorManager
                                                      .homeCarouselTextColor,
                                                  fontSize:
                                                      FontSizeManager.s16.sp),
                                        ),
                                        SizedBox(
                                          height: AppSizeManager.s13.h,
                                        ),
                                        Expanded(
                                          child: Text(
                                            tr("offer"),
                                            style: TextStyleManager
                                                .getBoldTextStyle(
                                                    color: ColorManager
                                                        .primaryColor,
                                                    fontSize:
                                                        FontSizeManager.s38.sp),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Container(
                                  height: AppSizeManager.s10.h,
                                  width: AppSizeManager.s30.w,
                                  color: ColorManager.offerColor,
                                  child: DotIndicator(
                                    dotsCount: 3,
                                    index: home.carouselIndex,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                    onChanged: (index) {
                      home.carouselChangeIndex(index);
                    }),
              ),
              SizedBox(
                height: AppSizeManager.s20.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    tr("bestOffers"),
                    style: TextStyleManager.getMediumTextStyle(
                      color: ColorManager.subFontColor,
                      letterSpacing: 0,
                      fontSize: FontSizeManager.s16.sp,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(
                        AnimationRoute(
                          pageBuilder: (context, animation1, animation2) =>
                              const OffersView(),
                        ),
                      );
                    },
                    child: Text(
                      tr("seeAll"),
                      style: TextStyleManager.getRegularTextStyle(
                        color: ColorManager.seeAllColor,
                        letterSpacing: 0,
                        fontSize: 12,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: AppSizeManager.s56.h,
                child: ListView.separated(
                  shrinkWrap: true,
                  itemCount: 10,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          AnimationRoute(
                            pageBuilder: (context, animation1, animation2) =>
                                const SubCategory(),
                          ),
                        );
                      },
                      child: CircleAvatar(
                        backgroundImage: const AssetImage(
                          ImageManager.offer,
                        ),
                        radius: AppSizeManager.s25.w,
                      ),
                    );
                  },
                  separatorBuilder: (BuildContext context, int index) {
                    return SizedBox(
                      width: AppSizeManager.s10.w,
                    );
                  },
                ),
              ),
              SizedBox(
                height: AppSizeManager.s20.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    tr("popularProduct"),
                    style: TextStyleManager.getMediumTextStyle(
                      color: ColorManager.subFontColor,
                      letterSpacing: 0,
                      fontSize: FontSizeManager.s16.sp,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(
                        AnimationRoute(
                          pageBuilder: (context, animation1, animation2) =>
                              const SubCategory(),
                        ),
                      );
                    },
                    child: Text(
                      tr("seeAll"),
                      style: TextStyleManager.getRegularTextStyle(
                        color: ColorManager.seeAllColor,
                        letterSpacing: 0,
                        fontSize: 12,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: AppSizeManager.s20.h,
              ),
              SizedBox(
                height: AppSizeManager.s352.h,
                child: GridView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                  ),
                  itemCount: 4,
                  itemBuilder: (context, index) {
                    return SizedBox(
                      height: AppSizeManager.s160.h,
                      width: AppSizeManager.s180.w,
                      child: GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(
                            AnimationRoute(
                              pageBuilder: (context, animation1, animation2) =>
                                  const ProductDetail(),
                            ),
                          );
                        },
                        child: Card(
                          child: Padding(
                            padding:
                                const EdgeInsets.all(AppPaddingManager.p10),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Stack(
                                  children: const [
                                    Image(
                                      image: AssetImage(
                                        ImageManager.img,
                                      ),
                                    ),
                                    Image(
                                      image: AssetImage(
                                        ImageManager.discount,
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Expanded(
                                      child: Text(
                                        tr("caesarMensHoodie"),
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                        style:
                                            TextStyleManager.getMediumTextStyle(
                                                color: ColorManager
                                                    .popularProductNameColor,
                                                letterSpacing: 0,
                                                fontSize:
                                                    FontSizeManager.s12.sp),
                                      ),
                                    ),
                                    SizedBox(
                                      width: AppSizeManager.s10.w,
                                    ),
                                    SvgPicture.asset(
                                      ImageManager.favorites,
                                      color: ColorManager.textButtonColor,
                                      width: AppSizeManager.s14.w,
                                      height: AppSizeManager.s14.h,
                                    ),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      tr("prise") + '\$',
                                      style:
                                          TextStyleManager.getRegularTextStyle(
                                        color: ColorManager.seeAllColor,
                                        letterSpacing: 0,
                                        fontSize: 12,
                                      ),
                                    ),
                                    const RateBar(
                                      rate: 4,
                                      width: 70,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
              SizedBox(
                height: AppSizeManager.s20.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    tr("trendyProduct"),
                    style: TextStyleManager.getMediumTextStyle(
                      color: ColorManager.subFontColor,
                      letterSpacing: 0,
                      fontSize: FontSizeManager.s16.sp,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(
                        AnimationRoute(
                          pageBuilder: (context, animation1, animation2) =>
                              const TrendyView(),
                        ),
                      );
                    },
                    child: Text(
                      tr("seeAll"),
                      style: TextStyleManager.getRegularTextStyle(
                        color: ColorManager.seeAllColor,
                        letterSpacing: 0,
                        fontSize: 12,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: AppSizeManager.s10.h,
              ),
              SizedBox(
                height: AppSizeManager.s140.h,
                child: ListView.separated(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  separatorBuilder: (BuildContext context, int index) {
                    return Container(
                      width: AppSizeManager.s20.w,
                    );
                  },
                  itemCount: 3,
                  itemBuilder: (BuildContext context, int index) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(
                          AnimationRoute(
                            pageBuilder: (context, animation1, animation2) =>
                                const ProductDetail(),
                          ),
                        );
                      },
                      child: Image(
                        image: const AssetImage(ImageManager.img1),
                        width: AppSizeManager.s312.w,
                      ),
                    );
                  },
                ),
              ),
              SizedBox(
                height: AppSizeManager.s16.h,
              ),
              SizedBox(
                height: AppSizeManager.s412.h,
                child: GridView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisSpacing: AppSizeManager.s20.w,
                      mainAxisSpacing: AppSizeManager.s20.h,
                      mainAxisExtent: AppSizeManager.s180.h,
                      crossAxisCount: 2),
                  shrinkWrap: true,
                  itemCount: 4,
                  itemBuilder: (BuildContext context, int index) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(
                          AnimationRoute(
                            pageBuilder: (context, animation1, animation2) =>
                                const SubCategory(),
                          ),
                        );
                      },
                      child: SizedBox(
                        height: AppSizeManager.s180.h,
                        width: AppSizeManager.s180.w,
                        child: Column(
                          children: [
                            Image(
                              image: const AssetImage(
                                ImageManager.bG,
                              ),
                              height: AppSizeManager.s144.h,
                            ),
                            SizedBox(
                              height: AppSizeManager.s10.h,
                            ),
                            Text(
                              tr("hoodies"),
                              style: TextStyleManager.getMediumTextStyle(
                                color: ColorManager.subFontColor,
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
        padding: const EdgeInsets.only(
          top: AppPaddingManager.p16,
          left: AppPaddingManager.p16,
          right: AppPaddingManager.p16,
        ),
      ),
    );
  }
}
