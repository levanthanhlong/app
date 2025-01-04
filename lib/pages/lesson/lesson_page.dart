import 'package:app/model/lesson.dart';
import 'package:app/pages/question/question_page.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:chewie/chewie.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/lesson_detail_bloc.dart';

class LessonPage extends StatefulWidget {
  static const routeName = '/lesson';

  const LessonPage({super.key});

  @override
  State<LessonPage> createState() => _LessonPageState();
}

class _LessonPageState extends State<LessonPage> {
  late VideoPlayerController _controller;
  late ChewieController _chewieController;
  bool _isVideoInitialized = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final lessonId = ModalRoute.of(context)!.settings.arguments as int;
    // Dispatch event to load lesson details
    context.read<LessonDetailBloc>().add(GetLessonDetailEvent(lessonId));
  }

  @override
  void dispose() {
    _controller.dispose();
    _chewieController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lesson Details'),
      ),
      body: BlocBuilder<LessonDetailBloc, LessonDetailState>(
        builder: (context, state) {
          if (state is LessonDetailLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is LessonDetailError) {
            return Center(child: Text('Error: ${state.error}'));
          } else if (state is GetLessonDetailSuccess) {
            final lesson = state.lesson;
            String videoUrl = lesson.videoUrl;

            if (!_isVideoInitialized) {
              _controller = VideoPlayerController.network(videoUrl)
                ..initialize().then((_) {
                  setState(() {
                    _isVideoInitialized = true;
                    _chewieController = ChewieController(
                      videoPlayerController: _controller,
                      aspectRatio: 16 / 9,
                      autoPlay: true,
                      zoomAndPan: true,
                      looping: false,
                    );
                  });
                });
            }

            return Column(
              children: [
                Text(lesson.lessonDescribe),
                const SizedBox(height: 100),
                Center(
                  child: _isVideoInitialized
                      ? Column(
                          children: [
                            SizedBox(
                              height: 260,
                              child: Chewie(controller: _chewieController),
                            ),
                            const SizedBox(height: 200),
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.grey[400],
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 50, vertical: 20),
                                  elevation: 10),
                              onPressed: () {
                                selectedQuestionInLesson(context, lesson);
                              },
                              child: const Text(
                                "Practice",
                                style: TextStyle(
                                    color: Colors.red,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ],
                        )
                      : const CircularProgressIndicator(),
                ),
                const SizedBox(height: 50),
              ],
            );
          }
          return const Center(child: Text('Unknown state'));
        },
      ),
    );
  }

  void selectedQuestionInLesson(BuildContext context, Lesson lesson) {
    Navigator.of(context)
        .pushNamed(QuestionPage.routeName, arguments: lesson.id);
  }
}
