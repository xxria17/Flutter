import 'package:flutter/material.dart';
import 'base_view_model.dart';

abstract class BaseScreen<T extends BaseViewModel> extends StatelessWidget {
  BaseScreen({Key? key}): super(key: key) {
    initDependency();
  }

  T? viewModel;

  void initDependency();
}