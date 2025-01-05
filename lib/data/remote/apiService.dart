import 'package:dio/dio.dart';

class ApiService {
  static const baseUrl = 'http://10.0.2.2:8888/api';
  final Dio _dio;

  ApiService()
      : _dio = Dio(BaseOptions(
          baseUrl: baseUrl,
          connectTimeout: const Duration(seconds: 3),
          receiveTimeout: const Duration(seconds: 3),
          headers: {
            'Content-Type': 'application/json',
          },
          validateStatus: (status) {
            // Chấp nhận mọi mã trạng thái từ 200 đến 499 (bao gồm cả 400)
            return status! < 500;
          },
        )) {
    _dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) {
          print("Request URL: ${options.uri}");
          print("Request Method: ${options.method}");
          print("Request Headers: ${options.headers}");
          print("Request Data: ${options.data}");
          return handler.next(options); // Tiếp tục xử lý request
        },
        onResponse: (response, handler) {
          print("Response Data: ${response.data}");
          return handler.next(response); // Tiếp tục xử lý response
        },
        onError: (error, handler) {
          print("Error: ${error.message}");
          return handler.next(error); // Tiếp tục xử lý error
        },
      ),
    );
  }

  // Đăng nhập
  Future<Map<String, dynamic>> login(String username, String password) async {
    try {
      final response = await _dio.post(
        '$baseUrl/auth/login',
        data: {
          "username": username,
          "password": password,
        }, // Endpoint đăng nhập
      );
      Map<String, dynamic> data = response.data;
      print(data);
      return data;
    } on DioException catch (e) {
      print("error: ${e.message}");
      return {"status": 0, "message": "connect error"};
    }
  }

  // Đăng ký
  Future<Map<String, dynamic>> register({
    required String username,
    required String password,
    required String email,
    required String fullName,
  }) async {
    try {
      final response = await _dio.post(
        '$baseUrl/auth/register', // Endpoint đăng ký
        data: {
          'username': username,
          'password': password,
          'email': email,
          'fullname': fullName,
        },
      );
      Map<String, dynamic> data = response.data;
      print(data);
      return data;
    } on DioException catch (e) {
      print("error: ${e.message}");
      return {"status": 0, "message": "connect error"};
    }
  }

  // Get all Courses
  Future<Map<String, dynamic>> getAllCourses() async {
    try {
      final response = await _dio.get(
        '$baseUrl/course/getAllCourses',
      );
      Map<String, dynamic> data = response.data;
      return data;
    } on DioException catch (e) {
      print("error: ${e.message}");
      return {"status": 0, "message": "connect error"};
    }
  }

  // Get detail Course
  Future<Map<String, dynamic>> getDetailCourse(int id) async {
    try {
      final response =
          await _dio.get('$baseUrl/course/getCourseInfo', data: {"id": id});
      Map<String, dynamic> data = response.data;
      return data;
    } on DioException catch (e) {
      print("error: ${e.message}");
      return {"status": 0, "message": "connect error"};
    }
  }

  // Get all lesson in Course
  Future<Map<String, dynamic>> getAllLessonInCourse(int courseId) async {
    try {
      final response = await _dio.get('$baseUrl/lesson/getAllLessonInCourse',
          data: {"courseId": courseId});
      Map<String, dynamic> data = response.data;
      return data;
    } on DioException catch (e) {
      print("error: ${e.message}");
      return {"status": 0, "message": "connect error"};
    }
  }

  // Get lesson detail info
  Future<Map<String, dynamic>> getLessonInfo(int id) async {
    try {
      final response =
          await _dio.get('$baseUrl/lesson/getLessonInfo', data: {"id": id});
      Map<String, dynamic> data = response.data;
      return data;
    } on DioException catch (e) {
      print("error: ${e.message}");
      return {"status": 0, "message": "connect error"};
    }
  }

  // Get question in lesson
  Future<Map<String, dynamic>> getQuestionsInLesson(int lessonId) async {
    try {
      final response = await _dio.get('$baseUrl/question/getQuestionsInLesson',
          data: {"lessonId": lessonId});
      Map<String, dynamic> data = response.data;
      return data;
    } on DioException catch (e) {
      print("error: ${e.message}");
      return {"status": 0, "message": "connect error"};
    }
  }

  // Get list user register course
  Future<Map<String, dynamic>> checkRegisterCourse(
      String token, int courseId) async {
    try {
      final response = await _dio.get(
          '$baseUrl/userAndCourse/checkRegisterCourse',
          data: {"token": token, "courseId": courseId});
      Map<String, dynamic> data = response.data;
      return data;
    } on DioException catch (e) {
      print("error: ${e.message}");
      return {"status": 0, "message": "connect error"};
    }
  }

  // Register course
  Future<Map<String, dynamic>> registerCourse(
      String token, int courseId) async {
    try {
      final response = await _dio.post(
          '$baseUrl/userAndCourse/addUserAndCourse',
          data: {"token": token, "courseId": courseId});
      Map<String, dynamic> data = response.data;
      return data;
    } on DioException catch (e) {
      print("error: ${e.message}");
      return {"status": 0, "message": "connect error"};
    }
  }

  // Get courses by category
  Future<Map<String, dynamic>> getCoursesByCategory(String category) async {
    try {
      final response = await _dio.get('$baseUrl/course/getCoursesByCategory',
          data: {"category": category});
      Map<String, dynamic> data = response.data;
      return data;
    } on DioException catch (e) {
      print("error: ${e.message}");
      return {"status": 0, "message": "connect error"};
    }
  }

  // get new courses
  Future<Map<String, dynamic>> getNewCourses() async {
    try {
      final response = await _dio.get('$baseUrl/course/getNewCourses');
      Map<String, dynamic> data = response.data;
      return data;
    } on DioException catch (e) {
      print("error: ${e.message}");
      return {"status": 0, "message": "connect error"};
    }
  }

  // Get user info
  Future<Map<String, dynamic>> getUserInfo(String token) async {
    try {
      final response =
          await _dio.get('$baseUrl/user/getUserInfo', data: {"token": token});
      Map<String, dynamic> data = response.data;
      return data;
    } on DioException catch (e) {
      print("error: ${e.message}");
      return {"status": 0, "message": "connect error"};
    }
  }

  // search course
  Future<Map<String, dynamic>> getSearchCourses(String text) async {
    try {
      final response = await _dio
          .get('$baseUrl/course/getSearchCourses', data: {"text": text});
      Map<String, dynamic> data = response.data;
      return data;
    } on DioException catch (e) {
      print("error: ${e.message}");
      return {"status": 0, "message": "connect error"};
    }
  }
}
