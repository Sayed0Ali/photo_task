import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_photo/config/cubit/theme_data_cubit.dart';
import 'package:task_photo/core/resources/app_colors.dart';
import 'package:task_photo/core/resources/asset_manger.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight + 16);

  @override
  Widget build(BuildContext context) {
    final isLight = Theme.of(context).brightness == Brightness.light;

    return AppBar(
      backgroundColor:
      isLight ? AppColors.whiteColor : const Color(0xff212121),
      elevation: 0,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image.asset(
            isLight
                ? AssetsManger.routeLightImage
                : AssetsManger.routeDarkImage,
            width: 100,
            height: 50,
          ),
          GestureDetector(
            onTap: () {

               log('Toggle Pressed'); //
                context.read<ThemeDataCubit>().toggleTheme();

            },
            child: Container(
              width: 80,
              height: 40,
              decoration: BoxDecoration(
                color: isLight ? AppColors.whiteColor : AppColors.blackColor,
                borderRadius: BorderRadius.circular(40),
                border: Border.all(
                  color: isLight ? AppColors.deepBlue : AppColors.whiteColor,
                  width: 2,
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: 36,
                    height: 36,
                    decoration: BoxDecoration(
                      color: isLight
                          ? AppColors.deepBlue
                          : AppColors.transparentColor,
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      Icons.wb_sunny,
                      size: 20,
                      color: AppColors.whiteColor,
                    ),
                  ),
                  Container(
                    width: 36,
                    height: 36,
                    decoration: BoxDecoration(
                      color: isLight
                          ? AppColors.transparentColor
                          : AppColors.whiteColor,
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      Icons.nightlight_round,
                      size: 20,
                      color:
                      isLight ? AppColors.deepBlue : AppColors.blackColor,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
