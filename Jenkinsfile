node{
  stage("Scm checkout"){
    git 'https://github.com/Rootbie/helloworld.git'
  }
  
  stage("Maven build"){
    sh 'mvn clean package'
  }
  
  stage("Build docker image"){
    sh 'docker build -t trinh00thien/helloworld:v2 .'
  }
  
  stage("Remove container"){
    sh 'docker container rm -f web-hello'
  }
  stage("Deploy docker image to Tomcat server"){
    sh 'docker run -p 7777:8080 -d --name web-hello trinh00thien/helloworld:v2'
  }
}
