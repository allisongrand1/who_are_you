typedef ExtensionMessage = ({String code, String message});

class ExtensionMessages {
  static const ExtensionMessage invalidFaceToken = (
    code: 'INVALID_FACE_TOKEN',
    message: 'face_token не может быть найден',
  );
  static const ExtensionMessage imageErrorUnsupportedFormat = (
    code: 'IMAGE_ERROR_UNSUPPORTED_FORMAT',
    message: 'Возможно, формат файла не поддерживается или файл поврежден.',
  );
  static const ExtensionMessage invalidImageSize = (
    code: 'INVALID_IMAGE_SIZE',
    message: 'Cлишком большой размер изображения',
  );
  static const ExtensionMessage invalidImageUrl = (
    code: 'INVALID_IMAGE_URL',
    message: 'URL-адрес изображения неверный или недопустимый',
  );
  static const ExtensionMessage imageFileTooLarge = (
    code: 'IMAGE_FILE_TOO_LARGE',
    message:
        'Файл изображения слишком велик. Для этого API требуется, чтобы размер файла изображения был не более 2 МБ.',
  );
  static const ExtensionMessage imageDownloadTimeOut = (
    code: 'IMAGE_DOWNLOAD_TIMEOUT',
    message: 'Время ожидания загрузки изображения превышено',
  );
  static const ExtensionMessage authenticationError = (
    code: 'AUTHENTICATION_ERROR',
    message: 'api_key и api_secret не совпадают',
  );
  static const ExtensionMessage authorizationError = (
    code: 'AUTHORIZATION_ERROR',
    message: 'api_key не имеет разрешения на вызов этого API',
  );
  static const ExtensionMessage concurrencyLimitExceeded = (
    code: 'CONCURRENCY_LIMIT_EXCEEDED',
    message: 'Превышен лимит скорости для этого ключа API.',
  );
  static const ExtensionMessage missingArguments = (
    code: 'MISSING_ARGUMENTS',
    message: 'Пропущены некоторые обязательные аргументы.',
  );
  static const ExtensionMessage badArguments = (
    code: 'BAD_ARGUMENTS',
    message:
        'Ошибка при анализе некоторых аргументов. Эта ошибка может быть вызвана неправильным типом или длиной аргумента.',
  );
  static const ExtensionMessage coexistenceArguments = (
    code: 'COEXISTENCE_ARGUMENTS',
    message: 'Передано несколько аргументов, которым запрещено сосуществовать.',
  );
  static const ExtensionMessage requestEntityTooLarge = (
    code: 'Request Entity Too Large',
    message: 'Объект запроса превысил лимит (2 МБ).',
  );
  static const ExtensionMessage apiNotFound = (
    code: 'API_NOT_FOUND',
    message: 'Запрошенный API не может быть найден.',
  );
  static const ExtensionMessage internalError = (
    code: 'INTERNAL_ERROR',
    message: 'Внутренняя ошибка. Пожалуйста, повторите запрос.',
  );
  static const ExtensionMessage unknownError = (
    code: 'UNKNOWN_ERROR',
    message: 'Неизвестная ошибка. Пожалуйста, повторите запрос.',
  );
  final List<ExtensionMessage> _messages = [
    invalidFaceToken,
    imageErrorUnsupportedFormat,
    invalidImageSize,
    invalidImageUrl,
    imageFileTooLarge,
    imageDownloadTimeOut,
    authenticationError,
    authorizationError,
    concurrencyLimitExceeded,
    missingArguments,
    badArguments,
    coexistenceArguments,
    requestEntityTooLarge,
    apiNotFound,
    internalError,
    unknownError,
  ];

  String getExtensionMessage(String code) => _messages
      .firstWhere(
        (element) => code.contains(element.code),
        orElse: () => unknownError,
      )
      .message;
}
