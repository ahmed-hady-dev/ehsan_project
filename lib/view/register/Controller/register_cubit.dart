import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../constants/constants.dart';
import '../model/user_model.dart';
import 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit() : super(RegisterInitial());
  static RegisterCubit get(context) => BlocProvider.of(context);
//===============================================================
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _fireStore = FirebaseFirestore.instance;
  bool isPassword = true;
  bool isPasswordConfirm = true;
  IconData suffix = Icons.visibility_outlined;
  IconData suffixConfirm = Icons.visibility_outlined;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  FocusNode firstNameFocusNode = FocusNode(),
      lastNameFocusNode = FocusNode(),
      phoneFocusNode = FocusNode(),
      dateFocusNode = FocusNode(),
      bloodTypeFocusNode = FocusNode(),
      addressFocusNode = FocusNode(),
      emailFocusNode = FocusNode(),
      passwordFocusNode = FocusNode(),
      confirmPasswordFocusNode = FocusNode();
  TextEditingController firstNameController = TextEditingController(),
      lastNameController = TextEditingController(),
      phoneController = TextEditingController(),
      dateController = TextEditingController(),
      bloodTypeController = TextEditingController(),
      addressController = TextEditingController(),
      emailController = TextEditingController(),
      passwordController = TextEditingController(),
      confirmPasswordController = TextEditingController();

//===============================================================
  void changePasswordVisibility() {
    isPassword = !isPassword;
    suffix = isPassword ? Icons.visibility_outlined : Icons.visibility_off_outlined;
    emit(RegisterChangePasswordVisibilityState());
  }

//===============================================================
  void changeConfirmPasswordVisibility() {
    isPasswordConfirm = !isPasswordConfirm;
    suffixConfirm = isPasswordConfirm ? Icons.visibility_outlined : Icons.visibility_off_outlined;
    emit(RegisterChangePasswordVisibilityState());
  }

//===============================================================
  void registerWithEmail() async {
    emit(RegisterLoadingState());
    try {
      if (!formKey.currentState!.validate()) {
        emit(RegisterInitial());
        return;
      }
      UserCredential userCredential = await _auth.createUserWithEmailAndPassword(
        email: emailController.text.trim().toLowerCase(),
        password: passwordController.text.trim(),
      );
      final userModel = UserModel(
        uid: userCredential.user!.uid,
        firstName: firstNameController.text.trim(),
        lastName: lastNameController.text.trim(),
        email: emailController.text.trim().toLowerCase(),
        phoneNumber: phoneController.text.trim(),
        bloodType: bloodTypeController.text.trim(),
        address: addressController.text.trim(),
      );
      await _fireStore.collection(AppConstants.users).doc(userCredential.user!.uid).set(userModel.toMap());
      emit(RegisterSuccessState());
    } on FirebaseAuthException catch (e) {
      emit(RegisterLErrorState(msg: e.message.toString()));
    } catch (e, s) {
      debugPrint(e.toString());
      debugPrint(s.toString());
      emit(RegisterLErrorState(msg: e.toString()));
    }
  }

//===============================================================

  @override
  Future<void> close() {
    firstNameController.dispose();
    lastNameController.dispose();
    phoneController.dispose();
    dateController.dispose();
    bloodTypeController.dispose();
    addressController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    firstNameFocusNode.dispose();
    lastNameFocusNode.dispose();
    phoneFocusNode.dispose();
    dateFocusNode.dispose();
    bloodTypeFocusNode.dispose();
    addressFocusNode.dispose();
    emailFocusNode.dispose();
    passwordFocusNode.dispose();
    confirmPasswordFocusNode.dispose();
    return super.close();
  }
}
