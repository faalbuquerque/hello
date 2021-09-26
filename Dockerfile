FROM ruby:3.0.1
ADD . /hello-docker
WORKDIR /hello-docker
RUN bundle install

EXPOSE 4567

CMD ["/bin/bash"]