import 'package:mobx_mvc/models/user.model.dart';
import 'package:mobx_mvc/repositories/account.repository.dart';
import 'package:mobx_mvc/view-models/signup.viewmodel.dart';

class SignupController {
  AccountRepository repository;
  SignupController(){
    repository = AccountRepository();
  }
  //retorno da api
  Future<User> create(SignupViewModel model) async {
    model.busy = true;
    var user = await repository.createAccount(model);
    model.busy = false;
    return user;
  }
}
