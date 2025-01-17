import 'package:dartz/dartz.dart';
import 'package:google_generative_ai/google_generative_ai.dart';

class HomeRepo {
  final String apiKey = '';
  Future<Either<String, String>> getData({required String prompt}) async {
    try {
      final model = GenerativeModel(
        model: 'gemini-1.5-flash-latest',
        apiKey: apiKey,
      );
      final content = [Content.text(prompt)];
      final response = await model.generateContent(content);
      return Right(response.text.toString());
    } catch (e) {
      return Left(e.toString());
    }
  }
}
