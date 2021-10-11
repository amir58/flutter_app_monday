import 'package:flutter_app_monday/vodafone/base_screen.dart';
void main(){

  ScreenOne objectOne = ScreenOne();

}


class ScreenOne extends BaseScreen{

  void build(){

    super.checkWifi();

    super.checkNetworkData();

    super.startLoadingAnimation();

    super.loadData();

    super.stopLoadingAnimation();

  }


}