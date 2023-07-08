import 'package:flutter/material.dart';
import 'package:flutter_stacked_mvvm_app/model/counter_view_model.dart';
import 'package:flutter_stacked_mvvm_app/model/home_view_model.dart';
import 'package:stacked/stacked.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
      viewModelBuilder: () => HomeViewModel(),
      builder: (context, viewModel, child) {
        return Scaffold(
          appBar: AppBar(),
          body: Center(
            child: Column(
              children: [
                Text(
                  "${viewModel.getCounterValue()}",
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
