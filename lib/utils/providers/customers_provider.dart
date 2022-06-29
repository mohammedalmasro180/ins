import 'package:flutter/cupertino.dart';
import '../../models/customer.dart';
import '../clients/client.dart';

class CustomersProvider extends ChangeNotifier {
  bool _loading = false;
  Customer? _selectedCustomer;

  Customer? get selectedCustomer => _selectedCustomer;

  bool get loading => _loading;

  /*Future<void> initCustomers()async{
    startLoading();
    _customers  ;//= await Client.getCustomers();
    stopLoading();
    _customerOrderPlan=false;
    notifyListeners();
    return;
  }*/
  Future<bool> getCustomerById({required int id}) async {
    notifyListeners();
    Customer? customer = await Client.getCustomerById(id);
    if (customer != null) {
      _selectedCustomer = customer;
      notifyListeners();
      return true;
    } else {
      return false;
    }
  }

  clearSelectedCustomer() {
    _selectedCustomer = null;
    notifyListeners();
  }

  startLoading() {
    _loading = true;
    notifyListeners();
  }

  stopLoading() {
    _loading = false;
    notifyListeners();
  }

}
