import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import 'package:task_photo/ui/cubit/photo_state.dart';

import '../../domain/model/photo_model.dart';
import '../../domain/repository/Photo_epository.dart';

@injectable
class PhotoViewModel extends Cubit<PhotoState> {
  final PhotoRepository photoRepository;

  PhotoViewModel({required this.photoRepository}) : super(PhotoLoadingState());

  void getPhotos(int page) async {
    try {
      emit(PhotoLoadingState());
      final List<Photo> photos = await photoRepository.getPhotos(page,1000);
      emit(PhotoSuccessState(photos: photos));
    } catch (e) {
      emit(PhotoErrorState(errorMessage: e.toString()));
    }
  }
}
