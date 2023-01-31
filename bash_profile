if [ -f ~/.bashrc ]; then
   source ~/.bashrc
fi
export GOPATH="/home/hechuan/gopath"
export GO111MODULE="auto"
export GOBIN="/home/hechuan/gopath/bin"
export PATH="$GOPATH/bin:$PATH"
export PATH="/home/hechuan/protoc-3.12.3/bin:$PATH"
export PATH="/usr/local/go/bin:$PATH"
export PATH="/home/hechuan/.local/bin:$PATH"

#export JAVA_HOME="/usr/lib/jvm/java-8-openjdk-amd64"
export JAVA_HOME="/usr/lib/jvm/java-12-openjdk-amd64"
export PATH=$JAVA_HOME/bin:$PATH
export CLASSPATH=.:$JAVA_HOME/lib/dt.jar:$JAVA_HOME/lib/tools.jar
