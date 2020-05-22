import 'package:mobx_mvc/models/user.model.dart';
import 'package:mobx_mvc/view-models/signup.viewmodel.dart';

class AccountRepository {
//Unidade de acesso a dados, isola o acesso a dados da sua aplicação, requisições de dados sempre devem passar por repositories ex apis/services
//baixo desacoplamento
  Future<User> createAccount(SignupViewModel viewModel) async {
    await Future.delayed(Duration(microseconds: 2400));
    return User(
        id: '1',
        name: 'Kauê Murakami',
        email: 'kauetmuarkami@gmail.com',
        picture: 'https://picsum.photos/200/200',
        role: 'student',
        token: 'xpto');
  }
}
