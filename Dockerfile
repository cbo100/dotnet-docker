FROM microsoft/dotnet:2.2.103-sdk-stretch

# Create the home directory for the new app user.
RUN mkdir -p /home/builduser

# Create an app user so our program doesn't run as root.
RUN groupadd -g 1000 -r buildusers &&\
    useradd -u 1000 -r -g builduser -d /home/builduser -s /sbin/nologin -c "Docker image user" builduser

# Set the home directory to our app user's home.
ENV HOME=/home/builduser
ENV APP_HOME=/home/builduser/my-project

## SETTING UP THE APP ##
RUN mkdir $APP_HOME
WORKDIR $APP_HOME

# ***
# Do any custom logic needed prior to adding your code here
# ***

# Copy in the application code.
ADD . $APP_HOME

# Chown all the files to the app user.
RUN chown -R builduser:buildusers $APP_HOME

# Change to the app user.
USER builduser