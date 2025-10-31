# 1. Imagen base
# Usamos Java 21, ya que tu pom.xml especifica <java.version>21</java.version>
FROM openjdk:21-jdk-slim

# 2. Argumento para la ruta del JAR
# El nombre viene de tu pom.xml: <artifactId>MotvirsWeb</artifactId> y <version>0.0.1-SNAPSHOT</version>
ARG JAR_FILE=target/MotvirsWeb-0.0.1-SNAPSHOT.jar

# 3. Copiar el JAR al contenedor
# Copia el archivo .jar de la carpeta 'target' y lo renombra a 'app.jar' dentro del contenedor
COPY ${JAR_FILE} app_nexa.jar

# 4. Exponer el puerto
# Expone el puerto 8080, que es el que usa Spring Boot por defecto
EXPOSE 8080

# 5. Punto de entrada
# El comando que se ejecutará al iniciar el contenedor para correr tu app
ENTRYPOINT ["java", "-jar", "app_nexa.jar"]