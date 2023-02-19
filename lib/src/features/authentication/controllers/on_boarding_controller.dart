import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:liquid_swipe/PageHelpers/LiquidController.dart';
import '../../../constants/colors.dart';
import '../../../constants/image_string.dart';
import '../../../constants/text_string.dart';
import '../models/model_on_boarding.dart';
import '../screens/on_boarding/on_boarding_page_widget.dart';

class OnBoardingController extends GetxController{

  final controller = LiquidController();
  RxInt currentPage = 0.obs;

  final pages = [
    OnBoardingPageWidget(
        model: OnBoardingModel(
          image: kcrozOnBoardingImage1,
          title: kcrozOnBoardingTitle1,
          subTitle: kcrozOnBoardingSubTitle1,
          counterText: kcrozOnBoardingCounter1,
          bgColor: kcrozOnBoardingPage1Color,
      )
    ),
    OnBoardingPageWidget(
        model: OnBoardingModel(
          image: kcrozOnBoardingImage2,
          title: kcrozOnBoardingTitle2,
          subTitle: kcrozOnBoardingSubTitle2,
          counterText: kcrozOnBoardingCounter2,
          bgColor: kcrozOnBoardingPage2Color,
      )
    ),
    OnBoardingPageWidget(
        model: OnBoardingModel(
          image: kcrozOnBoardingImage3,
          title: kcrozOnBoardingTitle3,
          subTitle: kcrozOnBoardingSubTitle3,
          counterText: kcrozOnBoardingCounter3,
          bgColor: kcrozOnBoardingPage3Color,
      ),
    ),
  ];



  skip() => controller.jumpToPage(page: 2);
  animateToNextSlide() {
    int nextPage = controller.currentPage + 1;
    controller.animateToPage(page: nextPage);
  }
  onPageChangedCallback(int activePageIndex) =>  currentPage.value = activePageIndex;
}
