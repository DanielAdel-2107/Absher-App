# لحماية موارد الصوت
-keep class android.media.** { *; }

# إبقاء جميع الملفات الصوتية الموجودة في مجلد `res/raw`
-keepclassmembers class * {
    public void onReceive(...);
}
-keepattributes *Annotation*

# حماية الأنماط المرتبطة بالحياة (Life-cycle) في Android
-keep class androidx.lifecycle.** { *; }
-keepclassmembers class ** {
    @androidx.annotation.Keep *;
}
