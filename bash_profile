if [ -f ~/.bashrc ]; then
   source ~/.bashrc
fi
export GOPATH="/home/hechuan/gopath"
export GO111MODULE="auto"
export PATH="$GOPATH/bin:$PATH"

#export JAVA_HOME="/usr/lib/jvm/java-8-openjdk-amd64"
export JAVA_HOME="/usr/lib/jvm/java-12-openjdk-amd64"
export PATH=$JAVA_HOME/bin:$PATH
export CLASSPATH=.:$JAVA_HOME/lib/dt.jar:$JAVA_HOME/lib/tools.jar
