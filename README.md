spring-extjs-sample
===================

simple spring mvc application with bootstrap skin and extjs grid component and embedded H2 database.

application consists of three pages.
main page displays all company's employees in a sortable manner.
the other two pages displays employees from departments A and B.
server storage relies on in-memory H2 database with Hibernate/JPA api's.

project is built with maven.
no need to download extjs, bootstrap or jquery separately. all dependencies are managed by maven.
just run 'mvn package' and deploy 'sample.war' from project's 'target' dir to your servlet container. 



tested on:

- os: Linux 3.2.0-4-amd64 #1 SMP Debian 3.2.46-1 x86_64 GNU/Linux
- java: 1.7.0_40-b43
- maven: 3.1.0
- tomcat 7.0.42



known limitations and drawbacks:

- application assembly isn't very efficient due to resources unpack in process-resources build phase. a better approach might be creation of a custom resource handler to retrieve content from jars on a classpath.
- REST service retrieves all data from storage without paging so it can't be used for sufficently large amounts of data.
