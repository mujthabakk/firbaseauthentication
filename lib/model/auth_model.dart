import 'package:firebase_auth/firebase_auth.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part  "auth_model.freezed.dart";

@freezed
class AuthProviderSate with _$AuthProviderSate {
  factory AuthProviderSate({required bool isLoading, required User? user}) =
      _AuthProviderSate;
}
