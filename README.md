# Fudge Financial App

A Fudge Financial App project created in flutter using BLoC. 

## How to Use 

**Step 1:**

Download or clone this repo by using the link below:

```
https://github.com/sammanart/fudge_financial_app.git
```

**Step 2:**

Go to project root and execute the following command in console to get the required dependencies: 

```
flutter pub get 
```

**Step 3:**

For runnig project use this command

```
flutter run 
```


### Libraries & Tools Used

* [flutter_bloc](https://pub.dev/packages/flutter_bloc) (State Management)
* [get_it](https://pub.dev/packages/get_it)
* [intl](https://pub.dev/packages/intl)
* [skeletons](https://pub.dev/packages/skeletons)
* [equatable](https://pub.dev/packages/equatable) (to connect the reactive data of your application with the UI)
* [dio](https://pub.dev/packages/dio)
* [flutter_dotenv](https://pub.dev/packages/flutter_dotenv)
* [provider](https://pub.dev/packages/provider)
* [smooth_page_indicator](https://pub.dev/packages/smooth_page_indicator)
* [mrx_charts](https://pub.dev/packages/mrx_charts)
* [rxdart](https://pub.dev/packages/rxdart)

### Folder Structure
Here is the core folder structure which flutter provides.

```
flutter-app/
|- android
|- build
|- ios
|- lib
|- test
```

Folder structure used in this project

```
lib/
|- src/
|- main.dart
```


```
src/
|- config/
|- core/
|- data/
|- domain/
|- presentation/
```




```
1 - config - The config folder includes the configuration about the app (themes, routes, …etc) nothing more
2 - core - The core folder is much more important, it includes the core stuff we need across the app (globally) so if we have a job/action that will be required by all (features/layers) then it’s better to be in the core. It also includes some other folder such as (resources, utiles, …etc).
3 - data - The data folder is a place where the app meets with the harsh outside world of APIs and 3rd party libraries. It consists of low-level Data Sources, Repositories which are the single source of truth for the data, and finally Models.
4 - domain - The domain folder contains only the internal entities and what this mean is that our domain’s entities are completely independent from any changes that could occur outside this layer.
5 - presentation - The presentation folder contains two important parts: The Blocs (also ViewModels) and The UI
```

### Config


```
config/
|- enums.dart
|- env.dart
|- router.dart
|- theme.dart
```

### Core


```
core/
|- injector/
|- resources/
|- utils/
|- app.dart

```

### Data

```
data/
|- models/
|- repositories/
  
```

### Domain
```
domain/
|- repositories/
```

### Presentation
```
presentation/
|- components/
|- widgets/
```


