export PATH=/usr/local/bin:/usr/local/mybin:/usr/local/opt/tomcat@8.0/bin:$HOME/.nodebrew/current/bin:$(brew --prefix homebrew/php/php71)/bin:$HOME/Library/Android/sdk/platform-tools:/usr/local/sonar-scanner/bin:$HOME/.rbenv/bin:$PATH
export PGDATA=/usr/local/var/postgres
export LESSCHARSET=utf-8
export LANG=ja_JP.UTF-8
export JAVA_HOME=`/usr/libexec/java_home -v 1.8`

export CLASSPATH=.:$JAVA_HOME/lib/mysql-connector-java-5.1.42-bin.jar


#prompt
PROMPT='%F{cyan}[%d]
$%f '
