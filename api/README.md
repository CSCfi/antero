# Vipunen API
Spring and Gradle based REST API implementation.

## Requirements
- Java JDK 8

## Development
Running application in local environment.
    
    $sh gradlew bootRun

## <a name="build"></a>Building package
    
    $sh gradlew clean build
    
Executable jar package is created in `build/libs` directory.

## Installing in to the server
1. Build package. [See here](#build)

2. Copy executable jar to server.

3. Create `api.properties` file with restricted read rights. Inside the file add following properties with correct values.

    `spring.datasource.username={username}`
    
    `spring.datasource.password={password}`

4. Run application with following command with correct values.
    
    db.host is database host name/ip (default=localhost)
    
    db.port is database port number (default=1433)
    
    
    $java -jar {jar_package} --spring.profiles.active=prod --spring.config.location=api.properties --db.host={database_host} --db.port={database_port}