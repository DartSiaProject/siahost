## Assets Folder

In this case everything depends on you, the great developer.
in order to respect this configuration format

```yaml
assets:
  - assets/languages/
  - assets/images/jpg/
  - assets/images/png/
  - assets/images/svg/
  - assets/envs/
  - assets/fonts/
```
### Images
you have to create a folder **images** and then in this folder, you have to create specific folders for each image format that you want to introduce in your application.
- jpg
- png
- svg

Helper : In order to obtain an application (apk/appbundle) of reduced size, each resource must be reduced in size. This site https://tinypng.com/ will help you compress your images (png, webp, jpeg) while maintaining image quality.

### Font Family

In this case you have to create the folder **fonts** within the folder **assets** and then upload one or more font related files.

- liens
   - https://www.1001freefonts.com/

- usage
  Once the file is downloaded, you must follow these steps:
  1. pubspec.yaml
```yaml
fonts:
  - family: SegoeUI
    fonts:
      - asset: assets/fonts/segoe_ui/Segoe-UI-Italic.ttf
  #   - family: Trajan Pro
  #     fonts:
  #       - asset: fonts/TrajanPro.ttf
  #       - asset: fonts/TrajanPro_Bold.ttf
  #         weight: 700
``` 

  1. themes_app.dart
```dart
static final themes = {
    Themes.lightTheme: ThemeData(
      fontFamily: "SegoeUI",
    )
    //Themes.darkTheme: ThemeData()
  };
```

