import 'package:absher_app/core/styles/app_text_styles.dart';
import 'package:flutter/material.dart';

class AboutScreenBody extends StatelessWidget {
  const AboutScreenBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: SingleChildScrollView(
        child: RichText(
          text: TextSpan(
            style: TextStyle(
              fontSize: 16,
              color: Colors.black,
              height: 1.5,
            ),
            children: [
              TextSpan(
                text: '▫ من نحن...؟\n',
                style: AppTextStyles.title28Brown,
              ),
              TextSpan(
                text:
                    '• نحن تطبيق إلكتروني متخصص في تفسير الرؤى والأحلام وفق نهج النبي صَلَّ اللَّهُ عَلَيْهِ وَسَلَّمَ.\n',
              ),
              TextSpan(
                text:
                    '• يضم التطبيق نخبة مختارة من المعبّرين المتميزين الملتزمين بمنهج أهل السنة والجماعة.\n',
              ),
              TextSpan(
                text:
                    '• هدفنا تقديم تفسير للرؤى بما يحقق النفع للرائي في دينه ودنياه بالإضافة إلى نصح الرائي وتنبيهه لما فيه خير في دينه ودنياه مع الالتزام بهدي النبي صَلَّ اللَّهُ عَلَيْهِ وَسَلَّمَ.\n\n',
              ),
              TextSpan(
                text: 'كما ورد في الحديث الشريف:\n',
                style: TextStyle(decoration: TextDecoration.underline),
              ),
              TextSpan(
                text:
                    '"إذا عبرتم للمسلم الرؤيا فاعبروها على خير، فإن الرؤيا تكون على ما يعبرها صاحبها" (رواه أبو داود - حديث صحيح).\n',
                style: TextStyle(fontStyle: FontStyle.italic),
              ),
              TextSpan(
                text:
                    'وأيضًا قوله صَلَّ اللَّهُ عَلَيْهِ وَسَلَّمَ: "بَشِّروا ولا تُنَفِّروا ويسِّروا ولا تُعَسِّروا" (رواه مسلم).\n\n',
                style: TextStyle(fontStyle: FontStyle.italic),
              ),
              TextSpan(
                text:
                    '• نعمل على تقديم التفسيرات بحكمة وبُعد عن التجاوزات التي قد تضر بالرائي، مثل الترويع أو الخوض في أمور شخصية لا تفيد التعبير، أو المبالغات التي تشتت الذهن.\n\n',
              ),
              TextSpan(
                text: '▫ رسالتنا 👇🏻\n',
                style: AppTextStyles.title28Brown,
              ),
              TextSpan(
                text:
                    '• اتباع الهدي النبوي: تقديم التفسيرات التي تحمل البشارة والتوجيه بخير بعيداً عن التخويف والتهويل.\n',
              ),
              TextSpan(
                text:
                    '• المصداقية والوضوح: التزام الدقة والعلم في تفسير الرؤى.\n',
              ),
              TextSpan(
                text: '• الخصوصية: احترام الرائي وضمان سرية بياناته وأحلامه.\n',
              ),
              TextSpan(
                text:
                    '• نسعى لجعل تفسير الأحلام وسيلة لتوجيه الرائي نحو الخير والسكينة، بعيدًا عن القلق والمخاوف، مع تقديم النصح الذي يبني الثقة ويُرشد للطريق السليم بإذن الله تعالى.\n',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
