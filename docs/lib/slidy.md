#  slidy

[TOC]



## create

> create a project from the ground

### CLI + GUI

```bash
flutterx create project_name 
// need to choose provider_system and state_manager from the CLI.
flutterx create project_name -d 'snake_case_des' -p flutter_modular
```

### CLI

```bash
flutterx create project_name1 -d 'snake_case_description' -o 'org.nameofdomain' -p flutter_modular -m flutter_bloc -k -s -x
```

## start 

> add CLI features in an existing project

###  CLI

```
flutterx start
// need to choose provider_system and state_manager from the CLI.
// and confirm to override the lib and test folders.
flutterx start -p flutter_modular -s flutter_bloc 
// need to force override
flutterx start -p flutter_modular -s flutter_bloc 
flutterx start -p flutter_modular -s flutter_bloc -f
```



###  GUI

```
flutterx start
// only provider_system and state_manager
```



## install

> **Installs or update the packages in dependencies:**

```bash
slidy install rxdart dio bloc_pattern
// using abbr
slidy i rxdart dio bloc_pattern

// Install packages as dev_dependency:
slidy i mockito --dev
```

## uninstall

> Removes a package

```bash
slidy uninstall dio
flutterx uninstall dio --dev
```

## update

> Update package's version: You can update just once package

```
## You can update just once package

slidy update mobx

## Or you can update all packages using the flag --all or -a

slidy update -a

## You can also update a dev_dependency or all using the flag --dev
slidy update mobx --dev
```



## run

> Runs the scripts in pubspec.yaml:

```yaml
vars:
  runner: flutter pub run build_runner
  clean: flutter clean
  get: flutter pub get
scripts: 
    mobx_build: $clean & $get & $runner build --delete-conflicting-outputs
    mobx_watch: $clean & $get & $runner watch --delete-conflicting-outputs
```

```
flutterx run mobx_build
```

## generate:

[TOC]



> Creates a module, page, widget or repository including its BloC class.
>
> **NOTE:** You can replace "g" with "generate" command.

### modules-

> creates a new module

```
slidy g module folder_name
slidy g m folder_name

-app
	/folder_name
		/-folder_name_module.dart
		// a class that extends ChildModule

/// --------------///

```

> Complete Module" with Module, Page, Bloc/Controller, tests for Page and for Bloc/Controller using the flag **-c**
>
> module + page + bloc 

```
slidy g module folder_name
slidy g m folder_name -c

-app
	/folder_name
		/-folder_name_module.dart (a class that extends ChildModule)
		/-folder_name_page.dart
		/bloc
			//-xxxx
		

/// --------------///

```

> with **NOTE² :** You can create a "Repository" with your Module using the flag **-r**
>
> ```
> slidy g m modules/my_module -c -r
> ```

> You can create a "Interface" for your repository with your Module using the flag **-i**

```
slidy g m modules/my_module -c -r -i
```



### pages / features-(page + bloc)

```
flutterx g p folder_name/pages
flutterx g p folder_name/counter

-app
	/folder_name/
		/counter/
		/-counter_page.dart(with scaffold)
		/bloc
			/-counter_bloc.dart
			/-counter_event.dart
			/-counter_state.dart
			
// with out the bloc
flutterx g w forlder/widget -b
```



### widgets- (widget + bloc)

```
flutterx g w folder_name/counter

-app
	/folder_name/
		/counter/
		/-counter_widget.dart(without scaffold)
		/bloc
			/-counter_bloc.dart
			/-counter_event.dart
			/-counter_state.dart
			
// with out the bloc
flutterx g w forlder/widget -b
```



### repositories-

> Create a new **repository**

```
slidy g r folder_name/repo

-app
	/folder_name
		/repo_repository.dart( standard repository extends Dispoable )

```



### service-

> Create a new **service**

```
slidy g s folder_name/services
// same as repo
```



### model-

> Create a new **model**
>
> ```
> flutterx g mm models/user
> 	// createa model which cab be also use @JsonSerializable
> 
> ```

> **NOTE :** if you are using JsonSerializable (and 'json_annotation' is in Dependecy and 'json_serializable' is in dev_dependencies) this command will create using anotation



