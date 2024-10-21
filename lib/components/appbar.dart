import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_framework/responsive_framework.dart';

import 'colors.dart';

class MinimalMenuBar extends StatelessWidget {
  const MinimalMenuBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      // mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          margin: const EdgeInsets.symmetric(vertical: 30),
          child: Row(
            children: [
              InkWell(
                hoverColor: Colors.transparent,
                highlightColor: Colors.transparent,
                splashColor: Colors.transparent,
                onTap: () => Navigator.pushNamedAndRemoveUntil(
                    context,
                    Navigator.defaultRouteName,
                    ModalRoute.withName(Navigator.defaultRouteName)),
                child: Text("MINIMAL",
                    style: GoogleFonts.montserrat(
                        color: textPrimary,
                        fontSize: 30,
                        letterSpacing: 3,
                        fontWeight: FontWeight.w500)),
              ),
              if (ResponsiveBreakpoints.of(context).isMobile) ...[
                const Spacer(),
                Transform.translate(
                  offset: const Offset(16, 0),
                  child: IconButton(
                    icon: const Icon(Icons.menu),
                    onPressed: () {},
                  ),
                )
              ] else
                Flexible(
                  child: Container(
                    alignment: Alignment.centerRight,
                    child: Wrap(
                      children: [
                        TextButton(
                          onPressed: () => Navigator.pushNamedAndRemoveUntil(
                              context,
                              Navigator.defaultRouteName,
                              ModalRoute.withName(Navigator.defaultRouteName)),
                          style: menuButtonStyle,
                          child: const Text(
                            "HOME",
                          ),
                        ),
                        TextButton(
                          onPressed: () {},
                          style: menuButtonStyle,
                          child: const Text(
                            "PORTFOLIO",
                          ),
                        ),
                        TextButton(
                          onPressed: (){},

                          style: menuButtonStyle,
                          child: const Text(
                            "STYLE",
                          ),
                        ),
                        TextButton(
                          onPressed: () {},
                          style: menuButtonStyle,
                          child: const Text(
                            "ABOUT",
                          ),
                        ),
                        TextButton(
                          onPressed: () {},
                          style: menuButtonStyle,
                          child: const Text(
                            "CONTACT",
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
            ],
          ),
        ),
        Container(
            height: 1,
            margin: const EdgeInsets.only(bottom: 30),
            color: const Color(0xFFEEEEEE)),
      ],
    );
  }
}