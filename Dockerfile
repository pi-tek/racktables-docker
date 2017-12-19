FROM fedora:latest
LABEL maintainer="thomaskrasowski@hotmail.com"
# MySQL:
RUN dnf install -y community-mysql-server community-mysql-devel

# Apache/PHP:
RUN yum install -y httpd php php-mysql php-pdo php-gd php-snmp php-mbstring php-bcmath
# To enable Unicode, add "character-set-server=utf8" line to "[mysqld]" section of "/etc/my.cnf" file and restart mysqld.


# Install dev tools
RUN dnf install -y git-core zlib zlib-devel gcc-c++ patch readline readline-devel libyaml-devel libffi-devel openssl-devel make bzip2 autoconf automake libtool bison curl sqlite-devel

# Install ruby
RUN dnf install -y ruby ruby-rdoc ruby-devel rubygems
RUN gem update
RUN gem update --system

# Clone racktables
ENV HOME /var/www/html
RUN git clone https://github.com/pi-tek/racktables.git $HOME/racktables

#
