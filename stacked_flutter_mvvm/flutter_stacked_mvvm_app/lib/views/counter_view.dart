import 'package:flutter/material.dart';
import 'package:flutter_stacked_mvvm_app/model/counter_view_model.dart';
import 'package:flutter_stacked_mvvm_app/views/home_view.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class CounterView extends StatelessWidget {
  const CounterView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
        viewModelBuilder: () => CounterViewModel(),
        builder: (context, viewModel, child) {
          return Scaffold(
              appBar: AppBar(),
              body: Center(
                  child: Column(children: [
                Text(
                  "${viewModel.getCounterValue()}",
                  style: const TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                ElevatedButton(
                    onPressed: () {
                      viewModel.addValue();
                    },
                    child: Text("Add counter")),
                SizedBox(
                  height: 15,
                ),
                ElevatedButton(
                  onPressed: () {
                   // viewModel.navigationService;
                  },
                  child: Text("Go to homepage"),
                ),
              ])));
        });
  }
}









/*import 'package:flutter/material.dart';
import 'package:flutter_stacked_mvvm_app/model/counter_view_model.dart';
import 'package:stacked/stacked.dart';

class CounterView extends StackedView<CounterViewModel> {

 @override
Widget builder(BuildContext context, CounterViewModel viewModel, Widget? child) {
  return Scaffold(
    floatingActionButton:
      FloatingActionButton(onPressed: viewModel.incrementCounter),
    body: Center(
      child: Text(
        viewModel.counter.toString(),
        style: const TextStyle(
          fontSize: 30,
          fontWeight: FontWeight.bold,
        ),
      ),
    ),
    
  );
}

  @override
  CounterViewModel viewModelBuilder(BuildContext context) => CounterViewModel();
}
*/