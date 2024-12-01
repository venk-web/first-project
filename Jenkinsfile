pipeline{
    agent { label 'agent1' }
    stages{
        stage("Maven Build"){
            steps{
                sh "mvn clean package"
            }
        }
        stage("Dev Deploy"){
           steps{
              sshagent(['tomcat-deploy-key']) {
                // Copy war file to tomcat dev server
                sh "scp -o StrictHostKeyChecking=no target/doctor-online.war ec2-user@3.212.43.78:/opt/tomcat10/webapps/"
                // Restart tomcat server
                sh "ssh -o StrictHostKeyChecking=no ec2-user@3.212.43.78 /opt/tomcat10/bin/shutdown.sh"
                sh "ssh -o StrictHostKeyChecking=no ec2-user@3.212.43.78 /opt/tomcat10/bin/startup.sh"
              }
           } 
        }
    }
}
