import 'package:e_shop/presentation/resources/asset_manager.dart';
import 'package:e_shop/presentation/views/on_boarding_view/on_boarding_page_content.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class OnBoardingViewModel with ChangeNotifier {
  static late BuildContext buildContext;

  final List<OnBoardingPageContent> onBoardingPages = [
    OnBoardingPageContent(
      image: ImageManager.onBoardingImage1,
      title: tr("onBoardingTitle1"),
      subtitle: tr("onBoardingSubTitle1"),
    ),
    OnBoardingPageContent(
      image: ImageManager.onBoardingImage2,
      title: tr("onBoardingTitle2"),
      subtitle: tr("onBoardingSubTitle2"),
    ),
    OnBoardingPageContent(
      image: ImageManager.onBoardingImage3,
      title: tr("onBoardingTitle3"),
      subtitle: tr("onBoardingSubTitle3"),
    ),
  ];
  final PageController controller = PageController();
  int activePage = 0;

  void nextPage() {
    controller.nextPage(
        duration: const Duration(milliseconds: 1500), curve: Curves.ease);
    notifyListeners();
  }

  void activePageChange(int index) {
    activePage = index;
    notifyListeners();
  }
}
