# licensefinder-docker-image
Docker image for License Finder using maven and npm package managers

Runs [License Finder](https://github.com/pivotal/LicenseFinder) in docker.

## Supported package managers
* Maven with Java 8, 11 and 17
* NPM and Yarn

## Setup alternative Maven version
Remove maven from Dockerfile first RUN instruction in jdk folders and add the following instructions below:

```dockerfile
# Set maven environment variables
ENV MAVEN_VERSION 3.6.3
ENV MAVEN_HOME /usr/lib/mvn
ENV PATH $MAVEN_HOME/bin:$PATH

# Download and setup maven
RUN wget http://archive.apache.org/dist/maven/maven-3/$MAVEN_VERSION/binaries/apache-maven-$MAVEN_VERSION-bin.tar.gz && \
  tar -zxvf apache-maven-$MAVEN_VERSION-bin.tar.gz && \
  rm apache-maven-$MAVEN_VERSION-bin.tar.gz && \
  mv apache-maven-$MAVEN_VERSION /usr/lib/mvn
```
MAVEN_VERSION must be your preferred version.

## Usage
There are four images:

* **jandebora/license_finder:jdk8**: Java with OpenJDK 8.
* **jandebora/license_finder:jdk11**: Java with OpenJDK 11.
* **jandebora/license_finder:jdk17**: Java with OpenJDK 17.
* **jandebora/license_finder:npm-yarn**: NPM and Yarn package managers.

### Simple scanning

To use without ```permitted_licenses``` you must move to your project path and run:
```
docker run --rm --volume $(pwd):/scan -it jandebora/license_finder:jdk11
```

### Adding permitted licenses for CI
First of all, you need to add a file with one license per line, like:

```
MIT
New BSD

```

Notice last line is empty, because is going to be interpreted by bash and it needs linebreak at the end.

Finally, you must tell docker where to put that file like the following example:

```
docker run --rm --volume $(pwd):/scan -v $(pwd)/LFPermittedLicenses:/data/LFPermittedLicenses -it jandebora/license_finder:jdk8
```

To consider:

* **$(pwd)/LFPermittedLicenses**: is the file called LFPermittedLicenses in your local machine.
* **/data/LFPermittedLicenses**: is the location interpreted by the image for parsing the licenses and add to the permitted ones.
