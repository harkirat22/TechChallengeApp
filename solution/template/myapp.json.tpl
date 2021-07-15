[
  {
    "name": "myapp",
    "image": "${app_image}",
    "cpu": ${fargate_cpu},
    "memory": ${fargate_memory},
    "networkMode": "awsvpc",
    "logConfiguration": {
        "logDriver": "awslogs",
        "options": {
          "awslogs-group": "/ecs/myapp",
          "awslogs-region": "${aws_region}",
          "awslogs-stream-prefix": "ecs"
        }
    },
    "portMappings": [
      {
        "containerPort": ${app_port},
        "hostPort": ${app_port}
      }
    ],
    "environment": [
            {
                "name": "VTT_DBUSER",
                "value": "${db_user}"
            },
            {
                "name": "VTT_DBHOST",
                "value": "${db_host}"
            },
            {
                "name": "VTT_DBNAME",
                "value": "postgres"
            },
            {
                "name": "VTT_DBPORT",
                "value": "5432"
            },
            {
                "name": "VTT_LISTENHOST",
                "value": "0.0.0.0"
            },
            {
                "name": "VTT_LISTENPORT",
                "value": "3000"
            },
            {
                "name": "VTT_DBPASSWORD",
                "value": "${db_password}"
            }
        ]
  }
]
