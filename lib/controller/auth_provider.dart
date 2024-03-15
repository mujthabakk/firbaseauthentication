
import 'package:firbase_1/model/auth_model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'auth_provider.g.dart';


@riverpod
class AuthProvider extends _$AuthProvider {
  @override
  AuthProviderSate build(){
    return AuthProviderSate(isLoading: true,user:null ) ;

  }

}