import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

const _kLocaleStorageKey = '__locale_key__';

class FFLocalizations {
  FFLocalizations(this.locale);

  final Locale locale;

  static FFLocalizations of(BuildContext context) =>
      Localizations.of<FFLocalizations>(context, FFLocalizations)!;

  static List<String> languages() => ['en', 'es'];

  static late SharedPreferences _prefs;
  static Future initialize() async =>
      _prefs = await SharedPreferences.getInstance();
  static Future storeLocale(String locale) =>
      _prefs.setString(_kLocaleStorageKey, locale);
  static Locale? getStoredLocale() {
    final locale = _prefs.getString(_kLocaleStorageKey);
    return locale != null && locale.isNotEmpty ? createLocale(locale) : null;
  }

  String get languageCode => locale.toString();
  String? get languageShortCode =>
      _languagesWithShortCode.contains(locale.toString())
          ? '${locale.toString()}_short'
          : null;
  int get languageIndex => languages().contains(languageCode)
      ? languages().indexOf(languageCode)
      : 0;

  String getText(String key) =>
      (kTranslationsMap[key] ?? {})[locale.toString()] ?? '';

  String getVariableText({
    String? enText = '',
    String? esText = '',
  }) =>
      [enText, esText][languageIndex] ?? '';

  static const Set<String> _languagesWithShortCode = {
    'ar',
    'az',
    'ca',
    'cs',
    'da',
    'de',
    'dv',
    'en',
    'es',
    'et',
    'fi',
    'fr',
    'gr',
    'he',
    'hi',
    'hu',
    'it',
    'km',
    'ku',
    'mn',
    'ms',
    'no',
    'pt',
    'ro',
    'ru',
    'rw',
    'sv',
    'th',
    'uk',
    'vi',
  };
}

class FFLocalizationsDelegate extends LocalizationsDelegate<FFLocalizations> {
  const FFLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) {
    final language = locale.toString();
    return FFLocalizations.languages().contains(
      language.endsWith('_')
          ? language.substring(0, language.length - 1)
          : language,
    );
  }

  @override
  Future<FFLocalizations> load(Locale locale) =>
      SynchronousFuture<FFLocalizations>(FFLocalizations(locale));

  @override
  bool shouldReload(FFLocalizationsDelegate old) => false;
}

Locale createLocale(String language) => language.contains('_')
    ? Locale.fromSubtags(
        languageCode: language.split('_').first,
        scriptCode: language.split('_').last,
      )
    : Locale(language);

final kTranslationsMap = <Map<String, Map<String, String>>>[
  // Authenticate
  {
    'qlp2qu0p': {
      'en': 'Sign In',
      'es': 'Iniciar sesión',
    },
    'b3q9wbph': {
      'en': 'Email Address',
      'es': 'Correo electrónico',
    },
    'w4rypi14': {
      'en': 'Password',
      'es': 'Contraseña',
    },
    '0pqdmrtf': {
      'en': 'Login',
      'es': 'Iniciar sesión',
    },
    'at0tx51y': {
      'en': 'Forgot Password?',
      'es': 'Olvidé mi contraseña',
    },
    'sfttf7su': {
      'en': 'Field is required',
      'es': 'El campo es obligatorio',
    },
    '3adavusu': {
      'en': '',
      'es': '',
    },
    'a1n8w2sd': {
      'en': 'Please choose an option from the dropdown',
      'es': 'Elija una opción en el menú desplegable',
    },
    '6odctexi': {
      'en': 'Field is required',
      'es': 'El campo es obligatorio',
    },
    'g3xukxu0': {
      'en': 'Please choose an option from the dropdown',
      'es': 'Elija una opción en el menú desplegable',
    },
    'mbvbjcps': {
      'en': 'Sign Up',
      'es': 'Crear cuenta',
    },
    'kmj219vr': {
      'en': 'Email Address',
      'es': 'Correo electrónico',
    },
    'gyhfw1dk': {
      'en': 'Password',
      'es': 'Contraseña',
    },
    '2770b46h': {
      'en': 'Confirm Password',
      'es': 'Confirmar contraseña',
    },
    '4tz1wosd': {
      'en': 'User',
      'es': 'Usuario',
    },
    'tb8m0khy': {
      'en': 'Therapist',
      'es': 'Terapeuta',
    },
    'dm53hmrs': {
      'en': 'Doctor',
      'es': 'Doctor(a)',
    },
    'jz12igqi': {
      'en': 'Create Account',
      'es': 'Crear cuenta',
    },
    'ec3s0o1b': {
      'en': 'Field is required',
      'es': 'El campo es obligatorio',
    },
    'tbt23qb5': {
      'en': 'Please choose an option from the dropdown',
      'es': 'Elija una opción en el menú desplegable',
    },
    'ql1a4jf8': {
      'en': 'Field is required',
      'es': 'El campo es obligatorio',
    },
    'k47jaxdi': {
      'en': 'Please choose an option from the dropdown',
      'es': 'Elija una opción en el menú desplegable',
    },
    'jczxpq9x': {
      'en': 'Field is required',
      'es': 'El campo es obligatorio',
    },
    'iiqf5zch': {
      'en': 'Please choose an option from the dropdown',
      'es': 'Elija una opción en el menú desplegable',
    },
    'a2ts2pga': {
      'en': 'Or use a social account',
      'es': 'Usar otro servicio ',
    },
    'aa82bfen': {
      'en': 'Use anonymously',
      'es': 'Usar de manera anónima',
    },
    'xrs491tp': {
      'en': 'Authentication',
      'es': 'Autenticación',
    },
  },
  // UserInfo
  {
    '4qayjnv9': {
      'en': 'About you',
      'es': 'Acerca de ti',
    },
    'duhn6iei': {
      'en': 'General Information',
      'es': 'Información General',
    },
    'e9z9mcic': {
      'en': 'Age',
      'es': 'Edad',
    },
    'e9qk5hr5': {
      'en': 'Gender',
      'es': 'Género',
    },
    'ka7wba5o': {
      'en': 'Search for an item...',
      'es': '',
    },
    '0le1ximb': {
      'en': 'Country',
      'es': 'País',
    },
    '0zlj6cpq': {
      'en': 'Search for an item...',
      'es': 'Buscar un artículo...',
    },
    '60on2yjr': {
      'en': 'State, Province or Region',
      'es': 'Estado, Provincia o Región',
    },
    '37vvcera': {
      'en': 'Search for an item...',
      'es': 'Buscar un artículo...',
    },
    'az8i0ji2': {
      'en': 'Psychological Information',
      'es': 'Información Psicológica',
    },
    '3vssy8sv': {
      'en': 'Have you ever been diagnosed with any of the following?',
      'es': '¿Alguna vez has sido diagnosticado con alguno de los siguientes?',
    },
    'lmiik5ot': {
      'en': 'Anxiety',
      'es': 'Ansiedad',
    },
    'v7mnmwfi': {
      'en': '',
      'es': '',
    },
    'vp1nuebn': {
      'en': 'Depression',
      'es': 'Depresión',
    },
    'gx21filx': {
      'en': '',
      'es': '',
    },
    'h7lfvinv': {
      'en': 'ADD/ADHD',
      'es': 'TDA/TDAH',
    },
    '6ncfw6x5': {
      'en': '',
      'es': '',
    },
    'nqms46q0': {
      'en': 'Have you ever been treated for any of the following?',
      'es': '¿Alguna vez ha sido tratado por alguno de los siguientes?',
    },
    'pz4epxqc': {
      'en': 'Anxiety',
      'es': 'Ansiedad',
    },
    'xrb586vn': {
      'en': '',
      'es': '',
    },
    'hb6yreb7': {
      'en': 'Depression',
      'es': 'Depresión',
    },
    't5rb3nhh': {
      'en': '',
      'es': '',
    },
    'rwhlnzgv': {
      'en': 'ADD/ADHD',
      'es': 'TDA/TDAH',
    },
    '1f2h1xtk': {
      'en': '',
      'es': '',
    },
    '26natmru': {
      'en': 'App settings',
      'es': 'Configuración de aplicación',
    },
    'sibgi7m5': {
      'en': 'Add location to records',
      'es': 'Agregar ubicación a los registros',
    },
    'gbl8a3b4': {
      'en':
          'Choose whether you want to add your location when recording a panic attack',
      'es':
          'Elije si deseas agregar tu ubicación al registrar un ataque de pánico',
    },
    'ai8l3o6i': {
      'en': 'Use biometric authentication',
      'es': 'Usar autenticación biométrica',
    },
    '0ibsp7ai': {
      'en':
          'You can use your phone\'s biometric authentication to prevent unwanted access to the app',
      'es':
          'Usa la autenticación biométrica de tu teléfono para evitar el acceso no deseado a la aplicación',
    },
    'rudy86xl': {
      'en': 'Pick a language',
      'es': 'Elige un idioma',
    },
    'xdq2ywdw': {
      'en': 'You will recieve questions in this language',
      'es': 'Recibirás preguntas en este idioma',
    },
    'iyhj6plc': {
      'en': 'Preferred language',
      'es': 'Idioma preferido',
    },
    'nt7f2rkf': {
      'en': 'Search for an item...',
      'es': 'Buscar un artículo...',
    },
    'tfs9voin': {
      'en': 'Continue',
      'es': 'Continuar',
    },
    '5gncvnrb': {
      'en': 'Field is required',
      'es': 'Se requiere campo',
    },
    'q571qp3d': {
      'en': 'Enter a valid age between 16 and 99',
      'es': 'Ingrese una edad válida entre 16 y 99',
    },
    'ebef6mxs': {
      'en': 'Please choose an option from the dropdown',
      'es': '',
    },
    'x65gcpem': {
      'en': 'What do we use this information for?',
      'es': '¿Para que utilizamos esta información?',
    },
    'owh79ie8': {
      'en':
          'Dear User,\nThe data gathered via this form is solely for research. If you select the \"Use Anonymously\" option, your data won\'t be linked to any personal information but will be tied to a unique identifier stored on your device. This ensures privacy while aiding our research. We strictly adhere to legal and ethical guidelines for data privacy and protection. Feel free to reach out with any questions or concerns.',
      'es':
          'Estimado usuario,\nLos datos recogidos a través de este formulario son exclusivamente para investigación. Si selecciona la opción \"Usar anónimamente\", sus datos no se vincularán a ninguna información personal, sino que se asociarán a un identificador único almacenado en su dispositivo. Esto garantiza la privacidad mientras apoya nuestra investigación. Nos adherimos estrictamente a las directrices legales y éticas para la privacidad y protección de datos. No dude en contactarnos con cualquier pregunta o inquietud.',
    },
  },
  // MainPage
  {
    '3hi10kxx': {
      'en': 'Home',
      'es': 'Inicio',
    },
    'f3g1htjq': {
      'en': 'Log panic attack',
      'es': 'Registrar ataque de pánico',
    },
    '709kwpuw': {
      'en': 'Home',
      'es': '',
    },
    'ziy78ugb': {
      'en': 'Please authenticate to access',
      'es': 'Por favor, autentícate para acceder',
    },
  },
  // AttackDetails
  {
    'dgorumuu': {
      'en': 'Panic attack details',
      'es': 'Detalles del ataque de pánico',
    },
    '178yf368': {
      'en': 'Intensity ',
      'es': 'Intensidad ',
    },
    'ss6tgt7a': {
      'en': '(0-100)',
      'es': '(0-100) ',
    },
    'ebb9jqmm': {
      'en': 'In that moment you...',
      'es': 'En ese momento tú...',
    },
    'cn6zh7vb': {
      'en': 'The notes you took',
      'es': 'Las notas que tomaste',
    },
    '3yld9lbr': {
      'en': 'Your location was',
      'es': 'Tu ubicación era',
    },
    'akf2u9am': {
      'en': 'Delete report',
      'es': 'Eliminar reporte',
    },
    'm8b5kh2h': {
      'en': 'Home',
      'es': '',
    },
  },
  // MonthDetails
  {
    'pwo6gupw': {
      'en': 'Home',
      'es': '',
    },
  },
  // ResetPassword
  {
    'zjp9oqpz': {
      'en': 'Enter your email to reset your password',
      'es': 'Ingrese su correo electrónico para restablecer su contraseña',
    },
    'w9q3lfwj': {
      'en': 'Email Address',
      'es': 'Correo electrónico',
    },
    'zh5kzgii': {
      'en': 'Reset password',
      'es': 'Restablecer  contraseña',
    },
    'u8n7jakv': {
      'en': 'Field is required',
      'es': 'El campo es obligatorio',
    },
    'nvjpdage': {
      'en': 'Please choose an option from the dropdown',
      'es': '',
    },
  },
  // DebugSheet
  {
    '8y24k7l3': {
      'en': 'Language',
      'es': 'Idioma',
    },
    'gh27oxk0': {
      'en': 'en',
      'es': 'en',
    },
    '0ly0y4q8': {
      'en': 'es',
      'es': 'es',
    },
    'h165q5h5': {
      'en': 'Refresh reports',
      'es': 'Refrescar reportes',
    },
    '36l64gf9': {
      'en': 'Log Out',
      'es': 'Cerrar Sesión',
    },
    'xxa563hr': {
      'en': 'Change Theme',
      'es': 'Cambiar Tema',
    },
    'np7tzvi1': {
      'en': 'Open questions',
      'es': 'Abrit preguntas',
    },
    'w1p166qc': {
      'en': 'justOpenedApp',
      'es': 'justOpenedApp',
    },
    'dmf6hbjz': {
      'en': 'firstTime',
      'es': 'firstTime',
    },
    'k8sc6uva': {
      'en': 'Delete my data',
      'es': 'Eliminar datos',
    },
    'pyls35iw': {
      'en': 'Clear anon user',
      'es': 'Eliminar usuario anon',
    },
  },
  // PanicAttackReport
  {
    'eeznzq9h': {
      'en': 'You can get through this.',
      'es': 'Tú puedes superar esto.',
    },
    'kad4rlp4': {
      'en': 'Record panic attack',
      'es': 'Registrar ataque de pánico',
    },
  },
  // PanicAttackData
  {
    'ihhiynkd': {
      'en': 'First things first',
      'es': 'Lo primero lo primero',
    },
    '4qodrrwm': {
      'en': 'Do you believe you may be in danger and/or require asistance?',
      'es': '¿Crees que puedas estar en peligro y/o necesites ayuda?',
    },
    '2cntggpo': {
      'en': 'Emergency services',
      'es': 'Servicios de emergencia',
    },
    'muoj3wwx': {
      'en': 'Call someone',
      'es': 'Llamar a alguien',
    },
    'me6q0onn': {
      'en': 'Asking for help is ok',
      'es': 'Pedir ayuda está bien',
    },
    'v86z62py': {
      'en': 'Now some questions',
      'es': 'Ahora algunas preguntas',
    },
    'd2klgg0a': {
      'en': 'How bad is your panic attack?',
      'es': '¿Qué tan grave es tu ataque de pánico?',
    },
    'ln60dj4c': {
      'en': 'I feel safe',
      'es': 'Me siento seguro/a',
    },
    '1jvfqa2h': {
      'en': 'I am at home or some place safe for me',
      'es': 'Estoy en casa o en algún lugar seguro para mí',
    },
    '9fbe62ju': {
      'en': 'I am accompanied',
      'es': 'Estoy acompañado/a',
    },
    'ttrrcw6r': {
      'en': 'I am with someone else I can trust',
      'es': 'Estoy con alguien más en quien puedo confiar',
    },
    'bpiql702': {
      'en': 'I can identify the source',
      'es': 'Puedo identificar la fuente',
    },
    'svo7apsj': {
      'en': 'I know what the source of the panic is',
      'es': 'Sé cuál es la fuente del pánico',
    },
    '3uguszjh': {
      'en': 'I can get away from the situation',
      'es': 'Me puedo alejar de la situación',
    },
    'fqxo92h5': {
      'en': 'I can go someplace else to unwind',
      'es': 'Puedo ir a otro lugar para relajarme',
    },
    'arwak9kb': {
      'en': 'Theres something I can do',
      'es': 'Hay algo que puedo hacer',
    },
    '985h5wx4': {
      'en': 'I can do something to change the situation',
      'es': 'Puedo hacer algo para cambiar la situación.',
    },
    '87mbf3mn': {
      'en': 'The panic is related to people',
      'es': 'El pánico está relacionado con gente',
    },
    'n249hdej': {
      'en': 'My anxiety is related to a specific someone or a group of people',
      'es':
          'Mi ansiedad está relacionada con una persona específica o un grupo de personas.',
    },
    '39cthwuf': {
      'en': 'My notes',
      'es': 'Mis notas',
    },
    '1nwsgm41': {
      'en': '',
      'es': '',
    },
    'b7c2ouao': {
      'en': '',
      'es': '',
    },
    'wze64nv8': {
      'en': 'Submit',
      'es': 'Guardar',
    },
  },
  // questionInput
  {
    'imqc3052': {
      'en': 'No',
      'es': 'No',
    },
    '020yy6eu': {
      'en': 'Yes',
      'es': 'Si',
    },
    'zxnl66eh': {
      'en': 'Response',
      'es': 'Respuesta',
    },
    'gjkrwetb': {
      'en': '42',
      'es': '42',
    },
    '563jce4u': {
      'en': '',
      'es': '',
    },
    '9fwmmodo': {
      'en': 'Response',
      'es': 'Respuesta',
    },
    'usosdfo2': {
      'en': '10.42',
      'es': '10.42',
    },
    'kjfkuws0': {
      'en': '',
      'es': '',
    },
    'clnkifef': {
      'en': 'Response',
      'es': 'Respuesta',
    },
    'pi593kdp': {
      'en': 'Text...',
      'es': 'Texto...',
    },
    '9zod7ctz': {
      'en': 'Field is required',
      'es': '',
    },
    'ihe0cauz': {
      'en': 'Please choose an option from the dropdown',
      'es': '',
    },
    '46no78t1': {
      'en': 'Field is required',
      'es': '',
    },
    'ga232rpi': {
      'en': 'Please choose an option from the dropdown',
      'es': '',
    },
    'zq5ibz0i': {
      'en': 'Field is required',
      'es': '',
    },
    'q94egtc3': {
      'en': 'Please choose an option from the dropdown',
      'es': '',
    },
  },
  // SelectReport
  {
    'oi67l1ed': {
      'en': 'Report',
      'es': 'Reportar',
    },
  },
  // ThanksForAnwering
  {
    'h23n7m1e': {
      'en': 'Thanks for answering!',
      'es': '¡Gracias por responder!',
    },
    'kok1j9q4': {
      'en': 'No more quesitons left',
      'es': 'No quedan más preguntas',
    },
    'sjm8ig5l': {
      'en': 'Close',
      'es': 'Cerrar',
    },
  },
  // Miscellaneous
  {
    'w739gf4a': {
      'en': 'Button',
      'es': '',
    },
    't6kgfynx': {
      'en': '',
      'es': '',
    },
    'aughh5fa': {
      'en': '',
      'es': '',
    },
    'reuo9a71': {
      'en': 'Protect your data with biometric authentication',
      'es': '',
    },
    'b92ov3pj': {
      'en':
          'Location services are used for you to be able to keep track of where your panic attacks happen, you can opt out of this anytime.',
      'es': '',
    },
    'snftstuk': {
      'en': '',
      'es': '',
    },
    'uu38ke6f': {
      'en': '',
      'es': '',
    },
    '4898a9jv': {
      'en': '',
      'es': '',
    },
    'kiq57b6t': {
      'en': '',
      'es': '',
    },
    '97arixsa': {
      'en': '',
      'es': '',
    },
    'cok1svcd': {
      'en': '',
      'es': '',
    },
    '9eo3ilpz': {
      'en': '',
      'es': '',
    },
    'rc08uqcx': {
      'en': '',
      'es': '',
    },
    'wm4xyhk2': {
      'en': '',
      'es': '',
    },
    '3wajrra5': {
      'en': '',
      'es': '',
    },
    'u8x9nz3o': {
      'en': '',
      'es': '',
    },
    '11z566di': {
      'en': '',
      'es': '',
    },
    'va88z59b': {
      'en': '',
      'es': '',
    },
    '2fakbquc': {
      'en': '',
      'es': '',
    },
    '3r19n7bk': {
      'en': '',
      'es': '',
    },
    '7qu1n8l1': {
      'en': '',
      'es': '',
    },
    '6xa7k3k7': {
      'en': '',
      'es': '',
    },
    '5ad6dodp': {
      'en': '',
      'es': '',
    },
    'rk1x7xdz': {
      'en': '',
      'es': '',
    },
    'vao3qmtv': {
      'en': '',
      'es': '',
    },
    '68ws38a6': {
      'en': '',
      'es': '',
    },
  },
].reduce((a, b) => a..addAll(b));
