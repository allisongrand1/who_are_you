typedef Routes = ({String path, String name});

class AppRoutes {
  static Routes home = (path: '/', name: 'home');

  static Routes faceAttributes = (path: '/attributes', name: 'face_attributes');

  static Routes twoFaces = (path: '/two_faces', name: 'two_faces');
}
