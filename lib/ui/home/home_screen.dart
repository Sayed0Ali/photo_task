import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:task_photo/ui/home/app_bar.dart';
import '../../core/di/di.dart';
import '../../core/resources/app_colors.dart';
import '../cubit/photo_state.dart';
import '../cubit/photo_view_model.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = 'HomeScreen';
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

PhotoViewModel viewModel = getIt<PhotoViewModel>();

class _HomeScreenState extends State<HomeScreen> {
  @override
  @override
  void initState() {
    super.initState();
    viewModel.getPhotos(1);
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      body: Column(
        children: [
          Expanded(
            child: BlocBuilder<PhotoViewModel, PhotoState>(
              bloc: viewModel,
              builder: (context, state) {
                if (state is PhotoLoadingState) {
                  return const Center(
                    child: CircularProgressIndicator(
                      color: AppColors.greyColor,
                    ),
                  );
                } else if (state is PhotoSuccessState) {
                  final photos = state.photos;
                  return Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: MasonryGridView.count(
                      crossAxisCount: 2,
                      mainAxisSpacing: 10,
                      crossAxisSpacing: 10,
                      itemCount: photos.length,
                      itemBuilder: (context, index) {
                        final photo = photos[index];
                        return ClipRRect(
                          borderRadius: BorderRadius.circular(12),
                          child: CachedNetworkImage(
                            imageUrl: photo.src.medium,
                            fit: BoxFit.cover,
                            placeholder:
                                (context, url) => const Center(
                                  child: CircularProgressIndicator(
                                    color: AppColors.greyColor,
                                  ),
                                ),
                            errorWidget:
                                (context, url, error) =>
                                    const Icon(Icons.error),
                          ),
                        );
                      },
                    ),
                  );
                } else if (state is PhotoErrorState) {
                  return Center(child: Text('Error: ${state.errorMessage}'));
                } else {
                  return const SizedBox();
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
