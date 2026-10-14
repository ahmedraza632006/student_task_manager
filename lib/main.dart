import 'package:flutter/material.dart';

void main() {
  runApp(const StudentTaskManagerApp());
}

const Color primaryColor = Color(0xFF5146E5);
const Color darkColor = Color(0xFF202044);
const Color backgroundColor = Color(0xFFF6F7FB);

class StudentTaskManagerApp extends StatelessWidget {
const StudentTaskManagerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Student Task Manager',
      theme: ThemeData(
        useMaterial3: true,
        scaffoldBackgroundColor: backgroundColor,
        colorScheme: ColorScheme.fromSeed(seedColor: primaryColor),
        appBarTheme: const AppBarTheme(
          backgroundColor: backgroundColor,
          foregroundColor: darkColor,
          elevation: 0,
          centerTitle: false,
        ),
        inputDecorationTheme: InputDecorationTheme(
          filled: true,
          fillColor: Colors.white,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(14),
            borderSide: BorderSide.none,
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(14),
            borderSide: const BorderSide(color: Color(0xFFE7E8F0)),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(14),
            borderSide: const BorderSide(
              color: primaryColor,
              width: 1.5,
            ),
          ),
        ),
      ),
      home: const WelcomePage(),
    );
  }
}
}

class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _fadeAnimation;
  late final Animation<Offset> _slideAnimation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      duration: const Duration(milliseconds: 900),
      vsync: this,
    );

    _fadeAnimation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeIn,
    );

    _slideAnimation = Tween<Offset>(
      begin: const Offset(0, 0.12),
      end: Offset.zero,
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeOutCubic,
      ),
    );

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color(0xFFF7F6FF),
              Color(0xFFEEEAFE),
              Colors.white,
            ],
          ),
        ),
        child: SafeArea(
          child: FadeTransition(
            opacity: _fadeAnimation,
            child: SlideTransition(
              position: _slideAnimation,
              child: Stack(
                children: [
                  Positioned(
                    top: -55,
                    right: -45,
                    child: Container(
                      height: 180,
                      width: 180,
                      decoration: BoxDecoration(
                        color: const Color(0xFFDCD8FF)
                            .withValues(alpha: 0.55),
                        shape: BoxShape.circle,
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 100,
                    left: -65,
                    child: Container(
                      height: 145,
                      width: 145,
                      decoration: BoxDecoration(
                        color: const Color(0xFFE6F7F2)
                            .withValues(alpha: 0.8),
                        shape: BoxShape.circle,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(
                      26, 20, 26, 18,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Container(
                              padding: const EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(14),
                                boxShadow: const [
                                  BoxShadow(
                                    color: Color(0x14000000),
                                    blurRadius: 16,
                                    offset: Offset(0, 5),
                                  ),
                                ],
                              ),
                              child: const Icon(
                                Icons.checklist_rounded,
                                color: primaryColor,
                                size: 25,
                              ),
                            ),
                            const SizedBox(width: 10),
                            const Text(
                              'STUDYFLOW',
                              style: TextStyle(
                                color: darkColor,
                                fontSize: 13,
                                fontWeight: FontWeight.w800,
                                letterSpacing: 2,
                              ),
                            ),
                          ],
                        ),
                        const Spacer(),
                        Center(
                          child: Container(
                            height: 220,
                            width: 220,
                            decoration: BoxDecoration(
                              gradient: const LinearGradient(
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                                colors: [
                                  Color(0xFF7770F2),
                                  primaryColor,
                                ],
                              ),
                              borderRadius: BorderRadius.circular(56),
                              boxShadow: const [
                                BoxShadow(
                                  color: Color(0x333F35C9),
                                  blurRadius: 30,
                                  offset: Offset(0, 16),
                                ),
                              ],
                            ),
                            child: Stack(
                              alignment: Alignment.center,
                              children: [
                                Positioned(
                                  top: 24,
                                  right: 25,
                                  child: Icon(
                                    Icons.auto_awesome_rounded,
                                    color: Colors.white
                                        .withValues(alpha: 0.8),
                                    size: 28,
                                  ),
                                ),
                                Container(
                                  height: 135,
                                  width: 135,
                                  decoration: BoxDecoration(
                                    color: Colors.white
                                        .withValues(alpha: 0.16),
                                    borderRadius:
                                    BorderRadius.circular(32),
                                    border: Border.all(
                                      color: Colors.white
                                          .withValues(alpha: 0.35),
                                      width: 1.5,
                                    ),
                                  ),
                                  child: const Icon(
                                    Icons.task_alt_rounded,
                                    color: Colors.white,
                                    size: 88,
                                  ),
                                ),
                                Positioned(
                                  bottom: 24,
                                  left: 25,
                                  child: Container(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 12,
                                      vertical: 8,
                                    ),
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius:
                                      BorderRadius.circular(20),
                                    ),
                                    child: const Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Icon(
                                          Icons.check_circle_rounded,
                                          color: Color(0xFF159B74),
                                          size: 16,
                                        ),
                                        SizedBox(width: 5),
                                        Text(
                                          'Stay on track',
                                          style: TextStyle(
                                            color: darkColor,
                                            fontSize: 11,
                                            fontWeight: FontWeight.w700,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(height: 32),
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 12,
                            vertical: 7,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.white.withValues(alpha: 0.82),
                            borderRadius: BorderRadius.circular(30),
                            border: Border.all(
                              color: const Color(0xFFE4E1FF),
                            ),
                          ),
                          child: const Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(
                                Icons.auto_awesome_rounded,
                                size: 15,
                                color: primaryColor,
                              ),
                              SizedBox(width: 7),
                              Text(
                                'YOUR PERSONAL STUDY PLANNER',
                                style: TextStyle(
                                  fontSize: 10,
                                  letterSpacing: 1,
                                  fontWeight: FontWeight.w800,
                                  color: primaryColor,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 14),
                        const Text(
                          'Your goals.\nYour pace.\nYour success.',
                          style: TextStyle(
                            color: darkColor,
                            fontSize: 35,
                            height: 1.12,
                            fontWeight: FontWeight.w800,
                            letterSpacing: -0.8,
                          ),
                        ),
                        const SizedBox(height: 14),
                        const Text(
                          'Keep assignments organized, set priorities, '
                              'and never lose track of a deadline.',
                          style: TextStyle(
                            fontSize: 15,
                            height: 1.55,
                            color: Color(0xFF696981),
                          ),
                        ),
                        const SizedBox(height: 22),
                        const Row(
                          children: [
                            _WelcomeFeature(
                              icon: Icons.flag_rounded,
                              label: 'Priorities',
                            ),
                            SizedBox(width: 16),
                            _WelcomeFeature(
                              icon: Icons.calendar_month_rounded,
                              label: 'Due dates',
                            ),
                          ],
                        ),
                        const Spacer(),
                        SizedBox(
                          width: double.infinity,
                          height: 58,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: primaryColor,
                              foregroundColor: Colors.white,
                              elevation: 4,
                              shadowColor:
                              primaryColor.withValues(alpha: 0.3),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(18),
                              ),
                            ),
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                  const LoginPage(),
                                ),
                              );
                            },
                            child: const Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Get Started',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                                SizedBox(width: 10),
                                Icon(
                                  Icons.arrow_forward_rounded,
                                  size: 20,
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(height: 14),
                        const Center(
                          child: Text(
                            'A LITTLE PROGRESS EVERY DAY',
                            style: TextStyle(
                              letterSpacing: 1.6,
                              fontSize: 10,
                              color: Colors.black45,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _WelcomeFeature extends StatelessWidget {
  const _WelcomeFeature({
    required this.icon,
    required this.label,
  });

  final IconData icon;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, color: primaryColor, size: 18),
        const SizedBox(width: 6),
        Text(
          label,
          style: const TextStyle(
            color: darkColor,
            fontSize: 12,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }
}