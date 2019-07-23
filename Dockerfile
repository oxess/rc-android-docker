FROM openjdk:8-jdk

ENV ANDROID_SDK_TOOLS "4333796"
ENV ANDROID_COMPILE_SDK "28"
ENV ANDROID_BUILD_TOOLS "28.0.2"

WORKDIR /tmp

RUN apt-get --quiet update --yes && \
		apt-get --quiet install --yes wget tar unzip lib32stdc++6 lib32z1

RUN wget --quiet --output-document=android-sdk.zip https://dl.google.com/android/repository/sdk-tools-linux-${ANDROID_SDK_TOOLS}.zip
RUN unzip -d android-sdk-linux android-sdk.zip

#WORKDIR android-sdk-linux

RUN echo y | android-sdk-linux/tools/bin/sdkmanager "platforms;android-${ANDROID_COMPILE_SDK}" >/dev/null && \
		echo y | android-sdk-linux/tools/bin/sdkmanager "platform-tools" >/dev/null && \
		echo y | android-sdk-linux/tools/bin/sdkmanager "build-tools;${ANDROID_BUILD_TOOLS}" >/dev/null

#ENV ANDROID_HOME $PWD && \
#		PATH $PATH:$PWD/android-sdk-linux/platform-tools/ && \
#		chmod +x ./gradlew

#RUN set +o pipefail && \
#		yes | android-sdk-linux/tools/bin/sdkmanager --licenses && \
#		set -o pipefail


