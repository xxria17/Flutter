import 'package:flutter/material.dart';
import 'base_view_model.dart';

abstract class BaseStatefulScreen<T extends BaseViewModel> extends StatefulWidget {
  BaseStatefulScreen({Key? key}): super(key: key) {
    initDependency();
  }

  T? viewModel;

  void initDependency();
}