// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'auth_models.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

LoginRequest _$LoginRequestFromJson(Map<String, dynamic> json) {
  return _LoginRequest.fromJson(json);
}

/// @nodoc
mixin _$LoginRequest {
  String get email => throw _privateConstructorUsedError;
  String get password => throw _privateConstructorUsedError;

  /// Serializes this LoginRequest to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of LoginRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $LoginRequestCopyWith<LoginRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LoginRequestCopyWith<$Res> {
  factory $LoginRequestCopyWith(
    LoginRequest value,
    $Res Function(LoginRequest) then,
  ) = _$LoginRequestCopyWithImpl<$Res, LoginRequest>;
  @useResult
  $Res call({String email, String password});
}

/// @nodoc
class _$LoginRequestCopyWithImpl<$Res, $Val extends LoginRequest>
    implements $LoginRequestCopyWith<$Res> {
  _$LoginRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of LoginRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? email = null, Object? password = null}) {
    return _then(
      _value.copyWith(
            email:
                null == email
                    ? _value.email
                    : email // ignore: cast_nullable_to_non_nullable
                        as String,
            password:
                null == password
                    ? _value.password
                    : password // ignore: cast_nullable_to_non_nullable
                        as String,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$LoginRequestImplCopyWith<$Res>
    implements $LoginRequestCopyWith<$Res> {
  factory _$$LoginRequestImplCopyWith(
    _$LoginRequestImpl value,
    $Res Function(_$LoginRequestImpl) then,
  ) = __$$LoginRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String email, String password});
}

/// @nodoc
class __$$LoginRequestImplCopyWithImpl<$Res>
    extends _$LoginRequestCopyWithImpl<$Res, _$LoginRequestImpl>
    implements _$$LoginRequestImplCopyWith<$Res> {
  __$$LoginRequestImplCopyWithImpl(
    _$LoginRequestImpl _value,
    $Res Function(_$LoginRequestImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of LoginRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? email = null, Object? password = null}) {
    return _then(
      _$LoginRequestImpl(
        email:
            null == email
                ? _value.email
                : email // ignore: cast_nullable_to_non_nullable
                    as String,
        password:
            null == password
                ? _value.password
                : password // ignore: cast_nullable_to_non_nullable
                    as String,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$LoginRequestImpl implements _LoginRequest {
  const _$LoginRequestImpl({required this.email, required this.password});

  factory _$LoginRequestImpl.fromJson(Map<String, dynamic> json) =>
      _$$LoginRequestImplFromJson(json);

  @override
  final String email;
  @override
  final String password;

  @override
  String toString() {
    return 'LoginRequest(email: $email, password: $password)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoginRequestImpl &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.password, password) ||
                other.password == password));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, email, password);

  /// Create a copy of LoginRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LoginRequestImplCopyWith<_$LoginRequestImpl> get copyWith =>
      __$$LoginRequestImplCopyWithImpl<_$LoginRequestImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$LoginRequestImplToJson(this);
  }
}

abstract class _LoginRequest implements LoginRequest {
  const factory _LoginRequest({
    required final String email,
    required final String password,
  }) = _$LoginRequestImpl;

  factory _LoginRequest.fromJson(Map<String, dynamic> json) =
      _$LoginRequestImpl.fromJson;

  @override
  String get email;
  @override
  String get password;

  /// Create a copy of LoginRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LoginRequestImplCopyWith<_$LoginRequestImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

SendOtpRequest _$SendOtpRequestFromJson(Map<String, dynamic> json) {
  return _SendOtpRequest.fromJson(json);
}

/// @nodoc
mixin _$SendOtpRequest {
  @JsonKey(name: 'mobile_number')
  String get mobileNumber => throw _privateConstructorUsedError;

  /// Serializes this SendOtpRequest to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of SendOtpRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SendOtpRequestCopyWith<SendOtpRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SendOtpRequestCopyWith<$Res> {
  factory $SendOtpRequestCopyWith(
    SendOtpRequest value,
    $Res Function(SendOtpRequest) then,
  ) = _$SendOtpRequestCopyWithImpl<$Res, SendOtpRequest>;
  @useResult
  $Res call({@JsonKey(name: 'mobile_number') String mobileNumber});
}

/// @nodoc
class _$SendOtpRequestCopyWithImpl<$Res, $Val extends SendOtpRequest>
    implements $SendOtpRequestCopyWith<$Res> {
  _$SendOtpRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SendOtpRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? mobileNumber = null}) {
    return _then(
      _value.copyWith(
            mobileNumber:
                null == mobileNumber
                    ? _value.mobileNumber
                    : mobileNumber // ignore: cast_nullable_to_non_nullable
                        as String,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$SendOtpRequestImplCopyWith<$Res>
    implements $SendOtpRequestCopyWith<$Res> {
  factory _$$SendOtpRequestImplCopyWith(
    _$SendOtpRequestImpl value,
    $Res Function(_$SendOtpRequestImpl) then,
  ) = __$$SendOtpRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({@JsonKey(name: 'mobile_number') String mobileNumber});
}

/// @nodoc
class __$$SendOtpRequestImplCopyWithImpl<$Res>
    extends _$SendOtpRequestCopyWithImpl<$Res, _$SendOtpRequestImpl>
    implements _$$SendOtpRequestImplCopyWith<$Res> {
  __$$SendOtpRequestImplCopyWithImpl(
    _$SendOtpRequestImpl _value,
    $Res Function(_$SendOtpRequestImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of SendOtpRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? mobileNumber = null}) {
    return _then(
      _$SendOtpRequestImpl(
        mobileNumber:
            null == mobileNumber
                ? _value.mobileNumber
                : mobileNumber // ignore: cast_nullable_to_non_nullable
                    as String,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$SendOtpRequestImpl implements _SendOtpRequest {
  const _$SendOtpRequestImpl({
    @JsonKey(name: 'mobile_number') required this.mobileNumber,
  });

  factory _$SendOtpRequestImpl.fromJson(Map<String, dynamic> json) =>
      _$$SendOtpRequestImplFromJson(json);

  @override
  @JsonKey(name: 'mobile_number')
  final String mobileNumber;

  @override
  String toString() {
    return 'SendOtpRequest(mobileNumber: $mobileNumber)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SendOtpRequestImpl &&
            (identical(other.mobileNumber, mobileNumber) ||
                other.mobileNumber == mobileNumber));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, mobileNumber);

  /// Create a copy of SendOtpRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SendOtpRequestImplCopyWith<_$SendOtpRequestImpl> get copyWith =>
      __$$SendOtpRequestImplCopyWithImpl<_$SendOtpRequestImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$SendOtpRequestImplToJson(this);
  }
}

abstract class _SendOtpRequest implements SendOtpRequest {
  const factory _SendOtpRequest({
    @JsonKey(name: 'mobile_number') required final String mobileNumber,
  }) = _$SendOtpRequestImpl;

  factory _SendOtpRequest.fromJson(Map<String, dynamic> json) =
      _$SendOtpRequestImpl.fromJson;

  @override
  @JsonKey(name: 'mobile_number')
  String get mobileNumber;

  /// Create a copy of SendOtpRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SendOtpRequestImplCopyWith<_$SendOtpRequestImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

VerifyOtpRequest _$VerifyOtpRequestFromJson(Map<String, dynamic> json) {
  return _VerifyOtpRequest.fromJson(json);
}

/// @nodoc
mixin _$VerifyOtpRequest {
  @JsonKey(name: 'mobile_number')
  String get mobileNumber => throw _privateConstructorUsedError;
  String get otp => throw _privateConstructorUsedError;

  /// Serializes this VerifyOtpRequest to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of VerifyOtpRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $VerifyOtpRequestCopyWith<VerifyOtpRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $VerifyOtpRequestCopyWith<$Res> {
  factory $VerifyOtpRequestCopyWith(
    VerifyOtpRequest value,
    $Res Function(VerifyOtpRequest) then,
  ) = _$VerifyOtpRequestCopyWithImpl<$Res, VerifyOtpRequest>;
  @useResult
  $Res call({@JsonKey(name: 'mobile_number') String mobileNumber, String otp});
}

/// @nodoc
class _$VerifyOtpRequestCopyWithImpl<$Res, $Val extends VerifyOtpRequest>
    implements $VerifyOtpRequestCopyWith<$Res> {
  _$VerifyOtpRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of VerifyOtpRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? mobileNumber = null, Object? otp = null}) {
    return _then(
      _value.copyWith(
            mobileNumber:
                null == mobileNumber
                    ? _value.mobileNumber
                    : mobileNumber // ignore: cast_nullable_to_non_nullable
                        as String,
            otp:
                null == otp
                    ? _value.otp
                    : otp // ignore: cast_nullable_to_non_nullable
                        as String,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$VerifyOtpRequestImplCopyWith<$Res>
    implements $VerifyOtpRequestCopyWith<$Res> {
  factory _$$VerifyOtpRequestImplCopyWith(
    _$VerifyOtpRequestImpl value,
    $Res Function(_$VerifyOtpRequestImpl) then,
  ) = __$$VerifyOtpRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({@JsonKey(name: 'mobile_number') String mobileNumber, String otp});
}

/// @nodoc
class __$$VerifyOtpRequestImplCopyWithImpl<$Res>
    extends _$VerifyOtpRequestCopyWithImpl<$Res, _$VerifyOtpRequestImpl>
    implements _$$VerifyOtpRequestImplCopyWith<$Res> {
  __$$VerifyOtpRequestImplCopyWithImpl(
    _$VerifyOtpRequestImpl _value,
    $Res Function(_$VerifyOtpRequestImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of VerifyOtpRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? mobileNumber = null, Object? otp = null}) {
    return _then(
      _$VerifyOtpRequestImpl(
        mobileNumber:
            null == mobileNumber
                ? _value.mobileNumber
                : mobileNumber // ignore: cast_nullable_to_non_nullable
                    as String,
        otp:
            null == otp
                ? _value.otp
                : otp // ignore: cast_nullable_to_non_nullable
                    as String,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$VerifyOtpRequestImpl implements _VerifyOtpRequest {
  const _$VerifyOtpRequestImpl({
    @JsonKey(name: 'mobile_number') required this.mobileNumber,
    required this.otp,
  });

  factory _$VerifyOtpRequestImpl.fromJson(Map<String, dynamic> json) =>
      _$$VerifyOtpRequestImplFromJson(json);

  @override
  @JsonKey(name: 'mobile_number')
  final String mobileNumber;
  @override
  final String otp;

  @override
  String toString() {
    return 'VerifyOtpRequest(mobileNumber: $mobileNumber, otp: $otp)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$VerifyOtpRequestImpl &&
            (identical(other.mobileNumber, mobileNumber) ||
                other.mobileNumber == mobileNumber) &&
            (identical(other.otp, otp) || other.otp == otp));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, mobileNumber, otp);

  /// Create a copy of VerifyOtpRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$VerifyOtpRequestImplCopyWith<_$VerifyOtpRequestImpl> get copyWith =>
      __$$VerifyOtpRequestImplCopyWithImpl<_$VerifyOtpRequestImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$VerifyOtpRequestImplToJson(this);
  }
}

abstract class _VerifyOtpRequest implements VerifyOtpRequest {
  const factory _VerifyOtpRequest({
    @JsonKey(name: 'mobile_number') required final String mobileNumber,
    required final String otp,
  }) = _$VerifyOtpRequestImpl;

  factory _VerifyOtpRequest.fromJson(Map<String, dynamic> json) =
      _$VerifyOtpRequestImpl.fromJson;

  @override
  @JsonKey(name: 'mobile_number')
  String get mobileNumber;
  @override
  String get otp;

  /// Create a copy of VerifyOtpRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$VerifyOtpRequestImplCopyWith<_$VerifyOtpRequestImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

AuthResponse _$AuthResponseFromJson(Map<String, dynamic> json) {
  return _AuthResponse.fromJson(json);
}

/// @nodoc
mixin _$AuthResponse {
  bool get status => throw _privateConstructorUsedError;
  String get message => throw _privateConstructorUsedError;
  String? get token => throw _privateConstructorUsedError;
  AuthResult? get result => throw _privateConstructorUsedError;

  /// Serializes this AuthResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of AuthResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AuthResponseCopyWith<AuthResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AuthResponseCopyWith<$Res> {
  factory $AuthResponseCopyWith(
    AuthResponse value,
    $Res Function(AuthResponse) then,
  ) = _$AuthResponseCopyWithImpl<$Res, AuthResponse>;
  @useResult
  $Res call({bool status, String message, String? token, AuthResult? result});

  $AuthResultCopyWith<$Res>? get result;
}

/// @nodoc
class _$AuthResponseCopyWithImpl<$Res, $Val extends AuthResponse>
    implements $AuthResponseCopyWith<$Res> {
  _$AuthResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AuthResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? message = null,
    Object? token = freezed,
    Object? result = freezed,
  }) {
    return _then(
      _value.copyWith(
            status:
                null == status
                    ? _value.status
                    : status // ignore: cast_nullable_to_non_nullable
                        as bool,
            message:
                null == message
                    ? _value.message
                    : message // ignore: cast_nullable_to_non_nullable
                        as String,
            token:
                freezed == token
                    ? _value.token
                    : token // ignore: cast_nullable_to_non_nullable
                        as String?,
            result:
                freezed == result
                    ? _value.result
                    : result // ignore: cast_nullable_to_non_nullable
                        as AuthResult?,
          )
          as $Val,
    );
  }

  /// Create a copy of AuthResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $AuthResultCopyWith<$Res>? get result {
    if (_value.result == null) {
      return null;
    }

    return $AuthResultCopyWith<$Res>(_value.result!, (value) {
      return _then(_value.copyWith(result: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$AuthResponseImplCopyWith<$Res>
    implements $AuthResponseCopyWith<$Res> {
  factory _$$AuthResponseImplCopyWith(
    _$AuthResponseImpl value,
    $Res Function(_$AuthResponseImpl) then,
  ) = __$$AuthResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool status, String message, String? token, AuthResult? result});

  @override
  $AuthResultCopyWith<$Res>? get result;
}

/// @nodoc
class __$$AuthResponseImplCopyWithImpl<$Res>
    extends _$AuthResponseCopyWithImpl<$Res, _$AuthResponseImpl>
    implements _$$AuthResponseImplCopyWith<$Res> {
  __$$AuthResponseImplCopyWithImpl(
    _$AuthResponseImpl _value,
    $Res Function(_$AuthResponseImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of AuthResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? message = null,
    Object? token = freezed,
    Object? result = freezed,
  }) {
    return _then(
      _$AuthResponseImpl(
        status:
            null == status
                ? _value.status
                : status // ignore: cast_nullable_to_non_nullable
                    as bool,
        message:
            null == message
                ? _value.message
                : message // ignore: cast_nullable_to_non_nullable
                    as String,
        token:
            freezed == token
                ? _value.token
                : token // ignore: cast_nullable_to_non_nullable
                    as String?,
        result:
            freezed == result
                ? _value.result
                : result // ignore: cast_nullable_to_non_nullable
                    as AuthResult?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$AuthResponseImpl implements _AuthResponse {
  const _$AuthResponseImpl({
    this.status = false,
    this.message = '',
    this.token,
    this.result,
  });

  factory _$AuthResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$AuthResponseImplFromJson(json);

  @override
  @JsonKey()
  final bool status;
  @override
  @JsonKey()
  final String message;
  @override
  final String? token;
  @override
  final AuthResult? result;

  @override
  String toString() {
    return 'AuthResponse(status: $status, message: $message, token: $token, result: $result)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AuthResponseImpl &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.token, token) || other.token == token) &&
            (identical(other.result, result) || other.result == result));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, status, message, token, result);

  /// Create a copy of AuthResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AuthResponseImplCopyWith<_$AuthResponseImpl> get copyWith =>
      __$$AuthResponseImplCopyWithImpl<_$AuthResponseImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AuthResponseImplToJson(this);
  }
}

abstract class _AuthResponse implements AuthResponse {
  const factory _AuthResponse({
    final bool status,
    final String message,
    final String? token,
    final AuthResult? result,
  }) = _$AuthResponseImpl;

  factory _AuthResponse.fromJson(Map<String, dynamic> json) =
      _$AuthResponseImpl.fromJson;

  @override
  bool get status;
  @override
  String get message;
  @override
  String? get token;
  @override
  AuthResult? get result;

  /// Create a copy of AuthResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AuthResponseImplCopyWith<_$AuthResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

AuthResult _$AuthResultFromJson(Map<String, dynamic> json) {
  return _AuthResult.fromJson(json);
}

/// @nodoc
mixin _$AuthResult {
  @JsonKey(name: 'emp_id')
  int get empId => throw _privateConstructorUsedError;
  @JsonKey(name: 'business_id')
  int get businessId => throw _privateConstructorUsedError;
  @JsonKey(name: 'role_id')
  int get roleId => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  @JsonKey(name: 'emp_phone')
  String get empPhone => throw _privateConstructorUsedError;
  String get email => throw _privateConstructorUsedError;
  @JsonKey(name: 'emp_code')
  String? get empCode => throw _privateConstructorUsedError;
  String? get designation => throw _privateConstructorUsedError;
  String? get region => throw _privateConstructorUsedError;
  @JsonKey(name: 'reporting_manager')
  String? get reportingManager => throw _privateConstructorUsedError;
  String? get otp => throw _privateConstructorUsedError;
  @JsonKey(name: 'auth_token')
  String? get authToken => throw _privateConstructorUsedError;
  @JsonKey(name: 'emp_is_deleted')
  int get empIsDeleted => throw _privateConstructorUsedError;
  int get status => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at')
  String? get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'updated_at')
  String? get updatedAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'deleted_at')
  String? get deletedAt => throw _privateConstructorUsedError;

  /// Serializes this AuthResult to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of AuthResult
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AuthResultCopyWith<AuthResult> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AuthResultCopyWith<$Res> {
  factory $AuthResultCopyWith(
    AuthResult value,
    $Res Function(AuthResult) then,
  ) = _$AuthResultCopyWithImpl<$Res, AuthResult>;
  @useResult
  $Res call({
    @JsonKey(name: 'emp_id') int empId,
    @JsonKey(name: 'business_id') int businessId,
    @JsonKey(name: 'role_id') int roleId,
    String name,
    @JsonKey(name: 'emp_phone') String empPhone,
    String email,
    @JsonKey(name: 'emp_code') String? empCode,
    String? designation,
    String? region,
    @JsonKey(name: 'reporting_manager') String? reportingManager,
    String? otp,
    @JsonKey(name: 'auth_token') String? authToken,
    @JsonKey(name: 'emp_is_deleted') int empIsDeleted,
    int status,
    @JsonKey(name: 'created_at') String? createdAt,
    @JsonKey(name: 'updated_at') String? updatedAt,
    @JsonKey(name: 'deleted_at') String? deletedAt,
  });
}

/// @nodoc
class _$AuthResultCopyWithImpl<$Res, $Val extends AuthResult>
    implements $AuthResultCopyWith<$Res> {
  _$AuthResultCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AuthResult
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? empId = null,
    Object? businessId = null,
    Object? roleId = null,
    Object? name = null,
    Object? empPhone = null,
    Object? email = null,
    Object? empCode = freezed,
    Object? designation = freezed,
    Object? region = freezed,
    Object? reportingManager = freezed,
    Object? otp = freezed,
    Object? authToken = freezed,
    Object? empIsDeleted = null,
    Object? status = null,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? deletedAt = freezed,
  }) {
    return _then(
      _value.copyWith(
            empId:
                null == empId
                    ? _value.empId
                    : empId // ignore: cast_nullable_to_non_nullable
                        as int,
            businessId:
                null == businessId
                    ? _value.businessId
                    : businessId // ignore: cast_nullable_to_non_nullable
                        as int,
            roleId:
                null == roleId
                    ? _value.roleId
                    : roleId // ignore: cast_nullable_to_non_nullable
                        as int,
            name:
                null == name
                    ? _value.name
                    : name // ignore: cast_nullable_to_non_nullable
                        as String,
            empPhone:
                null == empPhone
                    ? _value.empPhone
                    : empPhone // ignore: cast_nullable_to_non_nullable
                        as String,
            email:
                null == email
                    ? _value.email
                    : email // ignore: cast_nullable_to_non_nullable
                        as String,
            empCode:
                freezed == empCode
                    ? _value.empCode
                    : empCode // ignore: cast_nullable_to_non_nullable
                        as String?,
            designation:
                freezed == designation
                    ? _value.designation
                    : designation // ignore: cast_nullable_to_non_nullable
                        as String?,
            region:
                freezed == region
                    ? _value.region
                    : region // ignore: cast_nullable_to_non_nullable
                        as String?,
            reportingManager:
                freezed == reportingManager
                    ? _value.reportingManager
                    : reportingManager // ignore: cast_nullable_to_non_nullable
                        as String?,
            otp:
                freezed == otp
                    ? _value.otp
                    : otp // ignore: cast_nullable_to_non_nullable
                        as String?,
            authToken:
                freezed == authToken
                    ? _value.authToken
                    : authToken // ignore: cast_nullable_to_non_nullable
                        as String?,
            empIsDeleted:
                null == empIsDeleted
                    ? _value.empIsDeleted
                    : empIsDeleted // ignore: cast_nullable_to_non_nullable
                        as int,
            status:
                null == status
                    ? _value.status
                    : status // ignore: cast_nullable_to_non_nullable
                        as int,
            createdAt:
                freezed == createdAt
                    ? _value.createdAt
                    : createdAt // ignore: cast_nullable_to_non_nullable
                        as String?,
            updatedAt:
                freezed == updatedAt
                    ? _value.updatedAt
                    : updatedAt // ignore: cast_nullable_to_non_nullable
                        as String?,
            deletedAt:
                freezed == deletedAt
                    ? _value.deletedAt
                    : deletedAt // ignore: cast_nullable_to_non_nullable
                        as String?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$AuthResultImplCopyWith<$Res>
    implements $AuthResultCopyWith<$Res> {
  factory _$$AuthResultImplCopyWith(
    _$AuthResultImpl value,
    $Res Function(_$AuthResultImpl) then,
  ) = __$$AuthResultImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    @JsonKey(name: 'emp_id') int empId,
    @JsonKey(name: 'business_id') int businessId,
    @JsonKey(name: 'role_id') int roleId,
    String name,
    @JsonKey(name: 'emp_phone') String empPhone,
    String email,
    @JsonKey(name: 'emp_code') String? empCode,
    String? designation,
    String? region,
    @JsonKey(name: 'reporting_manager') String? reportingManager,
    String? otp,
    @JsonKey(name: 'auth_token') String? authToken,
    @JsonKey(name: 'emp_is_deleted') int empIsDeleted,
    int status,
    @JsonKey(name: 'created_at') String? createdAt,
    @JsonKey(name: 'updated_at') String? updatedAt,
    @JsonKey(name: 'deleted_at') String? deletedAt,
  });
}

/// @nodoc
class __$$AuthResultImplCopyWithImpl<$Res>
    extends _$AuthResultCopyWithImpl<$Res, _$AuthResultImpl>
    implements _$$AuthResultImplCopyWith<$Res> {
  __$$AuthResultImplCopyWithImpl(
    _$AuthResultImpl _value,
    $Res Function(_$AuthResultImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of AuthResult
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? empId = null,
    Object? businessId = null,
    Object? roleId = null,
    Object? name = null,
    Object? empPhone = null,
    Object? email = null,
    Object? empCode = freezed,
    Object? designation = freezed,
    Object? region = freezed,
    Object? reportingManager = freezed,
    Object? otp = freezed,
    Object? authToken = freezed,
    Object? empIsDeleted = null,
    Object? status = null,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? deletedAt = freezed,
  }) {
    return _then(
      _$AuthResultImpl(
        empId:
            null == empId
                ? _value.empId
                : empId // ignore: cast_nullable_to_non_nullable
                    as int,
        businessId:
            null == businessId
                ? _value.businessId
                : businessId // ignore: cast_nullable_to_non_nullable
                    as int,
        roleId:
            null == roleId
                ? _value.roleId
                : roleId // ignore: cast_nullable_to_non_nullable
                    as int,
        name:
            null == name
                ? _value.name
                : name // ignore: cast_nullable_to_non_nullable
                    as String,
        empPhone:
            null == empPhone
                ? _value.empPhone
                : empPhone // ignore: cast_nullable_to_non_nullable
                    as String,
        email:
            null == email
                ? _value.email
                : email // ignore: cast_nullable_to_non_nullable
                    as String,
        empCode:
            freezed == empCode
                ? _value.empCode
                : empCode // ignore: cast_nullable_to_non_nullable
                    as String?,
        designation:
            freezed == designation
                ? _value.designation
                : designation // ignore: cast_nullable_to_non_nullable
                    as String?,
        region:
            freezed == region
                ? _value.region
                : region // ignore: cast_nullable_to_non_nullable
                    as String?,
        reportingManager:
            freezed == reportingManager
                ? _value.reportingManager
                : reportingManager // ignore: cast_nullable_to_non_nullable
                    as String?,
        otp:
            freezed == otp
                ? _value.otp
                : otp // ignore: cast_nullable_to_non_nullable
                    as String?,
        authToken:
            freezed == authToken
                ? _value.authToken
                : authToken // ignore: cast_nullable_to_non_nullable
                    as String?,
        empIsDeleted:
            null == empIsDeleted
                ? _value.empIsDeleted
                : empIsDeleted // ignore: cast_nullable_to_non_nullable
                    as int,
        status:
            null == status
                ? _value.status
                : status // ignore: cast_nullable_to_non_nullable
                    as int,
        createdAt:
            freezed == createdAt
                ? _value.createdAt
                : createdAt // ignore: cast_nullable_to_non_nullable
                    as String?,
        updatedAt:
            freezed == updatedAt
                ? _value.updatedAt
                : updatedAt // ignore: cast_nullable_to_non_nullable
                    as String?,
        deletedAt:
            freezed == deletedAt
                ? _value.deletedAt
                : deletedAt // ignore: cast_nullable_to_non_nullable
                    as String?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$AuthResultImpl extends _AuthResult {
  const _$AuthResultImpl({
    @JsonKey(name: 'emp_id') this.empId = 0,
    @JsonKey(name: 'business_id') this.businessId = 0,
    @JsonKey(name: 'role_id') this.roleId = 0,
    this.name = '',
    @JsonKey(name: 'emp_phone') this.empPhone = '',
    this.email = '',
    @JsonKey(name: 'emp_code') this.empCode,
    this.designation,
    this.region,
    @JsonKey(name: 'reporting_manager') this.reportingManager,
    this.otp,
    @JsonKey(name: 'auth_token') this.authToken,
    @JsonKey(name: 'emp_is_deleted') this.empIsDeleted = 0,
    this.status = 0,
    @JsonKey(name: 'created_at') this.createdAt,
    @JsonKey(name: 'updated_at') this.updatedAt,
    @JsonKey(name: 'deleted_at') this.deletedAt,
  }) : super._();

  factory _$AuthResultImpl.fromJson(Map<String, dynamic> json) =>
      _$$AuthResultImplFromJson(json);

  @override
  @JsonKey(name: 'emp_id')
  final int empId;
  @override
  @JsonKey(name: 'business_id')
  final int businessId;
  @override
  @JsonKey(name: 'role_id')
  final int roleId;
  @override
  @JsonKey()
  final String name;
  @override
  @JsonKey(name: 'emp_phone')
  final String empPhone;
  @override
  @JsonKey()
  final String email;
  @override
  @JsonKey(name: 'emp_code')
  final String? empCode;
  @override
  final String? designation;
  @override
  final String? region;
  @override
  @JsonKey(name: 'reporting_manager')
  final String? reportingManager;
  @override
  final String? otp;
  @override
  @JsonKey(name: 'auth_token')
  final String? authToken;
  @override
  @JsonKey(name: 'emp_is_deleted')
  final int empIsDeleted;
  @override
  @JsonKey()
  final int status;
  @override
  @JsonKey(name: 'created_at')
  final String? createdAt;
  @override
  @JsonKey(name: 'updated_at')
  final String? updatedAt;
  @override
  @JsonKey(name: 'deleted_at')
  final String? deletedAt;

  @override
  String toString() {
    return 'AuthResult(empId: $empId, businessId: $businessId, roleId: $roleId, name: $name, empPhone: $empPhone, email: $email, empCode: $empCode, designation: $designation, region: $region, reportingManager: $reportingManager, otp: $otp, authToken: $authToken, empIsDeleted: $empIsDeleted, status: $status, createdAt: $createdAt, updatedAt: $updatedAt, deletedAt: $deletedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AuthResultImpl &&
            (identical(other.empId, empId) || other.empId == empId) &&
            (identical(other.businessId, businessId) ||
                other.businessId == businessId) &&
            (identical(other.roleId, roleId) || other.roleId == roleId) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.empPhone, empPhone) ||
                other.empPhone == empPhone) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.empCode, empCode) || other.empCode == empCode) &&
            (identical(other.designation, designation) ||
                other.designation == designation) &&
            (identical(other.region, region) || other.region == region) &&
            (identical(other.reportingManager, reportingManager) ||
                other.reportingManager == reportingManager) &&
            (identical(other.otp, otp) || other.otp == otp) &&
            (identical(other.authToken, authToken) ||
                other.authToken == authToken) &&
            (identical(other.empIsDeleted, empIsDeleted) ||
                other.empIsDeleted == empIsDeleted) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.deletedAt, deletedAt) ||
                other.deletedAt == deletedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    empId,
    businessId,
    roleId,
    name,
    empPhone,
    email,
    empCode,
    designation,
    region,
    reportingManager,
    otp,
    authToken,
    empIsDeleted,
    status,
    createdAt,
    updatedAt,
    deletedAt,
  );

  /// Create a copy of AuthResult
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AuthResultImplCopyWith<_$AuthResultImpl> get copyWith =>
      __$$AuthResultImplCopyWithImpl<_$AuthResultImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AuthResultImplToJson(this);
  }
}

abstract class _AuthResult extends AuthResult {
  const factory _AuthResult({
    @JsonKey(name: 'emp_id') final int empId,
    @JsonKey(name: 'business_id') final int businessId,
    @JsonKey(name: 'role_id') final int roleId,
    final String name,
    @JsonKey(name: 'emp_phone') final String empPhone,
    final String email,
    @JsonKey(name: 'emp_code') final String? empCode,
    final String? designation,
    final String? region,
    @JsonKey(name: 'reporting_manager') final String? reportingManager,
    final String? otp,
    @JsonKey(name: 'auth_token') final String? authToken,
    @JsonKey(name: 'emp_is_deleted') final int empIsDeleted,
    final int status,
    @JsonKey(name: 'created_at') final String? createdAt,
    @JsonKey(name: 'updated_at') final String? updatedAt,
    @JsonKey(name: 'deleted_at') final String? deletedAt,
  }) = _$AuthResultImpl;
  const _AuthResult._() : super._();

  factory _AuthResult.fromJson(Map<String, dynamic> json) =
      _$AuthResultImpl.fromJson;

  @override
  @JsonKey(name: 'emp_id')
  int get empId;
  @override
  @JsonKey(name: 'business_id')
  int get businessId;
  @override
  @JsonKey(name: 'role_id')
  int get roleId;
  @override
  String get name;
  @override
  @JsonKey(name: 'emp_phone')
  String get empPhone;
  @override
  String get email;
  @override
  @JsonKey(name: 'emp_code')
  String? get empCode;
  @override
  String? get designation;
  @override
  String? get region;
  @override
  @JsonKey(name: 'reporting_manager')
  String? get reportingManager;
  @override
  String? get otp;
  @override
  @JsonKey(name: 'auth_token')
  String? get authToken;
  @override
  @JsonKey(name: 'emp_is_deleted')
  int get empIsDeleted;
  @override
  int get status;
  @override
  @JsonKey(name: 'created_at')
  String? get createdAt;
  @override
  @JsonKey(name: 'updated_at')
  String? get updatedAt;
  @override
  @JsonKey(name: 'deleted_at')
  String? get deletedAt;

  /// Create a copy of AuthResult
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AuthResultImplCopyWith<_$AuthResultImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
