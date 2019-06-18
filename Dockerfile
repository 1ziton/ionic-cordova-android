FROM circleci/android:api-26-node8-alpha

MAINTAINER giscaffer<giscafer@outlook.com>

# Install Cordova and Ionic
RUN sudo npm update -g
RUN sudo npm install -g ionic cordova
RUN cordova telemetry off
RUN CI=true ionic config set -g daemon.updates false
RUN ionic config set -g telemetry false

# Install Fastlane
RUN gem install fastlane -NV

# Install Gradle
ARG GRADLE_VERSION=4.10.2
RUN sudo curl https://downloads.gradle.org/distributions/gradle-$GRADLE_VERSION-bin.zip > /tmp/gradle-$GRADLE_VERSION-bin.zip
RUN sudo unzip /tmp/gradle-$GRADLE_VERSION-bin.zip -d /tmp && rm /tmp/gradle-$GRADLE_VERSION-bin.zip
RUN sudo mv /tmp/gradle-$GRADLE_VERSION /opt/gradle
ENV PATH="/opt/gradle/bin:${PATH}"


# Copy Crashlytics Dev Tools
# COPY resources/crashlytics-devtools.jar /opt/crashlytics/

