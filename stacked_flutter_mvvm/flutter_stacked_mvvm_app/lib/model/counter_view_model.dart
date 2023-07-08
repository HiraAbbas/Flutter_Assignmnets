import 'package:flutter_stacked_mvvm_app/app/app.locator.dart';
import 'package:flutter_stacked_mvvm_app/services/counter_view_services.dart';
import 'package:flutter_stacked_mvvm_app/views/home_view.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class CounterViewModel extends BaseViewModel {
  final counterService = Counterservice();
  final navigationService = locator<NavigationService>();

  addValue() {
    counterService.addCounterValue();
    rebuildUi();
  }

  getCounterValue() {
    return counterService.getValue();
  }

  navigateToHomeView() {
    navigationService.navigateToView(
        HomeView()); 
  }
}
