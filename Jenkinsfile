pipeline {
       
    agent { label 'deploy-node' }
    
    triggers { pollSCM '' }
    
    stages{

    stage ('get dockerfile') {               
                steps{
                      sh '''
                      sudo rm -f Dockerfile
                      sudo wget https://raw.githubusercontent.com/chandu569/chandutask/master/Dockerfile
                      '''
                }}
    stage ('build image') {
	            steps{     
                      sh '''
                      if [ "$(docker ps -q -f name=react-app-con)" ]; then
                         docker stop react-app-con
                      fi
                      if [ "$(docker ps -aq -f status=exited -f name=react-app-con)" ]; then
                         docker rm react-app-con
                      fi
                      if [ "$(docker images -q myimage:mytag)" ]; then
                         docker rmi react-app-img
                      fi
                      docker build -t react-app-img .
                '''      
                }}
    stage ('run and deploy') {               
                steps{
                      sh 'docker run -dit -p 3000:3000 --name react-app-con react-app-img'
                }}
                
    }    
}
