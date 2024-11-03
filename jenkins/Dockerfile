from jenkins/jenkins:lts-alpine-jdk17

user root
run apk add jq

user jenkins
run jenkins-plugin-cli --plugins \
    $(f=$(mktemp) && unzip -p /usr/share/jenkins/jenkins.war "WEB-INF/lib/jenkins-core-*.jar" > "$f" && unzip -p "$f" jenkins/install/platform-plugins.json | jq -r '.[].plugins[].name' && rm "$f") \
    authorize-project job-dsl

copy /jenkins-config.yaml /jenkins-config.yaml
env CASC_JENKINS_CONFIG=/jenkins-config.yaml

env JENKINS_JAVA_OPTS=-Dhudson.security.csrf.GlobalCrumbIssuerConfiguration.DISABLE_CSRF_PROTECTION=true

# copy /logging.properties /logging.properties
# env JENKINS_JAVA_OPTS=-Djava.util.logging.config.file=/logging.properties $JENKINS_JAVA_OPTS
