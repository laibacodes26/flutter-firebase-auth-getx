import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/auth_controller.dart';
import '../theme/neon_theme.dart';

class SignupView extends StatelessWidget {
  SignupView({super.key});
  final AuthController controller=Get.find<AuthController>();

  @override
  Widget build(BuildContext context)=>Scaffold(
    backgroundColor:AppColors.bg,
    body:SafeArea(child:NeonFrame(child:SingleChildScrollView(
      padding:const EdgeInsets.fromLTRB(24,6,24,20),
      child:Column(crossAxisAlignment:CrossAxisAlignment.stretch,children:[
        Row(children:[
          IconButton(padding:EdgeInsets.zero,constraints:const BoxConstraints(),
            onPressed:()=>Get.back(),icon:const Icon(Icons.arrow_back,color:Colors.white)),
          const SizedBox(width:8),
          const Text('Create Account',style:TextStyle(color:Colors.white,fontSize:26,fontWeight:FontWeight.bold))
        ]),
        const Padding(padding:EdgeInsets.only(left:32),child:Text('Sign up to get started',style:TextStyle(color:AppColors.subtitle,fontSize:15))),
        const SizedBox(height:20),
        Center(child:LockOrbitIcon(size:130)),
        const SizedBox(height:25),
        NeonField(controller:controller.nameController,hint:'Full Name',icon:Icons.person_outline),
        const SizedBox(height:16),
        NeonField(controller:controller.emailController,hint:'Email Address',icon:Icons.email_outlined,keyboardType:TextInputType.emailAddress),
        const SizedBox(height:16),
        Obx(()=>NeonField(controller:controller.passwordController,hint:'Password',icon:Icons.lock_outline,
          obscure:!controller.isPasswordVisible.value,
          suffix:IconButton(onPressed:controller.togglePasswordVisibility,
            icon:Icon(controller.isPasswordVisible.value?Icons.visibility_off:Icons.visibility,color:AppColors.purple)))),
        const SizedBox(height:16),
        Obx(()=>NeonField(controller:controller.confirmPasswordController,hint:'Confirm Password',icon:Icons.lock_reset_outlined,
          obscure:!controller.isConfirmPasswordVisible.value,
          suffix:IconButton(onPressed:controller.toggleConfirmPasswordVisibility,
            icon:Icon(controller.isConfirmPasswordVisible.value?Icons.visibility_off:Icons.visibility,color:AppColors.purple)))),
        const SizedBox(height:28),
        Obx(()=>GradientButton(text:'Create Account',loading:controller.isLoading.value,
          onPressed:controller.isLoading.value?null:controller.signup)),
        const SizedBox(height:25),
        const OrDivider(text:'Already have an account?'),
        const SizedBox(height:12),
        Center(child:TextButton(onPressed:()=>Get.back(),
          child:const Text('Login',style:TextStyle(color:AppColors.pink,fontWeight:FontWeight.bold,fontSize:16)))),
        const SizedBox(height:15),
      ]),
    ))),
  );
}