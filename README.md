## The Idea
- Provide an effecient mechanism for building the Geoportal web application from source code
- Simplify the installation process by making some assumptions about the setup environment:
	- You're happy using Tomcat
	- You're happy using PostgreSQL
	- You're happy with having a single admin user, rather than a managed LDAP authentication system.
- Use Ant to deploy the compiled application to a development environment or a production environment

## Pre-requisites:
1. Tomcat 6.x installed with manager app
2. Apache Ant installed and functional: Must have access to `catalina-ant.jar`
	- This means finding `catalina-ant.jar` in Tomcat's `lib` directory, and copying it to Ant's `lib`
	- On Ubuntu, if you installated via `sudo apt-get install ant tomcat6`, you can probably `sudo ln -s /usr/share/tomcat6/lib/catalina-ant.jar /usr/share/ant/lib/`
3. PostgreSQL database engine setup and running
4. Database created and populated with Geoportal tables. `geoportal/etc/sql/schema_pg.sql` should do the trick.


## Installation
1. Copy this repository into a geoportal trunk checkout

		svn co https://geoportal.svn.sourceforge.net/svnroot/geoportal/Geoportal/trunk geoportal
		cd geoportal
		git clone git://github.com/usgin/usgin-geoportal-addon.git usgin
	
2. Copy `usgin/build/local.properties-example` to `usgin/build/local.properties`
3. Adjust the configuration options in `usgin/build/local.properties`. For a local, development environment and a remote, production environment, specify:
	- Tomcat Access information
	- Final Geoportal webapp URL
	- Database access information
	- Lucene index locations
	- Geoportal single login information
4. Download the appropriate PostgreSQL JDBC driver for your installation: [Download Page](http://jdbc.postgresql.org/download.html), place in `usgin/build/lib`
5. Run the Ant build.xml with the appropriate task, for example `ant local.deploy`.
	- clean: empty the build directory
	- local.package: Compile the source code and generate the application in the build directory. For a local disribution
	- remote.package: Same as above, but for a remote distribution
	- war: Bundle whatever is in the build directory into a .war file
	- local.deploy: Build the .war and deploy it locally
	- remote.deploy: Build the .war and deploy it remotely