node{
  stage('1. Scm checkout'){ 
    def gitCmd = 'git clone https://github.com/Rootbie/helloworld.git'
    
    sshagent(['instanceForDocker']) {
      // Remove existing git project 
      sh "ssh -o StrictHostKeyChecking=no ubuntu@172.31.225.27 rm -rf helloworld "
      
      // Clone a new git prj
      sh "ssh -o StrictHostKeyChecking=no ubuntu@172.31.225.27 ${gitCmd} "
    }
  }
  
  stage('2. Maven build'){
    def mvnPackage = 'mvn clean package -f helloworld/pom.xml'
  
    sshagent(['instanceForDocker']) {
      sh "ssh -o StrictHostKeyChecking=no ubuntu@172.31.225.27 ${mvnPackage}"
    }
  }
  
  stage('3. Build docker image'){
    def dockerBuild = 'docker build -t trinh00thien/helloworld:v1 helloworld '
    
    sshagent(['instanceForDocker']) {
      sh "ssh -o StrictHostKeyChecking=no ubuntu@172.31.225.27 ${dockerBuild}"
    }
  }
  
  stage('5. Deploy docker image to Tomcat server'){
    def dockerRun = 'docker run -p 8109:8080 -d --name web-hello trinh00thien/helloworld:v1'
    
    sshagent(['instanceForDocker']) {
      sh "ssh -o StrictHostKeyChecking=no ubuntu@172.31.225.27 ${dockerRun}"
    }
  }
}
