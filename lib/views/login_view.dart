import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/auth_controller.dart';
import '../routes/app_routes.dart';
import '../theme/neon_theme.dart';

class LoginView extends StatelessWidget {
  LoginView({super.key});
  final AuthController controller=Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:AppColors.bg,
      body:SafeArea(child:NeonFrame(child:Center(child:SingleChildScrollView(
        padding:const EdgeInsets.symmetric(horizontal:24,vertical:20),
        child:Column(crossAxisAlignment:CrossAxisAlignment.stretch,children:[
          const SizedBox(height:20),
          const Center(child:LockOrbitIcon()),
          const SizedBox(height:24),
          Center(child:RichText(text:TextSpan(children:[
            const TextSpan(text:'Welcome ',style:TextStyle(color:Colors.white,fontSize:30,fontWeight:FontWeight.bold)),
            WidgetSpan(alignment:PlaceholderAlignment.baseline,baseline:TextBaseline.alphabetic,
              child:GradientText('Back',style:const TextStyle(fontSize:30,fontWeight:FontWeight.bold))),
          ]))),
          const SizedBox(height:8),
          const Center(child:Text('Login to continue your journey',style:TextStyle(color:AppColors.subtitle,fontSize:15))),
          const SizedBox(height:35),
          NeonField(controller:controller.emailController,hint:'Email Address',icon:Icons.email_outlined,keyboardType:TextInputType.emailAddress),
          const SizedBox(height:18),
          Obx(()=>NeonField(controller:controller.passwordController,hint:'Password',icon:Icons.lock_outline,
            obscure:!controller.isPasswordVisible.value,
            suffix:IconButton(onPressed:controller.togglePasswordVisibility,
              icon:Icon(controller.isPasswordVisible.value?Icons.visibility_off:Icons.visibility,color:AppColors.purple)))),
          const SizedBox(height:10),
          Align(alignment:Alignment.centerRight,child:TextButton(onPressed:(){},
            child:const Text('Forgot Password?',style:TextStyle(color:AppColors.pink,fontWeight:FontWeight.w600)))),
          const SizedBox(height:15),
          Obx(()=>GradientButton(text:'Login',loading:controller.isLoading.value,
            onPressed:controller.isLoading.value?null:controller.login)),
          const SizedBox(height:30),
          const OrDivider(text:"Don't have an account?"),
          const SizedBox(height:12),
          Center(child:TextButton(onPressed:()=>Get.toNamed(AppRoutes.signup),
            child:const Text('Sign Up',style:TextStyle(color:AppColors.pink,fontWeight:FontWeight.bold,fontSize:16)))),
          const SizedBox(height:10),
        ]),
      )))),
    );
  }
}