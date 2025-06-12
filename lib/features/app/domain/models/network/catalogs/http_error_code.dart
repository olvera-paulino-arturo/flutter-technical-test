enum HttpErrorCode {
  badRequest(400),
  unauthorized(401),
  notFound(404),
  methodNotAllowed(405),
  internalServerError(500);

  final int code;
  const HttpErrorCode(this.code);
}