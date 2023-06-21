node {
    stage('Checkout local') {
        // Checkout your source code from version control system
        checkout scmGit(branches: [[name: '*/master']], extensions: [], userRemoteConfigs: [[url: '/home/test/simple-java-maven-app']])
    }

    stage('Build') {
        docker.image('maven:3.9.0-eclipse-temurin-11').inside('-v /root/.m2:/root/.m2') {
            sh 'mvn -B -DskipTests clean package'
        }
    }

    stage('Test') {
        docker.image('maven:3.9.0-eclipse-temurin-11').inside('-v /root/.m2:/root/.m2') {
            sh 'mvn test'
        }
    }

    stage('Manual Approval'){
	docker.image('maven:3.9.0-eclipse-temurin-11').inside('-v /root/.m2:/root/.m2') {
		input message: 'Lanjutkan ke tahap Deploy? (Klik "Proceed" untuk lanjut)'
	}
    }

    stage('Deploy') {
        docker.image('maven:3.9.0-eclipse-temurin-11').inside('-v /root/.m2:/root/.m2') {
            sh './jenkins/scripts/deliver.sh'
        }
	sleep(60)
    }
}
