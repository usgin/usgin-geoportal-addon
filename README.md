## The Idea
- Provide an effecient mechanism for building the Geoportal web application from source code
- Simplify the installation process by making some assumptions about the setup environment
- Use Ant to deploy the compiled application to a development environment or a production environment

## Pre-requisites:
1. Tomcat 6.x installed with manager app
2. Apache Ant installed and functional
3. PostgreSQL database engine setup and running
4. Database created and populated with Geoportal tables. `geoportal/etc/sql/schema_pg.sql` should do the trick.


## Installation
1. Copy local.properties-example to local.properties
2. Adjust the configuration options in local.properties. For a local, development environment and a remote, production environment, specify:
	- Tomcat Access information
	- Final Geoportal webapp URL
	- Database access information
	- Lucene index locations
	- Geoportal single login information
3. Download the appropriate PostgreSQL JDBC driver for your installation: [Download Page](http://jdbc.postgresql.org/download.html), place in `usgin/build/lib`
4. Run the Ant build.xml with the appropriate task
	- clean: empty the build directory
	- local.package: Compile the source code and generate the application in the build directory. For a local disribution
	- remote.package: Same as above, but for a remote distribution
	- war: Bundle whatever is in the build directory into a .war file
	- local.deploy: Build the .war and deploy it locally
	- remote.deploy: Build the .war and deploy it remotely