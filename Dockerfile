FROM openjdk:8

WORKDIR /home

RUN apt-get clean

# Install Build Essentials
RUN apt-get update \
    && apt-get install build-essential -y

# Set Environment Variables
ENV SDK_URL="https://dl.google.com/android/repository/sdk-tools-linux-3859397.zip" \
    ANDROID_HOME="/home" \
    ANDROID_VERSION=29

RUN mkdir -p /root/.android && touch /root/.android/repositories.cfg

# Download Android SDK
RUN mkdir "$ANDROID_HOME" .android \
    && cd "$ANDROID_HOME" \
    && curl -o sdk.zip $SDK_URL \
    && unzip sdk.zip \
    && rm sdk.zip \
    && mkdir "$ANDROID_HOME/licenses" || true \
    && echo "24333f8a63b6825ea9c5514f83c2829b004d1fee" > "$ANDROID_HOME/licenses/android-sdk-license" \
    && yes | $ANDROID_HOME/tools/bin/sdkmanager --licenses

# Install Android Build Tool and Libraries
RUN $ANDROID_HOME/tools/bin/sdkmanager --update
RUN $ANDROID_HOME/tools/bin/sdkmanager "build-tools;29.0.2" \
    "platforms;android-${ANDROID_VERSION}" \
    "platform-tools"

CMD ["/bin/bash"]
