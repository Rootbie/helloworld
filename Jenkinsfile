node{
  stage('1. Scm checkout'){ 
    def gitCmd = 'git clone https://github.com/Rootbie/helloworld.git'
    
    sshagent(['instanceForDocker']) {
      // Remove existing git project 
      sh "ssh ubuntu@172.31.225.27 rm -rf helloworld "
      
      // Clone a new git prj
      sh "ssh ubuntu@172.31.225.27 ${gitCmd} "      
    }
  }
  
  stage('2. Maven build'){
    def mvnPackage = 'mvn clean package -f helloworld/pom.xml'
  
    sshagent(['instanceForDocker']) {
      sh "ssh ubuntu@172.31.225.27 ${mvnPackage}"
    }
  }
  
  stage('3. Build docker image'){
    def dockerBuild = 'docker build -t trinh00thien/helloworld:v3 helloworld '
    
    sshagent(['instanceForDocker']) {
      sh "ssh ubuntu@172.31.225.27 ${dockerBuild}"
    }
  }
  
  stage('4. Remove container'){
    def dockerRm = 'docker rm -f web-hello'
     sshagent(['instanceForDocker']) {
       sh "ssh  ubuntu@172.31.225.27 ${dockerRm}"
    }
  }
  
  stage('5. Deploy docker image to Tomcat server'){
    def dockerRun = 'docker run -p 23456:8080 -d --name web-hello trinh00thien/helloworld:v3 '
    
    sshagent(['instanceForDocker']) {
      sh "ssh  ubuntu@172.31.225.27 ${dockerRun}"
    }
  }
  
  stage('6. Upload Docker image to Docker Hub') {
    def dockerPush = 'docker image push trinh00thien/helloworld:v3'

    sshagent(['instanceForDocker']) {
      sh "ssh ubuntu@172.31.225.27 ${dockerPush}"
    }
  }
}
