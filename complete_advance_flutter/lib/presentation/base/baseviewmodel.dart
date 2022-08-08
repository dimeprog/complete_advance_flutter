abstract class BaseViewModel extends BaseViewModelInputs
    with BaseViewModelOutputs {}

// adding class to take in inputs
abstract class BaseViewModelInputs {
  void onStart();
  void dispose();
}

//  adding input class that process output
abstract class BaseViewModelOutputs {}
