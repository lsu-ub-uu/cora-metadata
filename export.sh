#! /bin/bash

baseDir="dbfiles"

dockerName="systemone-docker-postgresql"

start(){
	echo "Exporting data from docker "$dockerName
	docker exec  -i $dockerName bash < runInsideDocker.sh
	echo "Copying files to local export folder..."
	docker cp $dockerName:/$baseDir/cora ./$baseDir
	docker cp $dockerName:/$baseDir/jsClient ./$baseDir
	docker cp $dockerName:/$baseDir/testSystem ./$baseDir
}

start