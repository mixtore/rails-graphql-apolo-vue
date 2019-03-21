FROM ruby:2.5.4
RUN curl -sL https://deb.nodesource.com/setup_8.x | bash
RUN apt-get update -qq && apt-get install -y nodejs mysql-client

# Install Yarn
ENV PATH=/root/.yarn/bin:$PATH
RUN apt-get install curl && \
    touch ~/.bashrc && \
    curl -o- -L https://yarnpkg.com/install.sh | sh

RUN mkdir /app
WORKDIR /app
COPY Gemfile /app/Gemfile
COPY Gemfile.lock /app/Gemfile.lock
RUN bundle install
COPY . /app

# Add a script to be executed every time the container starts.
COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]
EXPOSE 3000

# Start the main process.
CMD ["rails", "server", "-b", "0.0.0.0"]