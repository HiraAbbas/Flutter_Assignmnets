import 'package:flutter_stacked_mvvm_app/app/app.locator.dart';
import 'package:flutter_stacked_mvvm_app/services/counter_view_services.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class HomeViewModel extends BaseViewModel {
  final counterService = Counterservice();
   final navigationService = locator<Counterservice>();

  getCounterValue() {
    return counterService.getValue();
  }
}
