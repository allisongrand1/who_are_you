import 'package:who_are_you/data/models/face_detection/face.dart';
import 'package:who_are_you/data/models/face_detection/face_age.dart';
import 'package:who_are_you/data/models/face_detection/face_attributes.dart';
import 'package:who_are_you/data/models/face_detection/face_detection_response.dart';
import 'package:who_are_you/data/models/face_detection/face_emotion.dart';
import 'package:who_are_you/data/models/face_detection/face_gender.dart';
import 'package:who_are_you/data/models/face_detection/face_rectangle.dart';
import 'package:who_are_you/domain/models/face_detection/age.dart';
import 'package:who_are_you/domain/models/face_detection/attributes.dart';
import 'package:who_are_you/domain/models/face_detection/emotion.dart';
import 'package:who_are_you/domain/models/face_detection/face.dart';
import 'package:who_are_you/domain/models/face_detection/face_detection.dart';
import 'package:who_are_you/domain/models/face_detection/gender.dart';
import 'package:who_are_you/domain/models/face_detection/rectangle.dart';

extension FaceDetectionResponseMapper on FaceDetectionResponse {
  FaceDetection toEntity() {
    return FaceDetection(
      requestId: requestId,
      timeUsed: timeUsed,
      faces: faces.toListEntity(),
      imageId: imageId,
      faceNum: faceNum,
    );
  }
}

extension FaceDetectionMapper on List<FaceModel> {
  List<Face> toListEntity() {
    return map((e) => e.toEntity()).toList(growable: false);
  }
}

extension FaceMapper on FaceModel {
  Face toEntity() {
    return Face(
      faceToken: faceToken,
      faceRectangle: faceRectangle.toEntity(),
      attributes: attributes.toEntity(),
    );
  }
}

extension FaceRectangleMapper on FaceRectangle {
  Rectangle toEntity() {
    return Rectangle(
      top: top,
      left: left,
      width: width,
      height: height,
    );
  }
}

extension FaceAttributesMapper on FaceAttributes {
  Attributes toEntity() {
    return Attributes(
      gender: gender.toEntity(),
      age: age.toEntity(),
      emotion: emotion.toEntity(),
    );
  }
}

extension FaceGenderMapper on FaceGender {
  Gender toEntity() {
    return Gender(value: value);
  }
}

extension FaceAgeMapper on FaceAge {
  Age toEntity() {
    return Age(value: value);
  }
}

extension FaceEmotionMapper on FaceEmotion {
  Emotion toEntity() {
    return Emotion(
      anger: anger,
      disgust: disgust,
      fear: fear,
      happiness: happiness,
      neutral: neutral,
      sadness: sadness,
      surprise: surprise,
    );
  }
}
