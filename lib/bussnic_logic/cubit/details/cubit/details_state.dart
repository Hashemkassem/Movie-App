part of 'details_cubit.dart';

@immutable
sealed class DetailsState {}

final class DetailsInitial extends DetailsState {}

final class DetailsLoaded extends DetailsState {
  final DetailsModel details;

  DetailsLoaded(this.details);
}

class DetailsLoading extends DetailsState {}

class DetailsError extends DetailsState {
  final String message;

  DetailsError(this.message);
}
