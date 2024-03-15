import 'package:firbase_1/core/auth_exaption.dart/base_exapation.dart';

class AuthExaption extends BaseExaption {
  String? error;
  AuthExaption({
    required this.error,
  }):super(mgs: error??" try again");
}
