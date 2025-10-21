import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:lottie/lottie.dart';
import 'package:model_viewer_plus/model_viewer_plus.dart';
import '../../../core/constants/app_colors.dart';
import '../../../shared/custom_text.dart';

class SpicySlider extends StatefulWidget {
  const SpicySlider({super.key, required this.value, required this.onChanged});
  final double value;
  final ValueChanged<double> onChanged;

  @override
  State<SpicySlider> createState() => _SpicySliderState();
}

class _SpicySliderState extends State<SpicySlider> {

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 200,
          child: ModelViewer(
              src: 'assets/3dModel/burger.glb',
            autoPlay: true,
          ),
        ),

        // SizedBox(
        //   height: 200,
        //   width: double.infinity,
        //   child: Image.asset('assets/test/test.png'),
        // ),

        Padding(
          padding:  EdgeInsets.symmetric(horizontal: 40.0),
          child: SliderTheme(
            data: SliderTheme.of(context).copyWith(
              thumbShape: const RoundSliderThumbShape(enabledThumbRadius: 3),
              overlayShape: const RoundSliderOverlayShape(overlayRadius: 10),
              trackHeight: 3,
           ),

            child: Slider(
              min: 0,
              max: 1,
              value: widget.value,
              onChanged: widget.onChanged,
              inactiveColor: Colors.grey.shade900.withOpacity(0.2),
              activeColor: AppColors.primary.withOpacity(0.7),
            ),
          ),
        ),


        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 53),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomText(text: 'Cold 🥶', weight:  FontWeight.bold,size: 12,),
              Gap(100),
              CustomText(text: '🌶️ Hot', weight: FontWeight.bold, size: 12,),
            ],
          ),
        ),


      ],
    );
  }
}
