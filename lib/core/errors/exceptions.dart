
abstract class CustomException implements Exception{
final String errorMessage;

const CustomException(this.errorMessage);
}
class ServerException extends CustomException{
  const ServerException(super.errorMessage);

}
class PermissionException extends CustomException{
  const PermissionException(super.errorMessage);

}