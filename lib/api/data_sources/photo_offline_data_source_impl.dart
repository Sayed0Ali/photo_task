import 'package:hive/hive.dart';
import 'package:injectable/injectable.dart';
import '../../data/datasources/photo_offline_data_source.dart';
import '../../domain/model/photo_model.dart';

@LazySingleton(as: PhotoOfflineDataSource)
class PhotoOfflineDataSourceImpl implements PhotoOfflineDataSource {
  static const String _boxName = 'photosBox';

  @override
  Future<void> savePhotos(List<Photo> photos, int page) async {
    final box = await Hive.openBox<List>('$_boxName$page');
    await box.put('photos', photos);
    await box.close();
  }

  @override
  Future<List<Photo>> getPhotos(int page) async {
    final box = await Hive.openBox<List>('$_boxName$page');
    final photos = box.get('photos', defaultValue: [])?.cast<Photo>() ?? [];
    await box.close();
    return photos;
  }
}
