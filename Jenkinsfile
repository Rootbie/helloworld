node{
  stage("Scm checkout"){
    git 'https://github.com/Rootbie/helloworld.git'
  }
  
  stage("Maven build"){
    sh 'mvn clean package'
  }
  
  stage("Build docker image"){
    sh 'docker build -t trinh00thien/helloworld:v1 .'
  }
  
  stage("Deploy docker image to Tomcat server"){
    sh 'docker run -p 8109:8080 -d --name web-hello trinh00thien/helloworld:v1'
  }
}
