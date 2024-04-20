part of 'video_get_cubit.dart';

@immutable
sealed class VideoGetState {}

final class VideoGetInitial extends VideoGetState {}

class VideoLoading extends VideoGetState {}

class VideoLoaded extends VideoGetState {
  final List<VideoModel> videos;

  VideoLoaded(this.videos);
}

class VideoError extends VideoGetState {
  final String message;

  VideoError(this.message);
}
