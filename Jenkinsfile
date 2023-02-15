node{
  stage('Scm checkout'){ 
    
    sshagent(['instanceForDocker']) {
      sh "ssh -o StrictHostKeyChecking=no ubuntu@172.31.225.27 git clone https://github.com/Rootbie/helloworld.git "
    }
  }
  
  stage('Maven build'){
    def mvnPackage = 'mvn clean package -f helloworld/pom.xml'
  
    sshagent(['instanceForDocker']) {
      sh "ssh -o StrictHostKeyChecking=no ubuntu@172.31.225.27 ${mvnPackage}"
    }
  }
  
  stage('Build docker image'){
    def dockerBuild = 'docker build -t trinh00thien/helloworld:v1 helloworld '
    
    sshagent(['instanceForDocker']) {
      sh "ssh -o StrictHostKeyChecking=no ubuntu@172.31.225.27 ${dockerBuild}"
    }
    
  }
  
  stage('Deploy docker image to Tomcat server'){
    def dockerRun = 'docker run -p 8109:8080 -d --name web-hello trinh00thien/helloworld:v1'
    
    sshagent(['instanceForDocker']) {
      sh "ssh -o StrictHostKeyChecking=no ubuntu@172.31.225.27 ${dockerRun}"
    }
  }
}
