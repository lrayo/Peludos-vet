// ignore_for_file: unrelated_type_equality_checks

import 'package:flutter/material.dart';
import 'package:flutter_meedu/meedu.dart';
import 'package:flutter_meedu/ui.dart';
import 'package:peludos_pet/app/utils/address_validator.dart';
import 'package:peludos_pet/app/utils/email_validator.dart';
import 'package:peludos_pet/app/utils/name_validator.dart';
import 'package:peludos_pet/app/utils/phone_validator.dart';
import 'package:peludos_pet/app/view/global_controller/session_controller.dart';
import 'package:peludos_pet/app/view/global_widget/custon_input_field.dart';
import 'package:peludos_pet/app/view/pages/register/controller/register_controller.dart';
import 'package:peludos_pet/app/view/pages/register/controller/register_state.dart';

final registerProvider = StateProvider<RegisterController, RegisterState>(
  (_) => RegisterController(sessionProvider.read),
);

class FromRegister extends StatelessWidget {
  const FromRegister({super.key});
  

  @override
  Widget build(BuildContext context) {
    return ProviderListener<RegisterController>(
      provider: registerProvider,
      builder: (_, controller) {
        return Form(
          key: controller.formKey,
          child: Column(
            children: [
              CustonInputField(
                label: 'Name',
                onChanged: controller.onNameChanged,
                validator: (text) {
                  return isValidName(text!) ? null : 'Invalid name';
                },
              ),
              CustonInputField(
                label: 'Email',
                isPassword: false,
                inputType: TextInputType.emailAddress,
                onChanged: controller.onEmailChanged,
                validator: (text) {
                  return isValidEmail(text!) ? null : 'Invalid email';
                },
              ),
              CustonInputField(
                label: 'Phone Number',
                onChanged: controller.onPhoneChanged,
                validator: (text) {
                  return isValidPhone(text!) ? null : 'Invalid Phone Number';
                },
              ),
              CustonInputField(
                label: 'Address',
                onChanged: controller.onAddressChanged,
                validator: (text) {
                  return isValidAddress(text!) ? null : 'Invalid Address';
                },
              ),
              CustonInputField(
                label: 'Password',
                isPassword: true,
                onChanged: controller.onPasswordChanged,
                validator: (text) {
                  if (text!.trim().length >= 6) {
                    return null;
                  }
                  return 'Invalid password';
                },
              ),
              Consumer(builder: (_, ref, __) {
                final password =
                    ref.watch(registerProvider.select((state) => state.password));
                return CustonInputField(
                  label: 'Confirm Password',
                  isPassword: true,
                  onChanged: controller.onVPasswordChanged,
                  validator: (text) {
                    if (text == password) {
                      return 'Invalid password';
                    }
                    if (controller.state.password != text) {
                      return 'Passwords do not match';
                    }
                    if (text!.trim().length >= 6) {
                      return null;
                    }
                    return 'Invalid password';
                  },
                );
              })
            ],
          ),
        );
      },
    );
  }
}
