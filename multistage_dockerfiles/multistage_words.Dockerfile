# Comandos originales

# FROM ubuntu
# RUN apt-get update -y
# RUN apt-get install -y maven openjdk-8-jdk
# COPY . /words/
# WORKDIR /words/
# RUN mvn verify
# CMD ["java", "-Xmx8m", "-Xms8m", "-jar", "target/words.jar"]
# EXPOSE 8080

# Comandos aplicando multi stage

# Stage 1
FROM ubuntu AS backend
RUN apt-get update -y && apt-get install -y maven openjdk-8-jdk
COPY . /words/
WORKDIR /words/
RUN mvn verify

# Stage 2
FROM ubuntu
COPY --from=backend /words/target/words.jar /words/words.jar
WORKDIR /words/
EXPOSE 8080
CMD ["java", "-Xmx8m", "-Xms8m", "-jar", "words.jar"]



