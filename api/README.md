# Vipunen API
Spring and Gradle based REST API implementation.

## Requirements
- Java JDK 17 LTS, check Spring Boot compatibility.

## Development
Running application in local environment.
    
    $sh gradlew bootRun

## <a name="build"></a>Building package
    
    $sh gradlew clean build
    
Executable jar package is created in `build/libs` directory.

## Making release
Project uses version numbering from SCM system. Gradle plugin named [Axion-Release-Plugin](https://github.com/allegro/axion-release-plugin)
manages projects version number by tags in SCM.

Create new release version from current branch:

    $sh gradlew release
    
Release plugin creates new tag and pushes it to remote repository.

Check projects current version:

    $sh gradlew currentVersion

## Installing in to the server
1. Build package. [See here](#build)

2. Copy executable jar to server.

3. Create `api.properties` file with restricted read rights. Inside the file add following properties with correct values.

    `spring.datasource.username={username}`
    
    `spring.datasource.password={password}`
4. Use `application.properties` and `application-prod.properties` as base configuration.
5. Run application with following command with correct values.
    
    db.host is database host name/ip (default=localhost)
    
    db.port is database port number (default=1433)
    
    
    $java -jar {jar_package} --spring.profiles.active=prod --spring.config.location=api.properties --db.host={database_host} --db.port={database_port}