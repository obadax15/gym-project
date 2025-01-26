part of 'getuserdetails_cubit.dart';
enum GetUserDetailStatus {
  loading,
  initial,
  failure,
  success,
}

class GetUserDetailsState extends Equatable {
  final GetUserDetailStatus getUserDetailStatus;
  final Map<String, dynamic>? userDetails;  // Add userDetails to the state

  // Constructor with optional userDetails
  GetUserDetailsState({required this.getUserDetailStatus, this.userDetails});

  // Initial state
  factory GetUserDetailsState.initial() =>
      GetUserDetailsState(getUserDetailStatus: GetUserDetailStatus.initial);

  // Success state with userDetails
  factory GetUserDetailsState.success(Map<String, dynamic> userDetails) =>
      GetUserDetailsState(
          getUserDetailStatus: GetUserDetailStatus.success, userDetails: userDetails);

  // Failure state with an error message
  factory GetUserDetailsState.failure() =>
      GetUserDetailsState(getUserDetailStatus: GetUserDetailStatus.failure);

  @override
  List<Object?> get props => [getUserDetailStatus, userDetails];

  GetUserDetailsState copyWith(
      {GetUserDetailStatus? getUserDetailStatus, Map<String, dynamic>? userDetails}) {
    return GetUserDetailsState(
      getUserDetailStatus: getUserDetailStatus ?? this.getUserDetailStatus,
      userDetails: userDetails ?? this.userDetails,
    );
  }
}
