# Databricks CLI - Cheat sheet

### Log in
```databricks configure --token```

### Copy a file to DBFS 
```databricks fs cp test.txt dbfs:/test.txt```

```databricks fs cp -r test-dir dbfs:/test-dir```

### Copy a file from DBFS
```databricks fs cp dbfs:/test.txt ./test.txt```

```databricks fs cp -r dbfs:/test-dir ./test-dir```

### List workspace files
```databricks workspace ls /Users/algonzalez@plainconcepts.com```

### Import a local directory of notebooks
```databricks workspace import\_dir . /Users/algonzalez@plainconcepts.com```

```databricks workspace ls /Users/algonzalez@plainconcepts.com -l```

### Export a workspace folder to the local filesystem
```databricks workspace export\_dir /Users/algonzalez@plainconcepts.com .```

### List runtime versions
```databricks clusters spark-versions```

### List node types
```databricks clusters list-node-types```

### List groups databricks groups list

### List the members of admins
```databricks groups list-members --group-name admins```

### Add group finance databricks groups create --group-name finance
```databricks groups list```

```databricks jobs list | grep "JOB_NAME"```

### Install a JAR from DBFS
```databricks libraries install --cluster-id $CLUSTER_ID --jar dbfs:/test-dir/test.jar```

### List library statuses for a cluster
```databricks libraries list --cluster-id $CLUSTER_ID```

### Create secret scope
```databricks secrets create-scope --scope my-scope --initial-manage-principal users```

### List secret scopes
```databricks secrets list-scopes```

### Delete secret scopes
```databricks secrets delete-scope --scope my-scope```

### Create secrets
```databricks secrets put --scope my-scope --key my-key --string-value my-value```

### List secrets
```databricks secrets list --scope my-scope databricks secrets delete --scope my-scope --key my-key```
